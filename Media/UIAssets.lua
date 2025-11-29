-- NoobTacoUI UI Assets Registry
-- Inspired by Plumber's asset management

local addonName, addon = ...

-- Version detection for feature availability
local function GetWoWVersion()
  local version, build, date, tocVersion = GetBuildInfo()
  return version, build, date, tocVersion
end

local function IsMoP()
  local version = GetWoWVersion()
  return version and version:match("^5%.")
end

local function IsWoD()
  local version = GetWoWVersion()
  return version and version:match("^6%.")
end

local function IsLegion()
  local version = GetWoWVersion()
  return version and version:match("^7%.")
end

local function IsClassicEra()
  local version = GetWoWVersion()
  return version and (version:match("^1%.") or version:match("^11%d%d%d"))
end

local function IsWrath()
  local version = GetWoWVersion()
  return version and version:match("^3%.")
end

local function IsCata()
  local version = GetWoWVersion()
  return version and version:match("^4%.")
end

-- Check if we need texture fallback (only for MoP and potentially other problematic versions)
local function NeedsTextureFallback()
  -- Only use texture fallback for MoP specifically
  -- All other versions (including retail) should use Unicode
  return IsMoP()
end

-- Asset paths for easy management
addon.UIAssets = {
  -- Logo and branding
  Logo = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\logo",

  -- Background textures using your Nord theme
  Background = {
    Main = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\NT_nord0",
    Panel = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\NT_nord1",
    Dark = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\NT_nord3",
    Accent = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\NT_nord8",
  },

  -- Gradient textures for depth
  Gradients = {
    MainGrad = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\NT_nord0_grd",
    PanelGrad = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\NT_nord1_grd",
    DarkGrad = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\NT_nord3_grd",
    AccentGrad = "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\NT_nord8_grd",
  },

  -- Colors extracted from Nord theme
  Colors = {
    -- Polar Night (dark backgrounds)
    Nord0 = { 0.18, 0.20, 0.25, 1 }, -- #2e3440
    Nord1 = { 0.22, 0.24, 0.29, 1 }, -- #3b4252
    Nord2 = { 0.26, 0.30, 0.35, 1 }, -- #434c5e
    Nord3 = { 0.31, 0.35, 0.41, 1 }, -- #4c566a

    -- Snow Storm (light text/accents)
    Nord4 = { 0.85, 0.87, 0.91, 1 }, -- #d8dee9
    Nord5 = { 0.89, 0.91, 0.94, 1 }, -- #e5e9f0
    Nord6 = { 0.93, 0.94, 0.96, 1 }, -- #eceff4

    -- Frost (blues/cyans)
    Nord7 = { 0.56, 0.74, 0.73, 1 },  -- #8fbcbb
    Nord8 = { 0.53, 0.75, 0.82, 1 },  -- #88c0d0
    Nord9 = { 0.51, 0.63, 0.76, 1 },  -- #81a1c1
    Nord10 = { 0.37, 0.51, 0.71, 1 }, -- #5e81ac

    -- Aurora (accent colors)
    Nord11 = { 0.75, 0.38, 0.42, 1 }, -- #bf616a (red)
    Nord12 = { 0.84, 0.60, 0.39, 1 }, -- #d08770 (orange)
    Nord13 = { 0.92, 0.80, 0.54, 1 }, -- #ebcb8b (yellow)
    Nord14 = { 0.64, 0.75, 0.54, 1 }, -- #a3be8c (green)
    Nord15 = { 0.70, 0.56, 0.68, 1 }, -- #b48ead (purple)
  },

  -- WoW Texture Icons for Menu Categories
  Icons = {
    About = "Interface\\Icons\\INV_Misc_Book_11",                     -- Open book for information
    Audio = "Interface\\Icons\\INV_Misc_Bell_01",                     -- Bell for notifications/audio
    Addons = "Interface\\Icons\\INV_Misc_EngGizmos_27",               -- Gizmo for addon integration
    General = "Interface\\Icons\\INV_Misc_Gear_01",                   -- Gear for general settings
    Game = "Interface\\Icons\\INV_Misc_Spyglass_02",                  -- Spyglass for game/view settings
    Close = "Interface\\Buttons\\UI-Panel-MinimizeButton-Up",         -- Close/X button
    -- Alternative options:
    AudioAlt = "Interface\\GossipFrame\\UI-GossipIcon-Chat",          -- Speech bubble
    SettingsAlt = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up", -- Gear wheel
    AboutAlt = "Interface\\Icons\\INV_Scroll_08",                     -- Scroll
    CloseAlt = "Interface\\Buttons\\UI-Panel-HideButton-Up",          -- Alternative close button
  }
}

