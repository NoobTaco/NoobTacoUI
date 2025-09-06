-- NoobTacoUI-Media Enhanced Config Menu
-- Enhanced with Plumber-style design patterns using Nord theme

local addonName, addon = ...
local CreateFrame = CreateFrame

-- Initialize database if needed (account-wide)
NoobTacoUIMediaDB = NoobTacoUIMediaDB or {}

-- Ensure database is account-wide by setting up saved variables properly
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGOUT")
frame:SetScript("OnEvent", function(self, event, loadedAddonName)
  if event == "ADDON_LOADED" and loadedAddonName == addonName then
    -- Initialize global database structure
    NoobTacoUIMediaDB = NoobTacoUIMediaDB or {}

    -- One-time migration from legacy NoobTacoDB if present
    local legacy = rawget(_G, "NoobTacoDB")
    if legacy and type(legacy) == "table" then
      _G.NoobTacoUIMediaDB = _G.NoobTacoUIMediaDB or {}
      _G.NoobTacoUIMediaDB.CollectionNotifications = _G.NoobTacoUIMediaDB.CollectionNotifications or
          legacy.CollectionNotifications
      -- Do not nil the old table to avoid affecting other addons; just stop using it here
    end

    -- Initialize Collection Notifications settings if needed with full defaults
    if not NoobTacoUIMediaDB.CollectionNotifications then
      NoobTacoUIMediaDB.CollectionNotifications = {
        enabled = true,
        newPet = true,
        newMount = true,
        newToy = true,
        newTransmog = true,
        showMessages = true,
        soundPet = "NT_InfussionOfLight",
        soundMount = "NT_Mount",
        soundToy = "NT_Chest",
        soundTransmog = "NT_Chest",
      }
      print("|cFF16C3F2NoobTacoUI-Media|r: Initialized Collection Notifications settings")
    else
      -- Ensure all required fields exist (for version upgrades)
      local defaults = {
        enabled = true,
        newPet = true,
        newMount = true,
        newToy = true,
        newTransmog = true,
        showMessages = true,
        soundPet = "NT_InfussionOfLight",
        soundMount = "NT_Mount",
        soundToy = "NT_Chest",
        soundTransmog = "NT_Chest",
      }

      for key, defaultValue in pairs(defaults) do
        if NoobTacoUIMediaDB.CollectionNotifications[key] == nil then
          NoobTacoUIMediaDB.CollectionNotifications[key] = defaultValue
        end
      end
    end

    self:UnregisterEvent("ADDON_LOADED")
  elseif event == "PLAYER_LOGOUT" then
    -- Force save the database on logout (shouldn't be needed but adds safety)
    if NoobTacoUIMediaDB and NoobTacoUIMediaDB.CollectionNotifications then
      print("|cFF16C3F2NoobTacoUI-Media|r: Saving Collection Notifications settings...")
    end
  end
end)

-- Simple callback registry for settings changes
if not addon.CallbackRegistry then
  addon.CallbackRegistry = {
    callbacks = {},
    Trigger = function(self, key, value)
      if self.callbacks[key] then
        for _, func in ipairs(self.callbacks[key]) do
          func(value)
        end
      end
    end,
    RegisterCallback = function(self, key, func)
      self.callbacks[key] = self.callbacks[key] or {}
      table.insert(self.callbacks[key], func)
    end,
    RegisterSettingCallback = function(self, key, func)
      -- Alias for RegisterCallback to maintain compatibility
      self:RegisterCallback(key, func)
    end
  }
end

-- Database helper functions
local function GetDBValue(key)
  if key == "CollectionNotificationsEnabled" then
    -- Use CollectionNotifications settings structure
    if not NoobTacoUIMediaDB.CollectionNotifications then
      NoobTacoUIMediaDB.CollectionNotifications = {}
    end
    return NoobTacoUIMediaDB.CollectionNotifications.enabled
  end
  return NoobTacoUIMediaDB[key]
end

local function SetDBValue(key, value)
  if key == "CollectionNotificationsEnabled" then
    -- Use CollectionNotifications settings structure
    if not NoobTacoUIMediaDB.CollectionNotifications then
      NoobTacoUIMediaDB.CollectionNotifications = {}
    end
    NoobTacoUIMediaDB.CollectionNotifications.enabled = value
  else
    NoobTacoUIMediaDB[key] = value
  end

  -- Trigger callback if available
  if addon.CallbackRegistry then
    addon.CallbackRegistry:Trigger(key, value)
  end
end

-- Expose to addon namespace
addon.GetDBValue = GetDBValue
addon.SetDBValue = SetDBValue

-- Wait for UIAssets to be loaded
if not addon.UIAssets then
  local frame = CreateFrame("Frame")
  frame:RegisterEvent("ADDON_LOADED")
  frame:SetScript("OnEvent", function(self, event, loadedAddonName)
    if loadedAddonName == addonName and addon.UIAssets then
      -- Reload this file or trigger initialization
      self:UnregisterEvent("ADDON_LOADED")
    end
  end)
  return
end

-- Enhanced Layout Constants (Plumber-inspired)
local FRAME_WIDTH = 720 -- Slightly larger for better proportions
local FRAME_HEIGHT = 540
local HEADER_HEIGHT = 40
local SIDEBAR_WIDTH = 240
local PADDING = 16
local INNER_PADDING = 12
local BUTTON_HEIGHT = 32
local SECTION_SPACING = 24

-- Create main config frame with enhanced styling
local function CreateEnhancedConfigFrame()
  local frame = addon.UIUtils:CreateThemedFrame(UIParent, "Frame")
  frame:SetSize(FRAME_WIDTH, FRAME_HEIGHT)
  frame:SetPoint("CENTER")
  frame:SetMovable(true)
  frame:SetClampedToScreen(true)
  frame:SetFrameStrata("DIALOG")
  frame:Hide()

  -- Enhanced background with gradient
  frame.Background:SetTexture(addon.UIAssets.Background.Main)

  -- Add a subtle border
  frame.Border = frame:CreateTexture(nil, "BORDER")
  frame.Border:SetTexture(addon.UIAssets.Background.Accent)
  frame.Border:SetPoint("TOPLEFT", frame, "TOPLEFT", -2, 2)
  frame.Border:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 2, -2)

  return frame
