local Lib = LibStub("NoobTaco-Config-1.0")
if not _G.NOOBTACO_CONFIG_SHOULD_LOAD then return end

local ConfigRenderer = Lib.Renderer

local Theme = Lib.Theme
local State = Lib.State
local PixelUtil = Lib.PixelUtil or PixelUtil

-- Simple Object Pool
local FramePool = {}

-- Reset frame state when retrieving from pool
local function ResetFrame(frame, _)
  -- Clear common scripts to prevent stale handlers (use pcall since not all frames support all scripts)
  pcall(function() frame:SetScript("OnClick", nil) end)
  pcall(function() frame:SetScript("OnValueChanged", nil) end)
  pcall(function() frame:SetScript("OnEnter", nil) end)
  pcall(function() frame:SetScript("OnLeave", nil) end)
  pcall(function() frame:SetScript("OnEditFocusLost", nil) end)
  pcall(function() frame:SetScript("OnTextChanged", nil) end)

  -- Clear text content for common sub-elements
  if frame.text then frame.text:SetText("") end
  if frame.Text then frame.Text:SetText("") end
  if frame.Title then frame.Title:SetText("") end
  if frame.Label then frame.Label:SetText("") end
  if frame.Low then frame.Low:SetText("") end
  if frame.High then frame.High:SetText("") end
  if frame.Value then frame.Value:SetText("") end
  -- About frame specific
  if frame.Version then frame.Version:SetText("") end
  if frame.Description then frame.Description:SetText("") end

  -- Clear custom properties
  frame.style = nil
  frame.customColors = nil
  frame.severity = nil
  frame.expanded = nil

  -- NOTE: Don't Show() here - visibility is handled later in GetFrame after SetParent
end