-- Utility functions for creating consistent UI elements
addon.UIUtils = {}

-- Font system for consistent Poppins typography with Nord-appropriate weights
local function GetUIFont(fontType, size)
  local LSM = LibStub("LibSharedMedia-3.0")
  local fontWeight
  size = size or 12

  -- Nord typography hierarchy with appropriate Poppins weights
  if fontType == "header-primary" then
    fontWeight = "Poppins-Bold" -- Primary headers (main titles)
    size = size or 16
  elseif fontType == "header-secondary" then
    fontWeight = "Poppins-SemiBold" -- Secondary headers (section titles)
    size = size or 15
  elseif fontType == "label-emphasis" then
    fontWeight = "Poppins-SemiBold" -- Important labels (toggles, emphasis)
    size = size or 13
  elseif fontType == "label-standard" then
    fontWeight = "Poppins-Medium" -- Standard labels and UI text
    size = size or 12
  elseif fontType == "body-text" then
    fontWeight = "Poppins-Regular" -- Body text, descriptions
    size = size or 12
  elseif fontType == "small-text" then
    fontWeight = "Poppins-Regular" -- Small text, metadata
    size = size or 10
  elseif fontType == "icon-text" then
    fontWeight = "Poppins-Medium" -- Icons and symbols
    size = size or 12
  else
    -- Default fallback
    fontWeight = "Poppins-Regular"
    size = size or 12
  end

  local fontPath = LSM:Fetch("font", fontWeight)
  return fontPath, size
end

local function ApplyUIFont(fontString, fontType, size)
  local fontPath, fontSize = GetUIFont(fontType, size)
  fontString:SetFont(fontPath, fontSize)
end

-- Expose to addon namespace
addon.UIUtils.GetUIFont = GetUIFont
addon.UIUtils.ApplyUIFont = ApplyUIFont

-- Create a Nord-themed frame with background
function addon.UIUtils:CreateThemedFrame(parent, frameType, template)
  frameType = frameType or "Frame"
  local frame = CreateFrame(frameType, nil, parent, template)

  -- Add Nord background
  frame.Background = frame:CreateTexture(nil, "BACKGROUND")
  frame.Background:SetAllPoints()
  frame.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord1))

  return frame
end

-- Create a Nord-themed button with hover effects
function addon.UIUtils:CreateThemedButton(parent, text, width, height)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(width or 120, height or 24)

  -- Background texture
  button.Background = button:CreateTexture(nil, "BACKGROUND")
  button.Background:SetAllPoints()
  button.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))

  -- Text
  button.Text = button:CreateFontString(nil, "OVERLAY")
  ApplyUIFont(button.Text, "label-standard")
  button.Text:SetPoint("CENTER")
  button.Text:SetText(text or "Button")
  button.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))

  -- Hover effects
  button:SetScript("OnEnter", function(self)
    self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord3))
    self.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord6))
  end)

  button:SetScript("OnLeave", function(self)
    self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))
    self.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
  end)

  return button
end