end

-- Create enhanced header with Nord styling
local function CreateEnhancedHeader(parent)
  local header = CreateFrame("Frame", nil, parent)
  header:SetHeight(HEADER_HEIGHT)
  header:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
  header:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0, 0)

  -- Make header draggable to move the parent frame
  header:EnableMouse(true)
  header:RegisterForDrag("LeftButton")
  header:SetScript("OnDragStart", function(self)
    parent:StartMoving()
  end)
  header:SetScript("OnDragStop", function(self)
    parent:StopMovingOrSizing()
  end)

  -- Header background with gradient
  header.Background = header:CreateTexture(nil, "BACKGROUND")
  header.Background:SetAllPoints()
  header.Background:SetTexture(addon.UIAssets.Gradients.PanelGrad)
  header.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))

  -- Title with enhanced styling
  header.Title = addon.UIUtils:CreateCategoryHeader(header, "NoobTacoUI-Media Configuration")
  header.Title:SetPoint("LEFT", header, "LEFT", PADDING, 0)

  -- Close button with enhanced styling using WoW texture
  header.CloseButton = addon.UIUtils:CreateTextureIconButton(header, addon.UIAssets.Icons.Close, 24)
  header.CloseButton:SetPoint("RIGHT", header, "RIGHT", -PADDING, 0)
  header.CloseButton:SetScript("OnClick", function() parent:Hide() end)

  -- Bottom divider
  header.Divider = addon.UIUtils:CreateDivider(header, "HORIZONTAL", 2)
  header.Divider:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 0, 0)
  header.Divider:SetPoint("BOTTOMRIGHT", header, "BOTTOMRIGHT", 0, 0)

  return header
end

-- Create enhanced sidebar
local function CreateEnhancedSidebar(parent, header)
  local sidebar = addon.UIUtils:CreateThemedFrame(parent, "Frame")
  sidebar:SetWidth(SIDEBAR_WIDTH)
  sidebar:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, 0)
  sidebar:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 0, 0)

  -- Sidebar background with different shade
  sidebar.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord0))

  -- Vertical divider on the right
  sidebar.Divider = addon.UIUtils:CreateDivider(sidebar, "VERTICAL", 2)
  sidebar.Divider:SetPoint("TOPRIGHT", sidebar, "TOPRIGHT", 0, 0)
  sidebar.Divider:SetPoint("BOTTOMRIGHT", sidebar, "BOTTOMRIGHT", 0, 0)

  return sidebar
end

-- Create enhanced content area
local function CreateEnhancedContentArea(parent, header, sidebar)
  local content = addon.UIUtils:CreateThemedFrame(parent, "Frame")
  content:SetPoint("TOPLEFT", header, "BOTTOMLEFT", SIDEBAR_WIDTH, 0)
  content:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0)

  -- Content background
  content.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord1))

  return content
end