local function GetFrame(frameType, parent)
  if not FramePool[frameType] then FramePool[frameType] = {} end
  local pool = FramePool[frameType]
  local frame = table.remove(pool)

  if not frame then
    -- Create new frame based on type
    if frameType == "checkbox" then
      frame = CreateFrame("CheckButton", nil, parent, "ChatConfigCheckButtonTemplate")
      if frame.Text then Theme:ApplyFont(frame.Text, "Normal", 12) end
    elseif frameType == "slider" then
      frame = CreateFrame("Slider", nil, parent, "BackdropTemplate")
      frame:SetOrientation("HORIZONTAL")
      frame:SetHeight(14) -- Thinner bar
      frame:SetBackdrop({
        bgFile = "Interface/Buttons/WHITE8X8",
        edgeFile = "Interface/Buttons/WHITE8X8",
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
      })
      frame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
      frame:SetBackdropColor(0.1, 0.1, 0.1, 1)

      -- Thumb
      local thumb = frame:CreateTexture(nil, "ARTWORK")
      thumb:SetSize(12, 12)
      thumb:SetColorTexture(1, 0.82, 0) -- Default highlight color
      frame:SetThumbTexture(thumb)
      frame.Thumb = thumb

      frame.Text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      Theme:ApplyFont(frame.Text, "Normal", 12)
      frame.Text:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, 5)

      frame.Low = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
      Theme:ApplyFont(frame.Low, "Normal", 10)
      frame.Low:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, -2)

      frame.High = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
      Theme:ApplyFont(frame.High, "Normal", 10)
      frame.High:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, -2)

      frame.Value = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
      Theme:ApplyFont(frame.Value, "Normal", 12)
      frame.Value:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", 0, 5)
    elseif frameType == "button" then
      frame = Theme:CreateThemedButton(parent)
      -- NOTE: Hover handlers are set in CreateThemedButton() but cleared by ResetFrame()
      -- They will be re-applied below after pool retrieval
    elseif frameType == "alert" then
      frame = CreateFrame("Frame", nil, parent)
      frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      Theme:ApplyFont(frame.text, "Normal", 12)
      frame.text:SetAllPoints()
      frame.bg = frame:CreateTexture(nil, "BACKGROUND")
      frame.bg:SetAllPoints()
    elseif frameType == "description" then
      frame = CreateFrame("Frame", nil, parent)
      frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
      Theme:ApplyFont(frame.text, "Normal", 12)
      frame.text:SetAllPoints()
      frame.text:SetJustifyH("LEFT")
      frame.text:SetJustifyV("TOP")
    elseif frameType == "header" then
      frame = CreateFrame("Frame", nil, parent)
      frame.text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
      Theme:ApplyFont(frame.text, "Bold", 14)
      frame.text:SetPoint("TOPLEFT", 0, 0)
      frame.line = frame:CreateTexture(nil, "ARTWORK")
      frame.line:SetHeight(1)
      frame.line:SetColorTexture(1, 1, 1, 0.2)
      frame.line:SetPoint("TOPLEFT", frame.text, "BOTTOMLEFT", 0, -5)
      frame.line:SetPoint("RIGHT", frame, "RIGHT", 0, 0)
    elseif frameType == "card" then
      -- Card container with header and bordered content area
      frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
      frame:SetBackdrop({
        bgFile = "Interface/Buttons/WHITE8X8",
        edgeFile = "Interface/Buttons/WHITE8X8",
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
      })
      frame:SetBackdropColor(0.1, 0.1, 0.12, 0.8) -- Slightly transparent dark background
      frame:SetBackdropBorderColor(0.3, 0.3, 0.3, 1)

      -- Header bar at top (inset by 1px to not cover border)
      frame.Header = CreateFrame("Frame", nil, frame)
      frame.Header:SetPoint("TOPLEFT", 1, -1)
      frame.Header:SetPoint("TOPRIGHT", -1, -1)
      frame.Header:SetHeight(28)

      frame.HeaderBg = frame.Header:CreateTexture(nil, "BACKGROUND")
      frame.HeaderBg:SetAllPoints()
      frame.HeaderBg:SetColorTexture(0.15, 0.15, 0.2, 1) -- Darker header

      frame.Title = frame.Header:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      Theme:ApplyFont(frame.Title, "Bold", 13)
      frame.Title:SetPoint("LEFT", 9, 0)
      frame.Title:SetTextColor(0.6, 0.7, 0.8) -- Blue/Grey text

      -- Content area for children (inset from border)
      frame.Content = CreateFrame("Frame", nil, frame)
      frame.Content:SetPoint("TOPLEFT", frame.Header, "BOTTOMLEFT", 9, -10)
      frame.Content:SetPoint("BOTTOMRIGHT", -10, 10)

      -- Theme Update for Card: MOVED to shared block below
      -- Theme:RegisterT(frame)
    elseif frameType == "editbox" then
      frame = CreateFrame("EditBox", nil, parent, "BackdropTemplate")
      frame:SetAutoFocus(false)
      frame:SetTextInsets(8, 8, 0, 0)
      frame:SetBackdrop({
        bgFile = "Interface/Buttons/WHITE8X8",
        edgeFile = "Interface/Buttons/WHITE8X8",
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
      })
      frame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
      frame:SetBackdropColor(0.1, 0.1, 0.1, 1)

      frame.Label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      Theme:ApplyFont(frame.Label, "Normal", 12)
      -- EditBox is a FontInstance, apply directly
      Theme:ApplyFont(frame, "Normal", 12)
      frame.Label:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, 5)
    elseif frameType == "dropdown" then
      frame = CreateFrame("Button", nil, parent, "BackdropTemplate")
      -- Custom Dropdown-like appearance matching 'media'
      frame:SetBackdrop({
        bgFile = "Interface/Buttons/WHITE8X8",
        edgeFile = "Interface/Buttons/WHITE8X8",
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
      })
      frame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
      frame:SetBackdropColor(0.1, 0.1, 0.1, 1)

      frame.Text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
      Theme:ApplyFont(frame.Text, "Normal", 12)
      frame.Text:SetPoint("LEFT", 8, 0)
      frame.Text:SetPoint("RIGHT", -24, 0)
      frame.Text:SetJustifyH("LEFT")

      -- Chevron/Arrow
      frame.Arrow = frame:CreateTexture(nil, "ARTWORK")
      frame.Arrow:SetPoint("RIGHT", -6, 0)
      frame.Arrow:SetSize(12, 12)
      frame.Arrow:SetTexture("Interface/ChatFrame/ChatFrameExpandArrow")

      frame.Label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      Theme:ApplyFont(frame.Label, "Normal", 12)
      frame.Label:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, 5)

      -- Popup Frame (similar to media)
      frame.Popup = CreateFrame("Frame", nil, frame, "BackdropTemplate")
      frame.Popup:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, -2)
      frame.Popup:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, -2)
      frame.Popup:SetHeight(200)
      frame.Popup:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
      })
      frame.Popup:SetBackdropColor(0.1, 0.1, 0.1, 0.95)
      frame.Popup:SetFrameStrata("DIALOG")
      frame.Popup:Hide()

      frame.Popup.ScrollFrame = CreateFrame("ScrollFrame", nil, frame.Popup, "UIPanelScrollFrameTemplate")
      frame.Popup.ScrollFrame:SetPoint("TOPLEFT", 5, -5)
      frame.Popup.ScrollFrame:SetPoint("BOTTOMRIGHT", -26, 5)

      frame.Popup.Content = CreateFrame("Frame", nil, frame.Popup.ScrollFrame)
      frame.Popup.Content:SetSize(1, 1)
      frame.Popup.ScrollFrame:SetScrollChild(frame.Popup.Content)
    elseif frameType == "colorpicker" then
      frame = CreateFrame("Button", nil, parent)
      frame:SetSize(20, 20)
      frame.swatch = frame:CreateTexture(nil, "OVERLAY")
      frame.swatch:SetAllPoints()
      frame.swatch:SetColorTexture(1, 1, 1)
      frame.Label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      Theme:ApplyFont(frame.Label, "Normal", 12)
      frame.Label:SetPoint("LEFT", frame, "RIGHT", 10, 0)

      -- Border
      frame.border = frame:CreateTexture(nil, "BACKGROUND")
      frame.border:SetPoint("TOPLEFT", -1, 1)
      frame.border:SetPoint("BOTTOMRIGHT", 1, -1)
      frame.border:SetColorTexture(0.5, 0.5, 0.5)
      frame.border:SetColorTexture(0.5, 0.5, 0.5)
    elseif frameType == "media" then
      frame = CreateFrame("Button", nil, parent, "BackdropTemplate")
      -- Basic Dropdown-like appearance
      frame:SetBackdrop({
        bgFile = "Interface/Buttons/WHITE8X8",
        edgeFile = "Interface/Buttons/WHITE8X8",
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
      })
      frame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
      frame:SetBackdropColor(0.1, 0.1, 0.1, 1)

      frame.Text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
      Theme:ApplyFont(frame.Text, "Normal", 12)
      frame.Text:SetPoint("LEFT", 8, 0)
      frame.Text:SetPoint("RIGHT", -24, 0)
      frame.Text:SetJustifyH("LEFT")

      -- Chevron/Arrow
      frame.Arrow = frame:CreateTexture(nil, "ARTWORK")
      frame.Arrow:SetPoint("RIGHT", -6, 0)
      frame.Arrow:SetSize(12, 12)
      frame.Arrow:SetTexture("Interface/ChatFrame/ChatFrameExpandArrow")

      frame.Label = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      Theme:ApplyFont(frame.Label, "Normal", 12)
      frame.Label:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, 5)

      -- Popup Frame (Lazy created per instance for now)
      frame.Popup = CreateFrame("Frame", nil, frame, "BackdropTemplate")
      frame.Popup:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, -2)
      frame.Popup:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, -2)
      frame.Popup:SetHeight(200) -- Max height
      frame.Popup:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
      })
      frame.Popup:SetBackdropColor(0.1, 0.1, 0.1, 0.95)
      frame.Popup:SetFrameStrata("DIALOG")
      frame.Popup:Hide()

      -- ScrollFrame for Popup
      frame.Popup.ScrollFrame = CreateFrame("ScrollFrame", nil, frame.Popup, "UIPanelScrollFrameTemplate")
      frame.Popup.ScrollFrame:SetPoint("TOPLEFT", 5, -5)
      frame.Popup.ScrollFrame:SetPoint("BOTTOMRIGHT", -26, 5)

      frame.Popup.Content = CreateFrame("Frame", nil, frame.Popup.ScrollFrame)
      frame.Popup.Content:SetSize(1, 1)
      frame.Popup.ScrollFrame:SetScrollChild(frame.Popup.Content)
    elseif frameType == "dropdown_item" then
      frame = CreateFrame("Button", nil, parent)
      local hl = frame:CreateTexture(nil, "HIGHLIGHT")
      hl:SetAllPoints()
      hl:SetColorTexture(1, 0.82, 0, 0.2)

      frame.Text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
      Theme:ApplyFont(frame.Text, "Normal", 12)
      frame.Text:SetPoint("LEFT", 5, 0)
    elseif frameType == "media_item" then
      frame = CreateFrame("Button", nil, parent)
      local hl = frame:CreateTexture(nil, "HIGHLIGHT")
      hl:SetAllPoints()
      hl:SetColorTexture(1, 0.82, 0, 0.2)

      frame.Text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
      frame.Text:SetPoint("LEFT", 5, 0)

      -- Play Button (Music Note)
      local playBtn = CreateFrame("Button", nil, frame)
      playBtn:SetSize(16, 16)
      playBtn:SetPoint("RIGHT", -10, 0)
      frame.PlayButton = playBtn

      local icon = playBtn:CreateTexture(nil, "ARTWORK")
      icon:SetAllPoints()
      playBtn.Icon = icon
    elseif frameType == "callout" then
      frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
      frame:SetBackdrop({
        bgFile = "Interface/Tooltips/UI-Tooltip-Background",
        edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
        tile = true,
        tileSize = 16,
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
      })
      frame:SetBackdropBorderColor(1, 0.82, 0, 1) -- Default Gold (Handled in UpdateTheme)
      frame:SetBackdropColor(0.2, 0.2, 0.2, 0.9)  -- Dark BG

      frame.Title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
      Theme:ApplyFont(frame.Title, "Bold", 14)
      frame.Title:SetPoint("TOPLEFT", 10, -10)
      -- frame.Title:SetTextColor(1, 0.82, 0) -- Gold Title (Handled in UpdateTheme)

      frame.Text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
      Theme:ApplyFont(frame.Text, "Normal", 12)
      frame.Text:SetPoint("TOPLEFT", frame.Title, "BOTTOMLEFT", 0, -5)
      frame.Text:SetPoint("RIGHT", frame, "RIGHT", -10, 0)
      frame.Text:SetJustifyH("LEFT")

      frame.Button = Theme:CreateThemedButton(frame)
      frame.Button:SetPoint("BOTTOMLEFT", 10, 10)
      frame.Button:SetSize(200, 30)

      -- Custom button style for callout
      -- frame.Button.customColors = { ... } -- Handled in UpdateTheme
      Theme:UpdateButtonState(frame.Button) -- Apply immediately

      -- Force Text Color to Black always (since gold button needs black text)
      frame.Button.Text:SetTextColor(0, 0, 0, 1)

      -- Override UpdateTheme to maintain black text
      frame.Button.UpdateTheme = function(b)
        Theme:UpdateButtonState(b)
        b.Text:SetTextColor(0, 0, 0, 1)
      end

      -- Theme Update for Callout: MOVED to shared block below
      -- Theme:RegisterT(frame)
    elseif frameType == "about" then
      frame = CreateFrame("Frame", nil, parent, "BackdropTemplate")
      frame:SetBackdrop({
        bgFile = "Interface/Buttons/WHITE8X8",
        edgeFile = "Interface/Buttons/WHITE8X8",
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
      })
      frame:SetBackdropColor(0.1, 0.1, 0.1, 0.5)
      frame:SetBackdropBorderColor(0, 0, 0, 1)

      -- Icon
      frame.Icon = frame:CreateTexture(nil, "ARTWORK")
      frame.Icon:SetSize(64, 64)
      frame.Icon:SetPoint("TOPLEFT", 10, -10)

      -- Title
      frame.Title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
      Theme:ApplyFont(frame.Title, "Bold", 24)
      frame.Title:SetPoint("TOPLEFT", frame.Icon, "TOPRIGHT", 15, -5)
      frame.Title:SetTextColor(1, 1, 1)

      -- Version
      frame.Version = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
      Theme:ApplyFont(frame.Version, "Normal", 12)
      frame.Version:SetPoint("BOTTOMLEFT", frame.Title, "BOTTOMRIGHT", 5, 2)
      frame.Version:SetTextColor(0.6, 0.6, 0.6)

      -- Description
      frame.Description = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
      Theme:ApplyFont(frame.Description, "Normal", 12)
      frame.Description:SetPoint("TOPLEFT", frame.Title, "BOTTOMLEFT", 0, -10)
      frame.Description:SetPoint("RIGHT", -10, 0)
      frame.Description:SetJustifyH("LEFT")
      frame.Description:SetJustifyV("TOP")
      frame.Description:SetWordWrap(true)

      -- Link Container
      frame.Links = CreateFrame("Frame", nil, frame)
      frame.Links:SetPoint("TOPLEFT", frame.Icon, "BOTTOMLEFT", 0, -15)
      frame.Links:SetSize(1, 30)
      -- Theme Update for About: MOVED to shared block below
    else
      frame = CreateFrame("Frame", nil, parent)
    end

    -- moved registration here to happen only once per frame lifetime
    if frame.UpdateTheme then
      -- If widget already defined UpdateTheme (e.g. from a previous pass or weird structure), register it.
      -- BUT we are consolidating them below, so this check is primarily for legacy/safety.
      Theme:RegisterT(frame)
    elseif frameType == "card" then
      frame.UpdateTheme = function(self)
        Theme:ApplyFont(self.Title, "Bold", 13)

        -- Header Background (Integrated with button themes)
        local hr, hg, hb, ha = Theme:GetColor("button_normal")
        self.HeaderBg:SetColorTexture(hr, hg, hb, ha)

        -- Border Color (Theme Accent)
        local br, bg, bb, ba = Theme:GetColor("border")
        self:SetBackdropBorderColor(br, bg, bb, ba)

        -- Backdrop Color (Theme Background with slight lift)
        local bkr, bkg, bkb, bka = Theme:GetColor("background")
        self:SetBackdropColor(bkr, bkg, bkb, math.min(bka + 0.1, 1))

        -- Title Color (Theme Header color)
        local tr, tg, tb = Theme:GetColor("header")
        self.Title:SetTextColor(tr, tg, tb)

        -- Update processed text with theme tokens
        if self.rawText then
          self.Title:SetText(Theme:ProcessText(self.rawText))
        end
      end
      Theme:RegisterT(frame)
    elseif frameType == "about" then
      frame.UpdateTheme = function(self)
        Theme:ApplyFont(self.Title, "Bold", 24)
        Theme:ApplyFont(self.Version, "Normal", 12)
        Theme:ApplyFont(self.Description, "Normal", 13)

        self.Title:SetTextColor(Theme:GetColor("header"))
        self.Version:SetTextColor(0.6, 0.6, 0.6)

        if self.rawTitle then self.Title:SetText(Theme:ProcessText(self.rawTitle)) end
        if self.rawVersion then self.Version:SetText(Theme:ProcessText(self.rawVersion)) end
        if self.rawDescription then self.Description:SetText(Theme:ProcessText(self.rawDescription)) end
      end
      Theme:RegisterT(frame)
    elseif frameType == "callout" then
      frame.UpdateTheme = function(self)
        Theme:ApplyFont(self.Title, "Bold", 14)
        Theme:ApplyFont(self.Text, "Normal", 12)

        -- Apply colors based on severity
        local severity = self.severity or "info"
        local r, g, b = Theme:GetAlertColor(severity)

        self:SetBackdropBorderColor(r, g, b, 1)
        self.Title:SetTextColor(r, g, b)

        -- Update processed text with theme tokens
        if self.rawText then
          self.Text:SetText(Theme:ProcessText(self.rawText))
        end
        if self.rawTitle then
          self.Title:SetText(Theme:ProcessText(self.rawTitle))
        end

        -- Button
        self.Button.customColors = Theme:GetButtonColorsForAlert(severity)
        Theme:UpdateButtonState(self.Button)
      end
      Theme:RegisterT(frame)
    elseif frameType == "alert" then
      frame.UpdateTheme = function(self)
        local severity = self.severity or "info"
        local r, g, b = Theme:GetAlertColor(severity)
        self.bg:SetColorTexture(r, g, b, 0.2)
        self.text:SetTextColor(r, g, b, 1)
        Theme:ApplyFont(self.text, "Normal", 12)
        if self.rawText then
          self.text:SetText(Theme:ProcessText(self.rawText))
        end
      end
      Theme:RegisterT(frame)
    elseif frameType == "header" then
      frame.UpdateTheme = function(self)
        Theme:ApplyFont(self.text, "Bold", 14)
        self.text:SetTextColor(Theme:GetColor("header"))
        if self.rawText then
          self.text:SetText(Theme:ProcessText(self.rawText))
        end
      end
      Theme:RegisterT(frame)
    elseif frameType == "description" then
      frame.UpdateTheme = function(self)
        Theme:ApplyFont(self.text, "Normal", 12)
        self.text:SetTextColor(Theme:GetColor("text"))
        if self.rawText then
          self.text:SetText(Theme:ProcessText(self.rawText))
        end
      end
      Theme:RegisterT(frame)
    elseif frameType == "checkbox" then
      frame.UpdateTheme = function(self)
        if self.Text then
          Theme:ApplyFont(self.Text, "Normal", 12)
          self.Text:SetTextColor(Theme:GetColor("text"))
          if self.rawText then
            self.Text:SetText(Theme:ProcessText(self.rawText))
          end
        end
      end
      Theme:RegisterT(frame)
    elseif frameType == "editbox" then
      frame.UpdateTheme = function(self)
        Theme:ApplyFont(self.Label, "Normal", 12)
        self.Label:SetTextColor(Theme:GetColor("text"))
        Theme:ApplyFont(self, "Normal", 12)
        self:SetTextColor(Theme:GetColor("text"))
        local r, g, b = Theme:GetColor("border")
        self:SetBackdropBorderColor(r, g, b, 1)
      end
      Theme:RegisterT(frame)
    elseif frameType == "dropdown" then
      frame.UpdateTheme = function(self)
        Theme:ApplyFont(self.Label, "Normal", 12)
        self.Label:SetTextColor(Theme:GetColor("text"))
        Theme:ApplyFont(self.Text, "Normal", 12)
        self.Text:SetTextColor(1, 1, 1)
        local r, g, b = Theme:GetColor("border")
        self:SetBackdropBorderColor(r, g, b, 1)
      end
      Theme:RegisterT(frame)
    elseif frameType == "slider" then
      frame.UpdateTheme = function(self)
        if self.Text then
          Theme:ApplyFont(self.Text, "Normal", 12)
          self.Text:SetTextColor(Theme:GetColor("text"))
        end
        if self.Low then
          Theme:ApplyFont(self.Low, "Normal", 10)
          self.Low:SetTextColor(Theme:GetColor("text"))
        end
        if self.High then
          Theme:ApplyFont(self.High, "Normal", 10)
          self.High:SetTextColor(Theme:GetColor("text"))
        end
        if self.Value then
          Theme:ApplyFont(self.Value, "Normal", 12)
          self.Value:SetTextColor(Theme:GetColor("header"))
        end
        local r, g, b = Theme:GetColor("border")
        self:SetBackdropBorderColor(r, g, b, 1)
        local hr, hg, hb = Theme:GetColor("highlight")
        if self.Thumb then self.Thumb:SetColorTexture(hr, hg, hb, 1) end
      end
      Theme:RegisterT(frame)
    elseif frameType == "media" then
      frame.UpdateTheme = function(self)
        Theme:ApplyFont(self.Label, "Normal", 12)
        self.Label:SetTextColor(Theme:GetColor("text"))
        Theme:ApplyFont(self.Text, "Normal", 12)
        self.Text:SetTextColor(1, 1, 1)
      end
      Theme:RegisterT(frame)
    end
  end

  -- Reset state if retrieved from pool
  if frame.type then
    ResetFrame(frame, frameType)
  end

  -- Re-apply hover handlers for buttons retrieved from pool
  -- (CreateThemedButton sets these, but ResetFrame clears them)
  if frameType == "button" then
    frame:SetScript("OnEnter", function(b)
      b.isHover = true
      Theme:UpdateButtonState(b)
    end)
    frame:SetScript("OnLeave", function(b)
      b.isHover = false
      Theme:UpdateButtonState(b)
    end)
  end

  -- Ensure about frame child elements are visible after pool retrieval
  if frameType == "about" then
    if frame.Title then frame.Title:Show() end
    if frame.Version then frame.Version:Show() end
    if frame.Description then frame.Description:Show() end
    if frame.Icon then frame.Icon:Show() end
    if frame.Links then frame.Links:Show() end
  end

  -- Ensure header child elements are visible and positioned
  if frameType == "header" then
    if frame.text then
      frame.text:ClearAllPoints()
      frame.text:SetPoint("TOPLEFT", 0, 0)
      frame.text:Show()
    end
    if frame.line then
      frame.line:ClearAllPoints()
      frame.line:SetPoint("TOPLEFT", frame.text, "BOTTOMLEFT", 0, -5)
      frame.line:SetPoint("RIGHT", frame, "RIGHT", 0, 0)
      frame.line:Show()
    end
  end

  -- Ensure description text is visible and positioned
  if frameType == "description" then
    if frame.text then
      frame.text:ClearAllPoints()
      frame.text:SetAllPoints()
      frame.text:SetJustifyH("LEFT")
      frame.text:SetJustifyV("TOP")
      frame.text:Show()
    end
  end

  -- Ensure alert child elements are visible
  if frameType == "alert" then
    if frame.text then frame.text:Show() end
    if frame.bg then frame.bg:Show() end
  end

  -- Ensure card child elements are visible
  if frameType == "card" then
    if frame.Header then frame.Header:Show() end
    if frame.HeaderBg then frame.HeaderBg:Show() end
    if frame.Title then frame.Title:Show() end
    if frame.Content then frame.Content:Show() end
  end

  -- Ensure callout child elements are visible
  if frameType == "callout" then
    if frame.Title then frame.Title:Show() end
    if frame.Text then frame.Text:Show() end
    if frame.Button then frame.Button:Show() end
  end

  -- Ensure slider child elements are visible
  if frameType == "slider" then
    if frame.Text then frame.Text:Show() end
    if frame.Low then frame.Low:Show() end
    if frame.High then frame.High:Show() end
    if frame.Value then frame.Value:Show() end
    if frame.Thumb then frame.Thumb:Show() end
  end

  frame.type = frameType
  frame:SetParent(parent)
  frame:Show()

  -- CRITICAL: Force theme update for pooled frames to re-apply fonts and colors
  -- UpdateTheme is only called once during frame creation, not on pool retrieval
  if frame.UpdateTheme then
    frame:UpdateTheme()
  end

  return frame