-- Create a divider line
function addon.UIUtils:CreateDivider(parent, orientation, thickness)
  orientation = orientation or "HORIZONTAL"
  thickness = thickness or 1

  local divider = parent:CreateTexture(nil, "OVERLAY")
  divider:SetColorTexture(unpack(addon.UIAssets.Colors.Nord3))

  if orientation == "HORIZONTAL" then
    divider:SetHeight(thickness)
  else
    divider:SetWidth(thickness)
  end

  return divider
end

-- Create an icon button (for cog wheels, etc.)
function addon.UIUtils:CreateIconButton(parent, iconText, size)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(size or 20, size or 20)

  -- Icon text (Unicode character)
  button.Icon = button:CreateFontString(nil, "OVERLAY")
  ApplyUIFont(button.Icon, "icon-text", size and (size * 0.6) or 12)
  button.Icon:SetPoint("CENTER")
  button.Icon:SetText(iconText or "⚙")
  button.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord4))

  -- Hover effects
  button:SetScript("OnEnter", function(self)
    self.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord8))
  end)

  button:SetScript("OnLeave", function(self)
    self.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord4))
  end)

  return button
end

-- Create a texture-based icon button (for WoW graphics)
function addon.UIUtils:CreateTextureIconButton(parent, texturePath, size)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(size or 20, size or 20)

  -- Icon texture
  button.Icon = button:CreateTexture(nil, "OVERLAY")
  button.Icon:SetAllPoints()
  button.Icon:SetTexture(texturePath)
  button.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord4))

  -- Hover effects
  button:SetScript("OnEnter", function(self)
    self.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord11)) -- Red on hover for close buttons
  end)

  button:SetScript("OnLeave", function(self)
    self.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord4))
  end)

  return button
end

-- Create a texture icon from WoW's graphics library
function addon.UIUtils:CreateTextureIcon(parent, texturePath, size)
  local icon = parent:CreateTexture(nil, "OVERLAY")
  icon:SetSize(size or 16, size or 16)
  icon:SetTexture(texturePath)

  -- Apply Nord color tinting for consistency
  icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord8))

  return icon
end

-- Create a category header with Nord styling
function addon.UIUtils:CreateCategoryHeader(parent, text)
  local header = parent:CreateFontString(nil, "OVERLAY")
  ApplyUIFont(header, "header-secondary")
  header:SetText(text)
  header:SetTextColor(unpack(addon.UIAssets.Colors.Nord8)) -- Blue accent
  header:SetShadowColor(0, 0, 0, 1)
  header:SetShadowOffset(1, -1)

  return header
end

-- Create a checkbox with Nord theming
function addon.UIUtils:CreateThemedCheckbox(parent, size)
  local checkbox = CreateFrame("CheckButton", nil, parent, "ChatConfigCheckButtonTemplate")
  checkbox:SetSize(size or 18, size or 18)

  -- Override the template's textures with Nord colors if needed
  -- This would require custom textures, but we can enhance the existing ones

  return checkbox
end