-- Enhanced category button with Plumber-style design
local function CreateEnhancedCategoryButton(parent, text, iconData)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(SIDEBAR_WIDTH - (PADDING * 2), BUTTON_HEIGHT)

  -- Background with multiple states
  button.NormalBG = button:CreateTexture(nil, "BACKGROUND")
  button.NormalBG:SetAllPoints()
  button.NormalBG:SetColorTexture(unpack(addon.UIAssets.Colors.Nord1))

  button.HoverBG = button:CreateTexture(nil, "BACKGROUND")
  button.HoverBG:SetAllPoints()
  button.HoverBG:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))
  button.HoverBG:Hide()

  button.SelectedBG = button:CreateTexture(nil, "BACKGROUND")
  button.SelectedBG:SetAllPoints()
  button.SelectedBG:SetColorTexture(unpack(addon.UIAssets.Colors.Nord9))
  button.SelectedBG:SetAlpha(0.3)
  button.SelectedBG:Hide()

  -- Icon (supports both texture paths and text)
  if iconData then
    if type(iconData) == "string" and iconData:find("Interface\\") then
      -- WoW texture icon
      button.Icon = button:CreateTexture(nil, "OVERLAY")
      button.Icon:SetSize(16, 16)
      button.Icon:SetPoint("LEFT", button, "LEFT", INNER_PADDING, 0)
      button.Icon:SetTexture(iconData)
      button.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord8))
    else
      -- Text/Unicode icon
      button.Icon = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      button.Icon:SetPoint("LEFT", button, "LEFT", INNER_PADDING, 0)
      button.Icon:SetText(iconData)
      button.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord8))
    end
  end

  -- Text label
  button.Label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  if iconData then
    button.Label:SetPoint("LEFT", button.Icon, "RIGHT", 8, 0)
  else
    button.Label:SetPoint("LEFT", button, "LEFT", INNER_PADDING, 0)
  end
  button.Label:SetText(text)
  button.Label:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))

  -- State management
  function button:SetSelected(selected)
    if selected then
      self.SelectedBG:Show()
      self.Label:SetTextColor(unpack(addon.UIAssets.Colors.Nord6))
      if self.Icon then
        if self.Icon.SetTextColor then
          -- Text icon
          self.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord8))
        else
          -- Texture icon
          self.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord8))
        end
      end
    else
      self.SelectedBG:Hide()
      self.Label:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
      if self.Icon then
        if self.Icon.SetTextColor then
          -- Text icon
          self.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord8))
        else
          -- Texture icon
          self.Icon:SetVertexColor(unpack(addon.UIAssets.Colors.Nord8))
        end
      end
    end
    self.selected = selected
  end

  -- Hover effects
  button:SetScript("OnEnter", function(self)
    if not self.selected then
      self.HoverBG:Show()
      self.Label:SetTextColor(unpack(addon.UIAssets.Colors.Nord6))
    end
  end)

  button:SetScript("OnLeave", function(self)
    self.HoverBG:Hide()
    if not self.selected then
      self.Label:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
    end
  end)

  return button
end

-- Enhanced settings panel
local function CreateEnhancedSettingsPanel(parent, title, description)
  local panel = CreateFrame("Frame", nil, parent)
  panel:SetAllPoints()

  -- Title with enhanced styling
  panel.Title = addon.UIUtils:CreateCategoryHeader(panel, title)
  panel.Title:SetPoint("TOPLEFT", panel, "TOPLEFT", PADDING, -PADDING)

  -- Add a decorative line under the title
  panel.TitleLine = addon.UIUtils:CreateDivider(panel, "HORIZONTAL", 2)
  panel.TitleLine:SetPoint("TOPLEFT", panel.Title, "BOTTOMLEFT", 0, -4)
  panel.TitleLine:SetWidth(200)
  panel.TitleLine:SetColorTexture(unpack(addon.UIAssets.Colors.Nord8))

  -- Description with better formatting
  panel.Description = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  panel.Description:SetPoint("TOPLEFT", panel.TitleLine, "BOTTOMLEFT", 0, -8)
  panel.Description:SetPoint("RIGHT", panel, "RIGHT", -PADDING, 0)
  panel.Description:SetJustifyH("LEFT")
  panel.Description:SetJustifyV("TOP")
  panel.Description:SetText(description)
  panel.Description:SetTextColor(unpack(addon.UIAssets.Colors.Nord4))
  panel.Description:SetSpacing(2)

  -- Content divider
  panel.Divider = addon.UIUtils:CreateDivider(panel, "HORIZONTAL", 1)
  panel.Divider:SetPoint("TOPLEFT", panel.Description, "BOTTOMLEFT", 0, -INNER_PADDING)
  panel.Divider:SetPoint("RIGHT", panel, "RIGHT", -PADDING, 0)

  return panel
end

-- Create the enhanced config frame
local EnhancedConfigFrame = CreateEnhancedConfigFrame()
local header = CreateEnhancedHeader(EnhancedConfigFrame)
local sidebar = CreateEnhancedSidebar(EnhancedConfigFrame, header)
local content = CreateEnhancedContentArea(EnhancedConfigFrame, header, sidebar)

-- Add version footer to the enhanced frame
local versionFooter = EnhancedConfigFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
versionFooter:SetPoint("BOTTOMRIGHT", EnhancedConfigFrame, "BOTTOMRIGHT", -PADDING, PADDING)
versionFooter:SetJustifyH("RIGHT")
versionFooter:SetText("v" .. (C_AddOns and C_AddOns.GetAddOnMetadata and
  C_AddOns.GetAddOnMetadata("NoobTacoUI-Media", "Version") or "1.1.3"))
versionFooter:SetTextColor(unpack(addon.UIAssets.Colors.Nord3))
versionFooter:SetAlpha(0.7)

-- Category management
local categories = {}
local currentCategory = nil

