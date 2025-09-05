-- NoobTacoUI-Media Enhanced Config Menu
-- Enhanced with Plumber-style design patterns using Nord theme

local addonName, addon = ...
local CreateFrame = CreateFrame

-- Initialize database if needed
NoobTacoDB = NoobTacoDB or {}

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
    if not NoobTacoDB.CollectionNotifications then
      NoobTacoDB.CollectionNotifications = {}
    end
    return NoobTacoDB.CollectionNotifications.enabled
  end
  return NoobTacoDB[key]
end

local function SetDBValue(key, value)
  if key == "CollectionNotificationsEnabled" then
    -- Use CollectionNotifications settings structure
    if not NoobTacoDB.CollectionNotifications then
      NoobTacoDB.CollectionNotifications = {}
    end
    NoobTacoDB.CollectionNotifications.enabled = value
  else
    NoobTacoDB[key] = value
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
  frame:RegisterForDrag("LeftButton")
  frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
  frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
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

  -- Header background with gradient
  header.Background = header:CreateTexture(nil, "BACKGROUND")
  header.Background:SetAllPoints()
  header.Background:SetTexture(addon.UIAssets.Gradients.PanelGrad)
  header.Background:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))

  -- Title with enhanced styling
  header.Title = addon.UIUtils:CreateCategoryHeader(header, "NoobTacoUI-Media Configuration")
  header.Title:SetPoint("LEFT", header, "LEFT", PADDING, 0)

  -- Close button with enhanced styling
  header.CloseButton = addon.UIUtils:CreateIconButton(header, "×", 24)
  header.CloseButton:SetPoint("RIGHT", header, "RIGHT", -PADDING, 0)
  header.CloseButton:SetScript("OnClick", function() parent:Hide() end)

  -- Add hover effect to close button
  header.CloseButton:SetScript("OnEnter", function(self)
    self.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord11)) -- Red on hover
  end)

  header.CloseButton:SetScript("OnLeave", function(self)
    self.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord4))
  end)

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
local function CreateEnhancedCategoryButton(parent, text, iconText)
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

  -- Icon (if provided)
  if iconText then
    button.Icon = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.Icon:SetPoint("LEFT", button, "LEFT", INNER_PADDING, 0)
    button.Icon:SetText(iconText)
    button.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord8))
  end

  -- Text label
  button.Label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  if iconText then
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
        self.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord8))
      end
    else
      self.SelectedBG:Hide()
      self.Label:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
      if self.Icon then
        self.Icon:SetTextColor(unpack(addon.UIAssets.Colors.Nord8))
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
local audioButton = CreateEnhancedCategoryButton(sidebar, "Audio Settings", "🔊")
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

    -- Enable toggle
    local enableCheckbox = addon.UIUtils:CreateThemedCheckbox(content.audioPanel, 20)
    enableCheckbox:SetPoint("TOPLEFT", collectionHeader, "BOTTOMLEFT", 0, -INNER_PADDING)
    enableCheckbox:SetChecked(addon.GetDBValue("CollectionNotificationsEnabled") ~= false)

    local enableLabel = content.audioPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    enableLabel:SetPoint("LEFT", enableCheckbox, "RIGHT", 8, 0)
    enableLabel:SetText("Enable Collection Notifications")
    enableLabel:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))

    enableCheckbox:SetScript("OnClick", function(self)
      addon.SetDBValue("CollectionNotificationsEnabled", self:GetChecked())
    end)

    -- Settings button
    local settingsButton = addon.UIUtils:CreateThemedButton(content.audioPanel, "Detailed Settings", 150, 28)
    settingsButton:SetPoint("TOPLEFT", enableCheckbox, "BOTTOMLEFT", 0, -INNER_PADDING)
    settingsButton:SetScript("OnClick", function()
      -- Call the popup function from the main ConfigMenu
      if addon.CreateCollectionNotificationsPopup then
        addon.CreateCollectionNotificationsPopup()
      end
    end)
  end

  content.audioPanel:Show()
  content.currentPanel = content.audioPanel
end)

table.insert(categories, audioButton)

-- General settings button
local generalButton = CreateEnhancedCategoryButton(sidebar, "General Settings", "⚙️")
generalButton:SetPoint("TOPLEFT", audioButton, "BOTTOMLEFT", 0, -4)
table.insert(categories, generalButton)

-- About button
local aboutButton = CreateEnhancedCategoryButton(sidebar, "About", "ℹ️")
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
  end
end