-- Create a Nord-themed dropdown with LibSharedMedia integration
function addon.UIUtils:CreateSoundDropdown(parent, width, height, mediaType)
  local LSM = LibStub("LibSharedMedia-3.0")
  mediaType = mediaType or "sound"

  -- Main dropdown frame
  local dropdown = CreateFrame("Frame", nil, parent)
  dropdown:SetSize(width or 150, height or 32)

  -- Background styling
  dropdown.Background = dropdown:CreateTexture(nil, "BACKGROUND")
  dropdown.Background:SetAllPoints()
  dropdown.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))

  -- Current selection display
  dropdown.selectedValue = nil
  dropdown.selectedText = "Select Sound..."

  -- Text display
  dropdown.Text = dropdown:CreateFontString(nil, "OVERLAY")
  ApplyUIFont(dropdown.Text, "label-standard", 11)
  dropdown.Text:SetPoint("LEFT", dropdown, "LEFT", 8, 0)
  dropdown.Text:SetSize((width or 150) - 32, 20) -- Set explicit size instead of RIGHT anchor
  dropdown.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
  dropdown.Text:SetJustifyH("LEFT")
  dropdown.Text:SetText(dropdown.selectedText)

  -- Dropdown arrow button - use texture approach for reliability across all versions
  dropdown.Button = CreateFrame("Button", nil, dropdown)
  dropdown.Button:SetSize(20, 20)
  dropdown.Button:SetPoint("RIGHT", dropdown, "RIGHT", -4, 0)

  -- Use texture-based arrow for maximum compatibility
  dropdown.Button.Icon = dropdown.Button:CreateTexture(nil, "OVERLAY")
  dropdown.Button.Icon:SetSize(12, 12)
  dropdown.Button.Icon:SetPoint("CENTER")
  dropdown.Button.Icon:SetTexture("Interface\\Buttons\\Arrow-Down-Up")
  dropdown.Button.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord4))

  -- Menu frame for dropdown items
  dropdown.Menu = CreateFrame("Frame", nil, dropdown)
  dropdown.Menu:SetFrameStrata("DIALOG")
  dropdown.Menu:SetFrameLevel(dropdown:GetFrameLevel() + 10)
  dropdown.Menu:SetSize(width or 150, 200)
  dropdown.Menu:SetPoint("TOPLEFT", dropdown, "BOTTOMLEFT", 0, -2)
  dropdown.Menu:Hide()

  -- Menu background
  dropdown.Menu.Background = dropdown.Menu:CreateTexture(nil, "BACKGROUND")
  dropdown.Menu.Background:SetAllPoints()
  dropdown.Menu.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord1))

  -- Menu border
  dropdown.Menu.Border = dropdown.Menu:CreateTexture(nil, "BORDER")
  dropdown.Menu.Border:SetAllPoints()
  dropdown.Menu.Border:SetColorTexture(unpack(addon.UIAssets.Colors.Nord3))
  dropdown.Menu.Border:SetPoint("TOPLEFT", dropdown.Menu, "TOPLEFT", -1, 1)
  dropdown.Menu.Border:SetPoint("BOTTOMRIGHT", dropdown.Menu, "BOTTOMRIGHT", 1, -1)

  -- Scroll frame for menu items
  dropdown.Menu.ScrollFrame = CreateFrame("ScrollFrame", nil, dropdown.Menu, "UIPanelScrollFrameTemplate")
  dropdown.Menu.ScrollFrame:SetPoint("TOPLEFT", dropdown.Menu, "TOPLEFT", 4, -4)
  dropdown.Menu.ScrollFrame:SetPoint("BOTTOMRIGHT", dropdown.Menu, "BOTTOMRIGHT", -24, 4)

  dropdown.Menu.ScrollChild = CreateFrame("Frame", nil, dropdown.Menu.ScrollFrame)
  dropdown.Menu.ScrollFrame:SetScrollChild(dropdown.Menu.ScrollChild)
  dropdown.Menu.ScrollChild:SetSize(width or 150, 200)

  -- Menu items
  dropdown.menuItems = {}

  -- Update display text
  local function UpdateDisplayText()
    dropdown.Text:SetText(dropdown.selectedText)
  end

  -- Set selected value
  function dropdown:SetValue(value, skipCallback)
    -- Validate that the sound exists in LibSharedMedia
    if value then
      local LSM = LibStub("LibSharedMedia-3.0")
      local soundList = LSM:List(mediaType)
      local soundExists = false

      if soundList then
        for _, soundName in ipairs(soundList) do
          if soundName == value then
            soundExists = true
            break
          end
        end
      end

      -- If sound doesn't exist, don't set it
      if not soundExists then
        print("|cFF16C3F2NoobTacoUI|r: Warning - Sound '" .. tostring(value) .. "' not found in LibSharedMedia")
        return
      end
    end

    self.selectedValue = value
    self.selectedText = value or "Select Sound..."
    UpdateDisplayText()

    -- Ensure menu items exist before trying to update them
    if #self.menuItems == 0 then
      self:PopulateMenu()
    end

    -- Update menu item selection visual
    for _, item in ipairs(self.menuItems) do
      if item.value == value then
        item:SetBackgroundColor(unpack(addon.UIAssets.Colors.Nord8))
        item.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord0))
      else
        item:SetBackgroundColor(unpack(addon.UIAssets.Colors.Nord1))
        item.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
      end
    end

    -- Trigger callback unless specifically skipped (for user changes)
    if not skipCallback and self.OnValueChanged then
      self:OnValueChanged(value)
    end

    -- Force a final display update to ensure the text shows correctly
    C_Timer.After(0.1, function()
      if self.selectedText and self.Text then
        self.Text:SetText(self.selectedText)
      end
    end)
  end

  -- Get current value
  function dropdown:GetValue()
    return self.selectedValue
  end

  -- Refresh display (useful for debugging/testing)
  function dropdown:RefreshDisplay()
    if self.Text then
      self.Text:SetText(self.selectedText or "Select Sound...")
    end
  end

  -- Populate menu items
  function dropdown:PopulateMenu()
    -- Clear existing items
    for _, item in ipairs(self.menuItems) do
      item:Hide()
    end
    wipe(self.menuItems)

    -- Get all sounds from LibSharedMedia
    local soundList = LSM:List(mediaType)
    if soundList then
      local yOffset = 0
      for i, soundName in ipairs(soundList) do
        local item = CreateFrame("Button", nil, self.Menu.ScrollChild)
        item:SetSize((width or 150) - 8, 20)
        item:SetPoint("TOPLEFT", self.Menu.ScrollChild, "TOPLEFT", 0, yOffset)

        item.Background = item:CreateTexture(nil, "BACKGROUND")
        item.Background:SetAllPoints()

        item.Text = item:CreateFontString(nil, "OVERLAY")
        ApplyUIFont(item.Text, "small-text")
        item.Text:SetPoint("LEFT", item, "LEFT", 4, 0)
        item.Text:SetText(soundName)

        item.value = soundName

        function item:SetBackgroundColor(r, g, b, a)
          self.Background:SetColorTexture(r, g, b, a or 1)
        end

        -- Set initial colors
        if self.selectedValue == soundName then
          item:SetBackgroundColor(unpack(addon.UIAssets.Colors.Nord8))
          item.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord0))
        else
          item:SetBackgroundColor(unpack(addon.UIAssets.Colors.Nord1))
          item.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
        end

        -- Hover effects
        item:SetScript("OnEnter", function(self)
          if dropdown.selectedValue ~= self.value then
            self:SetBackgroundColor(unpack(addon.UIAssets.Colors.Nord2))
            self.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord6))
          end
        end)

        item:SetScript("OnLeave", function(self)
          if dropdown.selectedValue == self.value then
            self:SetBackgroundColor(unpack(addon.UIAssets.Colors.Nord8))
            self.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord0))
          else
            self:SetBackgroundColor(unpack(addon.UIAssets.Colors.Nord1))
            self.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
          end
        end)

        -- Click handler
        item:SetScript("OnClick", function(self)
          dropdown:SetValue(self.value)
          dropdown.Menu:Hide()
        end)

        table.insert(self.menuItems, item)
        yOffset = yOffset - 22
      end

      -- Update scroll child height
      self.Menu.ScrollChild:SetHeight(math.max(200, #soundList * 22))
    end
  end

  -- Toggle menu visibility
  function dropdown:ToggleMenu()
    -- Don't open menu if dropdown is disabled
    if not self:IsEnabled() then
      return
    end

    if self.Menu:IsVisible() then
      self.Menu:Hide()
    else
      self:PopulateMenu()
      self.Menu:Show()
    end
  end

  -- Button click handler
  dropdown.Button:SetScript("OnClick", function()
    dropdown:ToggleMenu()
  end)

  -- Click handler for main dropdown area
  dropdown:SetScript("OnMouseDown", function()
    dropdown:ToggleMenu()
  end)

  -- Hide menu when clicking elsewhere
  dropdown.Menu:SetScript("OnShow", function(self)
    local frame = CreateFrame("Frame", nil, UIParent)
    frame:SetAllPoints(UIParent)
    frame:SetFrameLevel(self:GetFrameLevel() - 1)
    frame:EnableMouse(true)
    frame:SetScript("OnMouseDown", function()
      dropdown.Menu:Hide()
      frame:Hide()
    end)

    self.ClickCatcher = frame
  end)

  dropdown.Menu:SetScript("OnHide", function(self)
    if self.ClickCatcher then
      self.ClickCatcher:Hide()
      self.ClickCatcher = nil
    end
  end)

  -- Hover effects for main dropdown - texture approach
  dropdown:SetScript("OnEnter", function(self)
    self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord3))
    self.Button.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord6))
  end)

  dropdown:SetScript("OnLeave", function(self)
    self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))
    self.Button.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord4))
  end)

  dropdown:EnableMouse(true)

  -- Track enabled state
  dropdown.isEnabled = true

  -- Add Enable/Disable methods for compatibility with config menu
  function dropdown:Enable()
    self.isEnabled = true
    self:EnableMouse(true)
    self.Button:Enable()
    self:SetAlpha(1.0)
    if self.Background then
      self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))
    end
    if self.Text then
      self.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
    end
  end

  function dropdown:Disable()
    self.isEnabled = false
    self:EnableMouse(false)
    self.Button:Disable()
    self:SetAlpha(0.5)
    if self.Background then
      self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord3))
    end
    if self.Text then
      self.Text:SetTextColor(unpack(addon.UIAssets.Colors.Nord3))
    end
  end

  function dropdown:IsEnabled()
    return self.isEnabled
  end

  UpdateDisplayText()
  return dropdown