-- Add categories
local audioButton = CreateEnhancedCategoryButton(sidebar, "Audio Settings", addon.UIAssets.Icons.Audio)
audioButton:SetPoint("TOPLEFT", sidebar, "TOPLEFT", PADDING, -PADDING)
audioButton:SetScript("OnClick", function(self)
  -- Clear previous selection
  if currentCategory then
    currentCategory:SetSelected(false)
  end

  -- Set new selection
  self:SetSelected(true)
  currentCategory = self

  -- Show audio settings panel
  if content.currentPanel then
    content.currentPanel:Hide()
  end

  if not content.audioPanel then
    content.audioPanel = CreateEnhancedSettingsPanel(
      content,
      "Audio Configuration",
      "Configure audio notifications, custom sounds, and sound effects used throughout NoobTacoUI-Media."
    )

    -- Add collection notifications section
    local collectionHeader = addon.UIUtils:CreateCategoryHeader(content.audioPanel, "Collection Notifications")
    collectionHeader:SetPoint("TOPLEFT", content.audioPanel.Divider, "BOTTOMLEFT", 0, -SECTION_SPACING)
    -- Use same color as selected button for consistency and better readability
    collectionHeader:SetTextColor(unpack(addon.UIAssets.Colors.Nord9)) -- Blue-gray frost color

    -- Create a subtle background container for the collection options
    local collectionContainer = addon.UIUtils:CreateThemedFrame(content.audioPanel, "Frame")
    collectionContainer:SetPoint("TOPLEFT", collectionHeader, "BOTTOMLEFT", -8, -12)
    collectionContainer:SetPoint("TOPRIGHT", content.audioPanel, "TOPRIGHT", -8, -12)
    collectionContainer:SetHeight(250) -- Increased height to accommodate chat messages section
    
    -- Apply subtle Nord1 background with slight transparency
    local bgTexture = collectionContainer:CreateTexture(nil, "BACKGROUND")
    bgTexture:SetAllPoints()
    bgTexture:SetColorTexture(unpack(addon.UIAssets.Colors.Nord1))
    bgTexture:SetAlpha(0.3)
    
    -- Add a subtle border using Nord3
    local borderTexture = collectionContainer:CreateTexture(nil, "BORDER")
    borderTexture:SetAllPoints()
    borderTexture:SetColorTexture(unpack(addon.UIAssets.Colors.Nord3))
    borderTexture:SetAlpha(0.4)
    
    -- Create inset for the border effect
    local insetTexture = collectionContainer:CreateTexture(nil, "ARTWORK")
    insetTexture:SetPoint("TOPLEFT", borderTexture, "TOPLEFT", 1, -1)
    insetTexture:SetPoint("BOTTOMRIGHT", borderTexture, "BOTTOMRIGHT", -1, 1)
    insetTexture:SetColorTexture(unpack(addon.UIAssets.Colors.Nord1))
    insetTexture:SetAlpha(0.3)

    local yOffset = -20 -- Start with more padding inside container
    local configurableElements = {}
    local soundDropdowns = {}           -- Store references to dropdowns for refreshing
    local checkboxRefs = { types = {} } -- Store references to checkboxes for refreshing
    local rowElements = {}              -- Store elements for each row for per-row disable functionality

    -- Helper functions to use CollectionNotifications module functions
    local function GetCollectionSetting(key)
      local value
      if addon.CollectionNotifications and addon.CollectionNotifications.GetSetting then
        value = addon.CollectionNotifications.GetSetting(key)
      else
        -- Fallback to direct access if module not loaded yet
        if not NoobTacoUIMediaDB.CollectionNotifications then
          NoobTacoUIMediaDB.CollectionNotifications = {}
        end
        value = NoobTacoUIMediaDB.CollectionNotifications[key]
      end
      return value
    end

    local function SetCollectionSetting(key, value)
      if addon.CollectionNotifications and addon.CollectionNotifications.SetSetting then
        -- Coerce checkbox values to explicit booleans
        if value == nil then value = false end
        if value == 1 then value = true end
        addon.CollectionNotifications.SetSetting(key, value)
      else
        -- Fallback to direct access if module not loaded yet
        if not NoobTacoUIMediaDB.CollectionNotifications then
          NoobTacoUIMediaDB.CollectionNotifications = {}
        end
        if value == nil then value = false end
        if value == 1 then value = true end
        NoobTacoUIMediaDB.CollectionNotifications[key] = value
        if addon.CallbackRegistry then
          addon.CallbackRegistry:Trigger("CollectionNotifications." .. key, value)
        end
      end
    end

    -- Global Enable Toggle with improved styling
    local enableCheckbox = addon.UIUtils:CreateThemedCheckbox(collectionContainer, 22) -- Slightly larger
    enableCheckbox:SetPoint("TOPLEFT", collectionContainer, "TOPLEFT", 16, yOffset)
    enableCheckbox:SetChecked(GetCollectionSetting("enabled") ~= false)
    checkboxRefs.enable = enableCheckbox

    local enableLabel = collectionContainer:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    enableLabel:SetPoint("LEFT", enableCheckbox, "RIGHT", 12, 0)
    enableLabel:SetText("Enable Collection Notifications")
    enableLabel:SetTextColor(unpack(addon.UIAssets.Colors.Nord6)) -- Brighter text for main option
    
    -- Add a subtle divider after the main toggle
    local mainDivider = addon.UIUtils:CreateDivider(collectionContainer, "HORIZONTAL", 1)
    mainDivider:SetPoint("TOPLEFT", enableCheckbox, "BOTTOMLEFT", -8, -12)
    mainDivider:SetPoint("TOPRIGHT", collectionContainer, "TOPRIGHT", -16, -12)
    mainDivider:SetAlpha(0.3)

    yOffset = yOffset - 45 -- More space after main toggle

    -- Collection Type Toggles with Sound Dropdowns and Test Buttons
    local collectionTypes = {
      { key = "newPet",      label = "Pet Collections",      sound = "soundPet",      default = true },
      { key = "newMount",    label = "Mount Collections",    sound = "soundMount",    default = true },
      { key = "newToy",      label = "Toy Collections",      sound = "soundToy",      default = true },
      { key = "newTransmog", label = "Transmog Collections", sound = "soundTransmog", default = true }
    }

    for _, typeData in ipairs(collectionTypes) do
      -- Create a subtle row background for hover effects and better grouping
      local rowFrame = CreateFrame("Frame", nil, collectionContainer)
      rowFrame:SetPoint("TOPLEFT", collectionContainer, "TOPLEFT", 8, yOffset + 4)
      rowFrame:SetPoint("TOPRIGHT", collectionContainer, "TOPRIGHT", -8, yOffset + 4)
      rowFrame:SetHeight(28)
      
      -- Subtle row background
      local rowBg = rowFrame:CreateTexture(nil, "BACKGROUND")
      rowBg:SetAllPoints()
      rowBg:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))
      rowBg:SetAlpha(0.2)
      
      -- Row hover effect
      rowFrame:SetScript("OnEnter", function(self)
        rowBg:SetAlpha(0.4)
      end)
      rowFrame:SetScript("OnLeave", function(self)
        rowBg:SetAlpha(0.2)
      end)

      local typeCheckbox = addon.UIUtils:CreateThemedCheckbox(rowFrame, 18)
      typeCheckbox:SetPoint("LEFT", rowFrame, "LEFT", 8, 0)

      -- Set default if not set
      if GetCollectionSetting(typeData.key) == nil then
        SetCollectionSetting(typeData.key, typeData.default)
      end
      typeCheckbox:SetChecked(GetCollectionSetting(typeData.key))
      checkboxRefs.types[typeData.key] = typeCheckbox

      local typeLabel = rowFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
      typeLabel:SetPoint("LEFT", typeCheckbox, "RIGHT", 12, 0)
      typeLabel:SetText(typeData.label)
      typeLabel:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
      typeLabel:SetJustifyH("LEFT") -- Left-justify the label text

      -- Sound dropdown - positioned to align with other dropdowns on same line (right-justified)
      local soundDropdown = addon.UIUtils:CreateSoundDropdown(rowFrame, 140, 24) -- Slightly wider
      soundDropdown:SetPoint("RIGHT", rowFrame, "RIGHT", -40, 0) -- Right-aligned with offset for test button -- Fixed position for alignment

      -- Set current value from saved settings
      local currentSound = GetCollectionSetting(typeData.sound)
      local validSound = currentSound

      -- Validate that the saved sound still exists in LibSharedMedia
      if currentSound then
        local LSM = LibStub("LibSharedMedia-3.0")
        local soundList = LSM:List("sound")
        local soundExists = false

        if soundList then
          for _, soundName in ipairs(soundList) do
            if soundName == currentSound then
              soundExists = true
              break
            end
          end
        end

        -- If saved sound doesn't exist, fall back to default
        if not soundExists then
          print("|cFF16C3F2NoobTacoUI-Media|r: Saved sound '" .. currentSound .. "' no longer available, using default")
          validSound = false
        end
      end

      if validSound then
        soundDropdown:SetValue(validSound, true) -- Skip callback during initialization
      else
        -- Set default based on type
        local defaultSound = "NT_Pet"
        if typeData.sound == "soundMount" then
          defaultSound = "NT_Mount_Collection"
        elseif typeData.sound == "soundToy" then
          defaultSound = "NT_Toy_Collection"
        elseif typeData.sound == "soundTransmog" then
          defaultSound = "NT_Transmog"
        end
        soundDropdown:SetValue(defaultSound, true) -- Skip callback during initialization
        SetCollectionSetting(typeData.sound, defaultSound)
      end

      -- Test button for each type - positioned to align with other test buttons on same line (right-justified)
      local testButton = addon.UIUtils:CreateSoundTestButton(rowFrame, 24)
      testButton:SetPoint("RIGHT", rowFrame, "RIGHT", -8, 0) -- Right-aligned with padding
      testButton:SetSound(soundDropdown:GetValue()) -- Use the validated sound from dropdown

      -- Store dropdown reference for refreshing
      soundDropdowns[typeData.sound] = soundDropdown

      -- Callback when sound changes - updates both settings and test button
      soundDropdown.OnValueChanged = function(self, value)
        SetCollectionSetting(typeData.sound, value)
        testButton:SetSound(value)
      end

      typeCheckbox:SetScript("OnClick", function(self)
        local checked = self:GetChecked() and true or false
        SetCollectionSetting(typeData.key, checked)
        
        -- Update individual row state
        local rowElementsForType = rowElements[typeData.key]
        if rowElementsForType then
          for _, elementData in ipairs(rowElementsForType) do
            local element = elementData.element
            local elementType = elementData.type

            if elementType == "fontstring" then
              if checked then
                element:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
              else
                element:SetTextColor(unpack(addon.UIAssets.Colors.Nord4)) -- Lighter disabled color
              end
            elseif elementType == "dropdown" or elementType == "testbutton" then
              if checked then
                if element.Enable then
                  element:Enable()
                end
                element:SetAlpha(1.0)
              else
                if element.Disable then
                  element:Disable()
                end
                element:SetAlpha(0.5)
              end
            elseif elementType == "frame" then
              -- Update row background opacity
              if checked then
                element:SetAlpha(1.0)
              else
                element:SetAlpha(0.3)
              end
            end
          end
        end
      end)

      -- Store elements for per-row enable/disable functionality
      rowElements[typeData.key] = {
        { element = typeLabel, type = "fontstring" },
        { element = soundDropdown, type = "dropdown" },
        { element = testButton, type = "testbutton" },
        { element = rowFrame, type = "frame" }
      }

      -- Store elements for enable/disable functionality
      table.insert(configurableElements, { element = typeLabel, type = "fontstring" })
      table.insert(configurableElements, { element = typeCheckbox, type = "button" })
      table.insert(configurableElements, { element = soundDropdown, type = "dropdown" })
      table.insert(configurableElements, { element = testButton, type = "testbutton" })
      table.insert(configurableElements, { element = rowFrame, type = "frame" }) -- Include row frame

      yOffset = yOffset - 32 -- Consistent spacing between rows
    end

    -- Initialize per-row states based on current settings
    for _, typeData in ipairs(collectionTypes) do
      local isEnabled = GetCollectionSetting(typeData.key)
      local rowElementsForType = rowElements[typeData.key]
      
      if rowElementsForType then
        for _, elementData in ipairs(rowElementsForType) do
          local element = elementData.element
          local elementType = elementData.type

          if elementType == "fontstring" then
            if isEnabled then
              element:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
            else
              element:SetTextColor(unpack(addon.UIAssets.Colors.Nord4)) -- Lighter disabled color
            end
          elseif elementType == "dropdown" or elementType == "testbutton" then
            if isEnabled then
              if element.Enable then
                element:Enable()
              end
              element:SetAlpha(1.0)
            else
              if element.Disable then
                element:Disable()
              end
              element:SetAlpha(0.5)
            end
          elseif elementType == "frame" then
            if isEnabled then
              element:SetAlpha(1.0)
            else
              element:SetAlpha(0.3)
            end
          end
        end
      end
    end

    -- Show Chat Messages Toggle with improved styling
    yOffset = yOffset - 15 -- Additional spacing before chat toggle
    
    -- Create chat toggle row
    local chatRowFrame = CreateFrame("Frame", nil, collectionContainer)
    chatRowFrame:SetPoint("TOPLEFT", collectionContainer, "TOPLEFT", 8, yOffset + 4)
    chatRowFrame:SetPoint("TOPRIGHT", collectionContainer, "TOPRIGHT", -8, yOffset + 4)
    chatRowFrame:SetHeight(28)
    
    -- Chat row background with accent color
    local chatRowBg = chatRowFrame:CreateTexture(nil, "BACKGROUND")
    chatRowBg:SetAllPoints()
    chatRowBg:SetColorTexture(unpack(addon.UIAssets.Colors.Nord8)) -- Different accent color
    chatRowBg:SetAlpha(0.15)
    
    -- Chat row hover effect
    chatRowFrame:SetScript("OnEnter", function(self)
      chatRowBg:SetAlpha(0.3)
    end)
    chatRowFrame:SetScript("OnLeave", function(self)
      chatRowBg:SetAlpha(0.15)
    end)
    
    local chatCheckbox = addon.UIUtils:CreateThemedCheckbox(chatRowFrame, 18)
    chatCheckbox:SetPoint("LEFT", chatRowFrame, "LEFT", 8, 0)

    -- Set default if not set
    if GetCollectionSetting("showMessages") == nil then
      SetCollectionSetting("showMessages", true)
    end
    chatCheckbox:SetChecked(GetCollectionSetting("showMessages"))
    checkboxRefs.chat = chatCheckbox

    local chatLabel = chatRowFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    chatLabel:SetPoint("LEFT", chatCheckbox, "RIGHT", 12, 0)
    chatLabel:SetText("Show Chat Messages")
    chatLabel:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))

    chatCheckbox:SetScript("OnClick", function(self)
      local checked = self:GetChecked() and true or false
      SetCollectionSetting("showMessages", checked)
    end)

    -- Add chat elements to configurable list
    table.insert(configurableElements, { element = chatLabel, type = "fontstring" })
    table.insert(configurableElements, { element = chatCheckbox, type = "button" })
    table.insert(configurableElements, { element = chatRowFrame, type = "frame" }) -- Include chat row frame

    -- Function to update elements state based on master toggle
    local function UpdateElementsState(enabled)
      -- Update non-row elements (chat messages, etc.)
      for _, elementData in ipairs(configurableElements) do
        local element = elementData.element
        local elementType = elementData.type

        if elementType == "fontstring" then
          if enabled then
            element:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
          else
            element:SetTextColor(unpack(addon.UIAssets.Colors.Nord4)) -- Lighter disabled color
          end
        elseif elementType == "button" then
          if enabled then
            if element.Enable then
              element:Enable()
            end
            element:SetAlpha(1.0)
          else
            if element.Disable then
              element:Disable()
            end
            element:SetAlpha(0.5)
          end
        elseif elementType == "dropdown" or elementType == "testbutton" then
          -- Handle custom dropdown and test button elements
          if enabled then
            if element.Enable then
              element:Enable()
            end
          else
            if element.Disable then
              element:Disable()
            end
          end
        end
      end
      
      -- Update individual rows based on both master state AND individual checkbox state
      for _, typeData in ipairs(collectionTypes) do
        local individualEnabled = GetCollectionSetting(typeData.key)
        local finalEnabled = enabled and individualEnabled -- Both must be true
        local rowElementsForType = rowElements[typeData.key]
        
        if rowElementsForType then
          for _, elementData in ipairs(rowElementsForType) do
            local element = elementData.element
            local elementType = elementData.type

            if elementType == "fontstring" then
              if finalEnabled then
                element:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
              else
                element:SetTextColor(unpack(addon.UIAssets.Colors.Nord4)) -- Lighter disabled color
              end
            elseif elementType == "dropdown" or elementType == "testbutton" then
              if finalEnabled then
                if element.Enable then
                  element:Enable()
                end
                element:SetAlpha(1.0)
              else
                if element.Disable then
                  element:Disable()
                end
                element:SetAlpha(0.5)
              end
            elseif elementType == "frame" then
              if finalEnabled then
                element:SetAlpha(1.0)
              else
                element:SetAlpha(0.3)
              end
            end
          end
        end
      end
    end

    -- Global enable checkbox functionality
    enableCheckbox:SetScript("OnClick", function(self)
      local enabled = self:GetChecked() and true or false
      SetCollectionSetting("enabled", enabled)
      UpdateElementsState(enabled)
    end)

    -- Apply initial state
    UpdateElementsState(GetCollectionSetting("enabled") ~= false)

    -- Function to refresh dropdown values
    local function RefreshSoundDropdowns()
      for soundKey, dropdown in pairs(soundDropdowns) do
        local currentSound = GetCollectionSetting(soundKey)
        if currentSound then
          dropdown:SetValue(currentSound, true) -- true to skip OnValueChanged callback
        end
      end
    end

    -- Function to refresh checkbox values
    local function RefreshCheckboxes()
      local enabledValue = GetCollectionSetting("enabled") ~= false
      if checkboxRefs.enable then
        checkboxRefs.enable:SetChecked(enabledValue)
      end
      if checkboxRefs.chat then
        checkboxRefs.chat:SetChecked(GetCollectionSetting("showMessages") and true or false)
      end
      for key, cb in pairs(checkboxRefs.types) do
        cb:SetChecked(GetCollectionSetting(key) and true or false)
      end
      -- Ensure dependent controls enable/disable reflects current master state
      if UpdateElementsState then
        UpdateElementsState(enabledValue)
      end
    end

    -- Store refresh functions for external access
    content.audioPanel.RefreshDropdowns = RefreshSoundDropdowns
    content.audioPanel.RefreshCheckboxes = RefreshCheckboxes

    -- Live sync: update UI when settings change
    if addon.CallbackRegistry and addon.CallbackRegistry.RegisterCallback then
      local keys = { "enabled", "showMessages", "newPet", "newMount", "newToy", "newTransmog", "soundPet", "soundMount",
        "soundToy", "soundTransmog" }
      for _, key in ipairs(keys) do
        addon.CallbackRegistry:RegisterCallback("CollectionNotifications." .. key, function()
          if content.currentPanel == content.audioPanel then
            if content.audioPanel.RefreshCheckboxes then content.audioPanel.RefreshCheckboxes() end
            if content.audioPanel.RefreshDropdowns then content.audioPanel.RefreshDropdowns() end
          end
        end)
      end
    end
  end

  -- Refresh UI values before showing
  if content.audioPanel.RefreshDropdowns then content.audioPanel.RefreshDropdowns() end
  if content.audioPanel.RefreshCheckboxes then content.audioPanel.RefreshCheckboxes() end

  content.audioPanel:Show()
  content.currentPanel = content.audioPanel