end

function ConfigRenderer:ReleaseChildren(parent)
  local childs = { parent:GetChildren() }
  for _, child in ipairs(childs) do
    -- Recursively release nested content frames (e.g., card.Content)
    if child.Content then
      self:ReleaseChildren(child.Content)
    end

    -- Clear scripts before returning to pool (use pcall since not all frames support all scripts)
    pcall(function() child:SetScript("OnClick", nil) end)
    pcall(function() child:SetScript("OnValueChanged", nil) end)
    pcall(function() child:SetScript("OnEnter", nil) end)
    pcall(function() child:SetScript("OnLeave", nil) end)
    pcall(function() child:SetScript("OnEditFocusLost", nil) end)
    pcall(function() child:SetScript("OnTextChanged", nil) end)

    -- Don't Hide() - just clear points. Frame becomes invisible when unanchored.
    -- Hiding can cause persistent visibility issues with pooled frames.
    -- UPDATE: We MUST Hide() and SetParent(nil) to prevent ghosting and pool duplication.
    child:Hide()
    child:SetParent(nil)
    child:ClearAllPoints()
    if child.type and FramePool[child.type] then
      table.insert(FramePool[child.type], child)
    end
  end
end

function ConfigRenderer:Clear(container)
  local content = container.ContentChild
  if not content then return end

  self:ReleaseChildren(content)

  -- Reset scroll child size?
  content:SetSize(1, 1)