end

-- Create a test button for sound previews
function addon.UIUtils:CreateSoundTestButton(parent, size)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(size or 24, size or 24)

  -- Background
  button.Background = button:CreateTexture(nil, "BACKGROUND")
  button.Background:SetAllPoints()
  button.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord8))

  -- Play icon - use texture approach for reliability across all versions
  button.Icon = button:CreateTexture(nil, "OVERLAY")
  button.Icon:SetSize((size and (size * 0.75) or 18), (size and (size * 0.75) or 18))
  button.Icon:SetPoint("CENTER", 1, 0) -- Slight offset for visual balance
  button.Icon:SetTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
  button.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord0))

  -- Hover effects - texture approach
  button:SetScript("OnEnter", function(self)
    self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord10))
    self.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord6))
  end)

  button:SetScript("OnLeave", function(self)
    self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord8))
    self.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord0))
  end)

  -- Function to set sound to test
  function button:SetSound(soundName)
    self.soundName = soundName
  end

  -- Function to play the sound
  function button:PlaySound()
    if self.soundName then
      local LSM = LibStub("LibSharedMedia-3.0")
      local soundFile = LSM:Fetch("sound", self.soundName)
      if soundFile then
        PlaySoundFile(soundFile, "Master")
      end
    end
  end

  -- Default click behavior
  button:SetScript("OnClick", function(self)
    if self:IsEnabled() then
      self:PlaySound()
    end
  end)

  -- Track enabled state
  button.isEnabled = true

  -- Add Enable/Disable methods for compatibility - texture approach
  function button:Enable()
    self.isEnabled = true
    self:EnableMouse(true)
    self:SetAlpha(1.0)
    self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord8))
    self.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord0))
  end

  function button:Disable()
    self.isEnabled = false
    self:EnableMouse(false)
    self:SetAlpha(0.5)
    self.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord3))
    self.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord3))
  end

  function button:IsEnabled()
    return self.isEnabled
  end

  -- Enable mouse interaction by default
  button:EnableMouse(true)

  return button
end