end)

table.insert(categories, audioButton)

-- General settings button
local generalButton = CreateEnhancedCategoryButton(sidebar, "General Settings", addon.UIAssets.Icons.Settings)
generalButton:SetPoint("TOPLEFT", audioButton, "BOTTOMLEFT", 0, -4)
table.insert(categories, generalButton)

-- About button
local aboutButton = CreateEnhancedCategoryButton(sidebar, "About", addon.UIAssets.Icons.About)
aboutButton:SetPoint("TOPLEFT", generalButton, "BOTTOMLEFT", 0, -4)
aboutButton:SetScript("OnClick", function(self)
  -- Clear previous selection
  if currentCategory then
    currentCategory:SetSelected(false)
  end

  -- Set new selection
  self:SetSelected(true)
  currentCategory = self

  -- Show about panel
  if content.currentPanel then
    content.currentPanel:Hide()
  end

  if not content.aboutPanel then
    content.aboutPanel = CreateEnhancedSettingsPanel(
      content,
      "About NoobTacoUI-Media",
      "Media assets and shared resources for NoobTacoUI addon suite."
    )

    -- Version info
    local versionText = content.aboutPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    versionText:SetPoint("TOPLEFT", content.aboutPanel.Divider, "BOTTOMLEFT", 0, -SECTION_SPACING)
    versionText:SetText("Version " .. (C_AddOns and C_AddOns.GetAddOnMetadata and
      C_AddOns.GetAddOnMetadata("NoobTacoUI-Media", "Version") or "1.1.3"))
    versionText:SetTextColor(unpack(addon.UIAssets.Colors.Nord8))

    -- Author info
    local authorText = content.aboutPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    authorText:SetPoint("TOPLEFT", versionText, "BOTTOMLEFT", 0, -8)
    authorText:SetText("Created by NoobTaco")
    authorText:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))

    -- Description
    local descText = content.aboutPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    descText:SetPoint("TOPLEFT", authorText, "BOTTOMLEFT", 0, -SECTION_SPACING)
    descText:SetPoint("RIGHT", content.aboutPanel, "RIGHT", -PADDING, 0)
    descText:SetJustifyH("LEFT")
    descText:SetJustifyV("TOP")
    descText:SetSpacing(3)
    descText:SetText(
      "This addon provides shared media assets including fonts, textures, and audio files for use across the NoobTacoUI addon suite. It also includes configuration interfaces and utility functions for managing media assets.")
    descText:SetTextColor(unpack(addon.UIAssets.Colors.Nord4))
  end

  content.aboutPanel:Show()
  content.currentPanel = content.aboutPanel