end

function ConfigRenderer:Render(schema, container)
  self.currentSchema = schema
  self.currentContainer = container
  self:Clear(container)

  local content = container.ContentChild

  -- Force WoW layout engine to calculate dimensions before we measure
  -- GetRect() triggers layout calculation for the frame hierarchy
  container:GetRect()
  if container.Content then container.Content:GetRect() end

  local width = container.Content:GetWidth()
  -- Handle initial zero-width or small-width case
  if width < 200 then
    -- Fallback: Parent width - Sidebar(200) - Padding(50)
    local parentWidth = container:GetWidth()
    if parentWidth > 200 then
      width = parentWidth - 250
    else
      width = 550 -- Safe default
    end
  end

  local cursor = {
    x = 10,
    startX = 10,
    y = -10,
    rowHeight = 0,
    maxWidth = width - 20
  }

  self:RenderGroup(schema, content, cursor)

  -- Update Content Size to enable scrolling
  local totalHeight = math.abs(cursor.y) + cursor.rowHeight + 20
  content:SetSize(width, totalHeight)

  -- Force scrollbar update to reflect new content height immediately
  if container.UpdateScrollBar then
    container:UpdateScrollBar()
  end
end

function ConfigRenderer:RenderGroup(groupSchema, parent, cursor)
  if not groupSchema or not groupSchema.children then return end

  for _, item in ipairs(groupSchema.children) do
    self:RenderItem(item, parent, cursor)
  end