end)

table.insert(categories, aboutButton)

-- Select first category by default
if audioButton then
  audioButton:GetScript("OnClick")(audioButton)
end

-- Expose the enhanced frame
addon.EnhancedConfigFrame = EnhancedConfigFrame

-- Function to show config
addon.ShowConfigMenu = function()
  EnhancedConfigFrame:Show()

  -- Refresh current panel if it's the audio panel
  if content.currentPanel == content.audioPanel then
    if content.audioPanel.RefreshDropdowns then content.audioPanel.RefreshDropdowns() end
    if content.audioPanel.RefreshCheckboxes then content.audioPanel.RefreshCheckboxes() end
  end
end

-- Expose for compatibility
addon.ShowEnhancedConfig = addon.ShowConfigMenu

-- Main slash commands
SLASH_NTUICONFIG1 = "/ntconfig"
SLASH_NTUICONFIG2 = "/ntuiconfig"
SLASH_NTUICONFIG3 = "/ntmedia"
SLASH_NTUICONFIG4 = "/ntuimedia"
SlashCmdList["NTUICONFIG"] = function()
  addon.ShowConfigMenu()
end

-- Collection Notifications shortcut
SLASH_NTCC1 = "/ntcc"
SlashCmdList["NTCC"] = function()
  addon.ShowConfigMenu()
  -- Auto-select audio category if possible
  if audioButton and audioButton.GetScript and audioButton:GetScript("OnClick") then
    audioButton:GetScript("OnClick")(audioButton)
    -- After selection, ensure refresh runs
    if content.audioPanel then
      if content.audioPanel.RefreshDropdowns then content.audioPanel.RefreshDropdowns() end
      if content.audioPanel.RefreshCheckboxes then content.audioPanel.RefreshCheckboxes() end
    end
  end