end

function ConfigRenderer:RenderItem(item, parent, cursor)
  local frame = GetFrame(item.type, parent)

  -- Setup basic props
  if item.label then
    if item.type == "checkbox" or item.type == "slider" then
      frame.rawText = item.label
      if frame.Text then
        frame.Text:SetText(Theme:ProcessText(item.label))

        -- Handle Truncation if labelWidth is provided
        if item.labelWidth then
          frame.Text:SetWidth(item.labelWidth)
          frame.Text:SetWordWrap(false)
        end
      end
    elseif item.type == "editbox" or item.type == "dropdown" or item.type == "colorpicker" or item.type == "media" then
      if frame.Label then frame.Label:SetText(Theme:ProcessText(item.label)) end
    end
  end

  -- Handle types that use 'text' or both
  if item.type == "alert" then
    frame.rawText = item.text
    frame.text:SetText(Theme:ProcessText(item.text))
    frame.severity = item.severity
    if frame.UpdateTheme then frame:UpdateTheme() end
  elseif item.type == "header" then
    local label = item.label or item.text
    frame.rawText = label
    frame.text:SetText(Theme:ProcessText(label))
  elseif item.type == "description" then
    local text = item.text or item.label
    frame.rawText = text
    frame.text:SetText(Theme:ProcessText(text))
  elseif item.type == "button" then
    -- frame.Text:SetText(item.label) -- Handled later after sizing
    -- Handle styling
    frame.style = item.style
    frame.customColors = item.customColors
    Theme:UpdateButtonState(frame)
  end

  if item.type == "callout" then
    frame.rawTitle = item.title
    frame.rawText = item.text
    frame.Title:SetText(Theme:ProcessText(item.title))
    frame.Text:SetText(Theme:ProcessText(item.text))
    frame.Button.Text:SetText(item.buttonText or "Click Me")
  end

  -- State Binding & Actions
  local currentVal = nil
  if item.id then
    currentVal = State:GetValue(item.id)
    if currentVal == nil then currentVal = item.default end
  end

  if item.type == "checkbox" then
    local checked = (currentVal == true)
    if item.invertValue then
      checked = (currentVal == false)
    end
    frame:SetChecked(checked)

    frame:SetScript("OnClick", function(chk)
      local newVal = chk:GetChecked()
      if item.invertValue then
        newVal = not newVal
      end
      State:SetValue(item.id, newVal)
      if item.onChange then item.onChange(newVal) end
    end)
  elseif item.type == "slider" then
    frame:SetMinMaxValues(item.min or 0, item.max or 100)
    frame:SetValueStep(item.step or 1)
    frame:SetValue(currentVal or (item.min or 0))

    local function UpdateValueText(val)
      if frame.Value then
        local fmt = "%.0f"
        if (item.step or 1) < 1 then
          fmt = "%.1f"
        end
        if (item.step or 1) < 0.1 then
          fmt = "%.2f"
        end
        frame.Value:SetText(string.format(fmt, val))
      end
    end

    UpdateValueText(currentVal or (item.min or 0))

    frame:SetScript("OnValueChanged", function(_, value)
      State:SetValue(item.id, value)
      UpdateValueText(value)
      if item.onChange then item.onChange(value) end
    end)
    -- Labels for slider
    if frame.Low then
      local minVal = item.min or 0
      frame.Low:SetText(tostring(minVal))
    end
    if frame.High then
      local maxVal = item.max or 100
      frame.High:SetText(tostring(maxVal))
    end
  elseif item.type == "editbox" then
    frame:SetText(currentVal or "")
    frame:SetScript("OnEnterPressed", function(eb)
      State:SetValue(item.id, eb:GetText())
      eb:ClearFocus()
    end)
    frame:SetScript("OnEscapePressed", function(eb)
      eb:ClearFocus()
      eb:SetText(State:GetValue(item.id) or item.default or "")
    end)
  elseif item.type == "dropdown" and item.options then
    -- Initial Text
    local found = false
    for _, opt in ipairs(item.options) do
      if opt.value == currentVal then
        frame.Text:SetText(opt.label)
        found = true
        break
      end
    end
    if not found then frame.Text:SetText(item.placeholder or "Select...") end

    frame:SetScript("OnClick", function()
      if frame.Popup:IsShown() then
        frame.Popup:Hide()
      else
        local popupContent = frame.Popup.Content
        ConfigRenderer:ReleaseChildren(popupContent)

        local yOff = 0
        local itemHeight = 20
        for _, opt in ipairs(item.options) do
          local btn = GetFrame("dropdown_item", popupContent)
          btn:SetSize(frame.Popup:GetWidth() - 25, itemHeight)
          btn:SetPoint("TOPLEFT", 5, yOff)
          btn.Text:SetText(Theme:ProcessText(opt.label))

          btn:SetScript("OnClick", function()
            State:SetValue(item.id, opt.value)
            frame.Text:SetText(opt.label)
            frame.Popup:Hide()
            if item.onChange then item.onChange(opt.value) end
          end)

          yOff = yOff - itemHeight
        end
        popupContent:SetSize(frame.Popup:GetWidth(), math.abs(yOff))
        frame.Popup:Show()
      end
    end)
  elseif item.type == "media" and item.options then
    -- Initial Text
    local found = false
    for _, opt in ipairs(item.options) do
      if opt.value == currentVal then
        frame.Text:SetText(opt.label)
        found = true
        break
      end
    end
    if not found then frame.Text:SetText(item.placeholder or "Select Media...") end

    frame:SetScript("OnClick", function()
      if frame.Popup:IsShown() then
        frame.Popup:Hide()
      else
        -- Populate Popup
        local popupContent = frame.Popup.Content
        ConfigRenderer:ReleaseChildren(popupContent)

        local yOff = 0
        local itemHeight = 20

        for _, opt in ipairs(item.options) do
          local btn = GetFrame("media_item", popupContent)
          btn:SetSize(frame.Popup:GetWidth() - 25, itemHeight)
          btn:SetPoint("TOPLEFT", 5, yOff)
          btn.Text:SetText(Theme:ProcessText(opt.label))

          -- Select Action
          btn:SetScript("OnClick", function()
            State:SetValue(item.id, opt.value)
            frame.Text:SetText(opt.label)
            frame.Popup:Hide()
            if item.onChange then item.onChange(opt.value) end
          end)

          -- Setup Play Button
          local playBtn = btn.PlayButton
          local icon = playBtn.Icon

          -- Version-based icon fallback: common-icon-sound (Midnight+) else speaker
          local tocVersion = select(4, GetBuildInfo()) or 0
          if tocVersion >= 120000 then
            icon:SetAtlas("common-icon-sound")
          else
            icon:SetTexture("Interface/Common/VoiceChat-Speaker")
          end

          playBtn:SetScript("OnClick", function()
            local soundFile = opt.path or opt.value
            if soundFile then
              PlaySoundFile(soundFile, "Master")
            end
          end)

          playBtn:SetScript("OnEnter", function(b)
            GameTooltip:SetOwner(b, "ANCHOR_RIGHT")
            GameTooltip:SetText("Play Sample")
            GameTooltip:Show()
          end)

          playBtn:SetScript("OnLeave", function()
            GameTooltip:Hide()
          end)

          yOff = yOff - itemHeight
        end

        popupContent:SetSize(frame.Popup:GetWidth(), math.abs(yOff))
        frame.Popup:Show()
      end
    end)
    -- Close popup when clicking elsewhere (simplified: just on hide parent or something?
    -- For strict focus loss, we need a FullScreen catch frame, but for now simple toggle is ok)
  elseif item.type == "colorpicker" then
    -- Hex to RGB conversion
    local function hex2rgb(hex)
      hex = hex:gsub("#", "")
      return tonumber("0x" .. hex:sub(1, 2)) / 255, tonumber("0x" .. hex:sub(3, 4)) / 255,
          tonumber("0x" .. hex:sub(5, 6)) / 255
    end
    if currentVal and type(currentVal) == "string" then
      local r, g, b = hex2rgb(currentVal)
      frame.swatch:SetColorTexture(r, g, b)
    end

    frame:SetScript("OnClick", function()
      -- Open Color Picker (mock)
      print("Opening ColorPicker for", item.id)
    end)
  elseif item.type == "button" and item.onClick then
    frame:SetScript("OnClick", item.onClick)
  elseif item.type == "callout" then
    frame.Button:SetScript("OnClick", item.onButtonClick)
    -- Styling overrides from item?
    if item.style or item.severity then
      frame.severity = item.style or item.severity
    else
      frame.severity = "info" -- default
    end

    -- Force update to apply severity colors
    if frame.UpdateTheme then frame:UpdateTheme() end
  end


  -- Size & Layout
  local padding = 10

  if item.type == "alert" then
    frame.severity = item.severity
    -- if item.text then frame.text:SetText(item.text) end -- BROKEN: Overwrites processed text
    if frame.UpdateTheme then frame:UpdateTheme() end
    if PixelUtil then PixelUtil.SetSize(frame, cursor.maxWidth, 30) else frame:SetSize(cursor.maxWidth, 30) end
  elseif item.type == "header" then
    if PixelUtil then PixelUtil.SetSize(frame, cursor.maxWidth, 30) else frame:SetSize(cursor.maxWidth, 30) end
  elseif item.type == "card" then
    frame.rawText = item.label
    frame.Title:SetText(Theme:ProcessText(item.label or ""))

    -- Calculate content height by rendering children into content frame
    local contentHeight = 10 -- Initial padding
    if item.children then
      local childCursor = { x = 0, startX = 0, y = 0, rowHeight = 0, maxWidth = cursor.maxWidth - 20 }
      for _, child in ipairs(item.children) do
        self:RenderItem(child, frame.Content, childCursor)
      end
      -- Calculate total height from cursor
      contentHeight = math.abs(childCursor.y) + childCursor.rowHeight + 20
    end

    local totalHeight = 30 + contentHeight -- Header height + content
    if PixelUtil then
      PixelUtil.SetSize(frame, cursor.maxWidth, totalHeight)
    else
      frame:SetSize(cursor.maxWidth,
        totalHeight)
    end
  elseif item.type == "description" then
    frame.text:SetWidth(cursor.maxWidth) -- Fix width for wrap
    -- if item.text then frame.text:SetText(item.text) end -- BROKEN: Overwrites processed text
    local height = frame.text:GetStringHeight()
    if height == 0 then
      -- Improved fallback: estimate based on text length and width
      local text = item.text or item.label or ""
      local numChars = #text
      local avgCharWidth = 6 -- Approx for 12pt font
      local charsPerLine = math.max(1, cursor.maxWidth / avgCharWidth)
      local lines = math.ceil(numChars / charsPerLine)
      height = lines * 14
    end
    if PixelUtil then
      PixelUtil.SetSize(frame, cursor.maxWidth, height + 10)
    else
      frame:SetSize(cursor.maxWidth, height + 10)
    end
  elseif item.type == "row" then
    -- Handle Row Layout
    -- Force new row if we are not at the start
    if cursor.x > cursor.startX then
      cursor.x = cursor.startX
      cursor.y = cursor.y - cursor.rowHeight - padding
      cursor.rowHeight = 0
    end

    if item.children then
      local rowCursor = { x = cursor.x, startX = cursor.startX, y = cursor.y, rowHeight = 0, maxWidth = cursor.maxWidth }
      for _, child in ipairs(item.children) do
        self:RenderItem(child, parent, rowCursor)
      end
      -- Update main cursor y to account for the row's total height consumption
      cursor.y = rowCursor.y - rowCursor.rowHeight - 10 -- Add padding
      cursor.rowHeight = 0
      cursor.x = cursor.startX                          -- Reset X for next main item

      -- Hide the row frame itself if it was retrieved, as it's just a layout container
      if frame then frame:Hide() end
      return
    end
  elseif item.type == "callout" then
    frame.Text:SetWidth(cursor.maxWidth - 20)
    local textHeight = frame.Text:GetStringHeight()
    if textHeight == 0 then textHeight = 14 end                 -- Fallback
    local totalHeight = 10 + 20 + 5 + textHeight + 10 + 30 + 10 -- Padding + Title + pad + Text + pad + Button + pad
    if PixelUtil then
      PixelUtil.SetSize(frame, cursor.maxWidth, totalHeight)
    else
      frame:SetSize(cursor.maxWidth,
        totalHeight)
    end
  elseif item.type == "checkbox" or item.type == "colorpicker" then
    local w, h = 30, 30
    -- Explicitly ignore item.width for frame size (it is used for layout)
    if PixelUtil then
      PixelUtil.SetSize(frame, w, h)
    else
      frame:SetSize(w, h)
    end
  elseif item.type == "media" then
    local w, h = 180, 26
    if item.width then w = item.width end
    if PixelUtil then
      PixelUtil.SetSize(frame, w, h)
    else
      frame:SetSize(w, h)
    end
  elseif item.type == "dropdown" or item.type == "editbox" or item.type == "slider" then
    local w, h = 180, 26
    if item.type == "slider" then h = 14 end -- Slider bar is thinner
    if item.width then w = item.width end
    if PixelUtil then
      PixelUtil.SetSize(frame, w, h)
    else
      frame:SetSize(w, h)
    end
  elseif item.type == "about" then
    -- Populate Data
    -- Data should already be set in about widget but we need to ensure icon
    if item.icon then
      frame.Icon:SetTexture(item.icon)
      frame.Icon:Show()
    else
      frame.Icon:Hide()
    end

    -- Process strings for about page too
    frame.rawTitle = item.title
    frame.rawText = item.description
    frame.Title:SetText(Theme:ProcessText(item.title or "NoobTacoUI"))
    frame.Version:SetText(Theme:ProcessText(item.version or ""))
    frame.Description:SetText(Theme:ProcessText(item.description or ""))

    local width = cursor.maxWidth
    frame:SetWidth(width)

    -- Description width depends on if icon is present?
    -- Simplified: Title/Desc to right of Icon.

    local iconSize = 64
    local contentLeft = 10 + iconSize + 15
    if not item.icon then contentLeft = 10 end

    frame.Title:ClearAllPoints()
    frame.Description:ClearAllPoints()
    frame.Title:SetPoint("TOPLEFT", contentLeft, -10)
    frame.Description:SetPoint("TOPLEFT", contentLeft, -45) -- Approx below Title
    frame.Description:SetWidth(width - contentLeft - 10)

    local descHeight = frame.Description:GetStringHeight()
    if descHeight == 0 then
      -- Improved fallback: estimate based on text length and width
      local text = item.description or ""
      local numChars = #text
      local avgCharWidth = 6 -- Approx for 12pt font
      -- Use calculated width for wrapping
      local wrapWidth = width - contentLeft - 10
      local charsPerLine = math.max(1, wrapWidth / avgCharWidth)
      local lines = math.ceil(numChars / charsPerLine)
      descHeight = lines * 14 -- Approx line height
    end

    -- Links
    local linkHeight = 0
    if item.links then
      linkHeight = 30
      frame.Links:Show()
      frame.Links:ClearAllPoints()
      -- Position links below Description or Icon, whichever is taller
      local contentBottom = 45 + descHeight
      local iconBottom = 10 + iconSize
      local startY = math.max(contentBottom, iconBottom) + 15

      frame.Links:SetPoint("TOPLEFT", 10, -startY)
      frame.Links:SetPoint("RIGHT", -10, 0)
      frame.Links:SetHeight(30)

      -- Reuse/Create new links
      local kids = { frame.Links:GetChildren() }
      local numLinks = #item.links
      local btnWidth = 100
      local gap = 10
      local totalLinkWidth = (numLinks * btnWidth) + ((numLinks - 1) * gap)
      local availableWidth = width - 20
      local startX = (availableWidth - totalLinkWidth) / 2

      local lx = startX
      for i, link in ipairs(item.links) do
        local btn = kids[i]
        if not btn then
          btn = Theme:CreateThemedButton(frame.Links)
        end
        btn:Show()

        local labelText = link.label or ""
        if btn.Text then
          btn.Text:SetText(labelText)
        elseif btn.SetText then
          btn:SetText(labelText)
        end

        btn:SetSize(btnWidth, 24)
        btn:SetPoint("LEFT", lx, 0)

        if Theme.UpdateButtonState then
          Theme:UpdateButtonState(btn)
        end

        btn:SetScript("OnClick", function()
          if link.onClick then
            link.onClick()
          elseif link.url then
            print("Opening Link: " .. link.url)
          end
        end)
        lx = lx + btnWidth + gap
      end

      -- Hide extra buttons
      for i = numLinks + 1, #kids do
        kids[i]:Hide()
      end
    else
      frame.Links:Hide()
    end

    local totalHeight = math.max(10 + iconSize, 45 + descHeight) + 20
    if item.links then totalHeight = totalHeight + linkHeight + 10 end

    if PixelUtil then
      PixelUtil.SetSize(frame, width, totalHeight)
    else
      frame:SetSize(width, totalHeight)
    end
  else
    -- Basic sizing
    local w, h = 150, 26
    if item.type == "checkbox" or item.type == "colorpicker" then
      w, h = 30, 30
      -- Do NOT let item.width override w for these types, as it is used for layout reservation only
    else
      if item.type == "editbox" then w = 200 end
      if item.width then w = item.width end
    end

    if PixelUtil then
      PixelUtil.SetSize(frame, w, h)
    else
      frame:SetSize(w, h)
    end
  end

  -- Apply Link/Label Text for buttons specifically AFTER size is set
  if item.type == "button" and item.label then
    if frame.SetLabel then
      frame:SetLabel(item.label)
    else
      frame.Text:SetText(item.label)
    end
  end

  -- Measure effective width/height for layout
  local frameWidth, frameHeight = frame:GetSize()
  local effectiveWidth = frameWidth
  local effectiveHeight = frameHeight
  local topHeight = 0
  local bottomHeight = 0

  -- 1. Account for side labels (Checkbox, ColorPicker)
  if item.type == "checkbox" and frame.Text then
    if item.width then
      effectiveWidth = item.width
    else
      local textWidth = frame.Text:GetStringWidth() or 100
      if textWidth == 0 then textWidth = 100 end -- Fallback
      effectiveWidth = frameWidth + textWidth + 5
    end
  elseif item.type == "colorpicker" and frame.Label then
    if item.width then
      effectiveWidth = item.width
    else
      local textWidth = frame.Label:GetStringWidth() or 100
      if textWidth == 0 then textWidth = 100 end -- Fallback
      effectiveWidth = frameWidth + textWidth + 10
    end
  end

  -- 2. Account for top labels (Slider, EditBox, Dropdown, Media)
  if item.type == "slider" or item.type == "editbox" or item.type == "dropdown" or item.type == "media" then
    -- For Sliders, the label is 'frame.Text'. For others, it's 'frame.Label'.
    local label = (item.type == "slider") and frame.Text or frame.Label
    if label and label:GetText() and label:GetText() ~= "" then
      topHeight = label:GetStringHeight()
      if topHeight == 0 then topHeight = 14 end -- Fallback for initial load
      topHeight = topHeight + 5                 -- Fixed padding between label and frame
    end

    if item.type == "slider" then
      if (frame.Low and frame.Low:GetText()) or (frame.High and frame.High:GetText()) then
        bottomHeight = 14 -- Approx for small font
      end
    end

    effectiveHeight = frameHeight + topHeight + bottomHeight
  end

  if cursor.x > cursor.startX and cursor.x + effectiveWidth > cursor.maxWidth then
    -- New Row
    cursor.x = cursor.startX
    cursor.y = cursor.y - cursor.rowHeight - padding
    cursor.rowHeight = 0
  end

  frame:ClearAllPoints()

  -- Apply position with offset for top labels
  -- This ensures the label starts at the current cursor.y
  local yOffset = -topHeight

  if PixelUtil then
    PixelUtil.SetPoint(frame, "TOPLEFT", parent, "TOPLEFT", cursor.x, cursor.y + yOffset)
  else
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", cursor.x, cursor.y + yOffset)
  end

  -- Update Cursor
  cursor.x = cursor.x + effectiveWidth + padding
  cursor.rowHeight = math.max(cursor.rowHeight, effectiveHeight)
end