end

-- Debug command for troubleshooting settings
SLASH_NTDEBUG1 = "/ntdebug"
SlashCmdList["NTDEBUG"] = function()
  print("|cFF16C3F2NoobTacoUI-Media Debug:|r")
  print("NoobTacoUIMediaDB exists: " .. tostring(NoobTacoUIMediaDB ~= nil))

  if NoobTacoUIMediaDB then
    print("CollectionNotifications table exists: " .. tostring(NoobTacoUIMediaDB.CollectionNotifications ~= nil))

    if NoobTacoUIMediaDB.CollectionNotifications then
      print("Current settings:")
      for key, value in pairs(NoobTacoUIMediaDB.CollectionNotifications) do
        print("  " .. key .. " = " .. tostring(value))
      end

      -- Test if sounds exist in LibSharedMedia
      local LSM = LibStub("LibSharedMedia-3.0")
      local soundKeys = { "soundPet", "soundMount", "soundToy", "soundTransmog" }

      print("Sound validation:")
      for _, soundKey in ipairs(soundKeys) do
        local soundName = NoobTacoUIMediaDB.CollectionNotifications[soundKey]
        if type(soundName) == "string" and soundName ~= "" then
          local soundFile = LSM:Fetch("sound", soundName, true) -- silent fetch
          print("  " .. soundKey .. " (" .. soundName .. "): " .. (soundFile and "FOUND" or "MISSING"))
        else
          print("  " .. soundKey .. ": NOT SET")
        end
      end
    end
  end

  print("CollectionNotifications module loaded: " .. tostring(addon.CollectionNotifications ~= nil))

  if addon.CollectionNotifications then
    print("Module GetSetting function: " .. tostring(addon.CollectionNotifications.GetSetting ~= nil))
    print("Module SetSetting function: " .. tostring(addon.CollectionNotifications.SetSetting ~= nil))
  end
end

-- Force refresh dropdowns (for debugging)
SLASH_NTREFRESH1 = "/ntrefresh"
SlashCmdList["NTREFRESH"] = function()
  if _G["NoobTacoUI_ConfigFrame"] and _G["NoobTacoUI_ConfigFrame"]:IsVisible() then
    -- Try to find and refresh any dropdowns
    -- This is a debug function to manually test dropdown refresh
  else
    print("|cFF16C3F2NoobTacoUI-Media|r: Config menu not open. Open it first with /ntconfig")
  end
end
