-- NoobTacoUI-Media Configuration Menu
-- Inspired by Plumber's ControlCenter

local addonName, addon = ...
local CreateFrame = CreateFrame
local L = addon and addon.L or {}
local tinsert = table.insert

-- Make addon globally accessible for other modules
_G.NoobTacoUIMediaAddon = addon

-- Settings table (replace with SavedVariables in production)
NoobTacoDB = NoobTacoDB or {}

-- Layout constants (following Plumber's design)
local RATIO = 0.75 -- height/width
local FRAME_WIDTH = 600
local PADDING = 16
local BUTTON_HEIGHT = 24
local OPTION_GAP_Y = 8
local LEFT_SECTOR_WIDTH = math.floor(0.618 * FRAME_WIDTH + 0.5) -- Golden ratio split

-- Callback registry for settings changes
local CallbackRegistry = {}
CallbackRegistry.callbacks = {}
function CallbackRegistry:RegisterSettingCallback(dbKey, func)
  self.callbacks[dbKey] = self.callbacks[dbKey] or {}
  table.insert(self.callbacks[dbKey], func)
end

function CallbackRegistry:Trigger(dbKey, value)
  if self.callbacks[dbKey] then
    for _, func in ipairs(self.callbacks[dbKey]) do
      func(value)
    end
  end
end

addon.CallbackRegistry = CallbackRegistry

-- Helper to get/set DB values
local function GetDBValue(dbKey)
  return NoobTacoDB[dbKey]
end
local function SetDBValue(dbKey, value, userInput)
  NoobTacoDB[dbKey] = value
  CallbackRegistry:Trigger(dbKey, value, userInput)
end
addon.GetDBValue = GetDBValue
addon.SetDBValue = SetDBValue

-- Categories for organizing modules
local CATEGORY_ORDER = {
  [1] = "General",
  [2] = "Audio",
  [3] = "Fonts",
  [4] = "Textures",
}

-- Module registry
addon.Modules = addon.Modules or {}
local function RegisterModule(moduleData)
  tinsert(addon.Modules, moduleData)
end

-- Main Config Frame using Plumber's approach
local ConfigFrame = CreateFrame("Frame", "NoobTacoUIConfigFrame", UIParent)
ConfigFrame:SetSize(FRAME_WIDTH, FRAME_WIDTH * RATIO)
ConfigFrame:SetPoint("CENTER")
ConfigFrame:SetMovable(true)
ConfigFrame:SetClampedToScreen(true)
ConfigFrame:RegisterForDrag("LeftButton")
ConfigFrame:SetScript("OnDragStart", function(self) self:StartMoving() end)
ConfigFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
ConfigFrame:Hide()

-- Create Nine-Slice Background (simplified version of Plumber's approach)
local Background = ConfigFrame:CreateTexture(nil, "BACKGROUND")
Background:SetAllPoints()
Background:SetColorTexture(0.1, 0.1, 0.1, 0.9) -- Dark semi-transparent background

-- Title Bar
local TitleBar = CreateFrame("Frame", nil, ConfigFrame)
TitleBar:SetHeight(32)
TitleBar:SetPoint("TOPLEFT", ConfigFrame, "TOPLEFT", 0, 0)
TitleBar:SetPoint("TOPRIGHT", ConfigFrame, "TOPRIGHT", 0, 0)

local TitleBG = TitleBar:CreateTexture(nil, "BACKGROUND")
TitleBG:SetAllPoints()
TitleBG:SetColorTexture(0.2, 0.2, 0.2, 1)

local Title = TitleBar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
Title:SetPoint("CENTER", TitleBar, "CENTER", 0, 0)
Title:SetText("NoobTacoUI-Media Configuration")

-- Close Button
local CloseButton = CreateFrame("Button", nil, TitleBar, "UIPanelCloseButton")
CloseButton:SetPoint("TOPRIGHT", TitleBar, "TOPRIGHT", -4, -4)
CloseButton:SetScript("OnClick", function() ConfigFrame:Hide() end)

-- Left Panel (Categories)
local LeftPanel = CreateFrame("Frame", nil, ConfigFrame)
LeftPanel:SetPoint("TOPLEFT", TitleBar, "BOTTOMLEFT", PADDING, -PADDING)
LeftPanel:SetPoint("BOTTOMLEFT", ConfigFrame, "BOTTOMLEFT", PADDING, PADDING)
LeftPanel:SetWidth(LEFT_SECTOR_WIDTH - 2 * PADDING)

local LeftPanelBG = LeftPanel:CreateTexture(nil, "BACKGROUND")
LeftPanelBG:SetAllPoints()
LeftPanelBG:SetColorTexture(0.05, 0.05, 0.05, 0.8)

-- Right Panel (Details)
local RightPanel = CreateFrame("Frame", nil, ConfigFrame)
RightPanel:SetPoint("TOPLEFT", TitleBar, "BOTTOMLEFT", LEFT_SECTOR_WIDTH, -PADDING)
RightPanel:SetPoint("BOTTOMRIGHT", ConfigFrame, "BOTTOMRIGHT", -PADDING, PADDING)

local RightPanelBG = RightPanel:CreateTexture(nil, "BACKGROUND")
RightPanelBG:SetAllPoints()
RightPanelBG:SetColorTexture(0.08, 0.08, 0.08, 0.8)

-- Description text in right panel
local Description = RightPanel:CreateFontString(nil, "OVERLAY", "GameTooltipText")
Description:SetPoint("TOPLEFT", RightPanel, "TOPLEFT", PADDING, -PADDING)
Description:SetPoint("TOPRIGHT", RightPanel, "TOPRIGHT", -PADDING, -PADDING)
Description:SetJustifyH("LEFT")
Description:SetJustifyV("TOP")
Description:SetSpacing(2)
Description:SetTextColor(0.659, 0.659, 0.659)
Description:SetText("Select a category or module from the left panel to view its description and options.")

-- Version text in lower right corner (following Plumber's pattern)
local VersionText = RightPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
VersionText:SetPoint("BOTTOMRIGHT", RightPanel, "BOTTOMRIGHT", -PADDING, PADDING)
VersionText:SetTextColor(0.24, 0.24, 0.24) -- Subtle gray color like Plumber
VersionText:SetJustifyH("RIGHT")
VersionText:SetJustifyV("BOTTOM")

-- Get version from addon metadata or fallback
local function GetAddonVersion()
  local version
  -- Try modern API first, then fallback to legacy API
  if C_AddOns and C_AddOns.GetAddOnMetadata then
    version = C_AddOns.GetAddOnMetadata("NoobTacoUI-Media", "Version")
  elseif GetAddOnMetadata then
    version = GetAddOnMetadata("NoobTacoUI-Media", "Version")
  end

  -- Check if version is the placeholder token or invalid
  if not version or version == "@project-version@" or version == "" then
    -- During development, use the current fallback version
    version = "v1.1.3"
  end

  return version
end
VersionText:SetText("v" .. GetAddonVersion())

-- Category Button Mixin (following Plumber's pattern)
local CategoryButtonMixin = {}

function CategoryButtonMixin:SetCategory(categoryID)
  self.categoryID = categoryID
  self.categoryName = CATEGORY_ORDER[categoryID] or "Unknown"
  self.Label:SetText(self.categoryName)
end

function CategoryButtonMixin:OnClick()
  -- Handle category selection
  Description:SetText("Category: " ..
    (self.categoryName or "Unknown") .. "\n\nThis category contains media assets and configuration options.")
end

function CategoryButtonMixin:OnEnter()
  self.Background:SetColorTexture(0.2, 0.2, 0.2, 1)
end

function CategoryButtonMixin:OnLeave()
  self.Background:SetColorTexture(0.1, 0.1, 0.1, 0.8)
end

-- Create Category Button function
local function CreateCategoryButton(parent, categoryID)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(LEFT_SECTOR_WIDTH - 4 * PADDING, BUTTON_HEIGHT)

  button.Background = button:CreateTexture(nil, "BACKGROUND")
  button.Background:SetAllPoints()
  button.Background:SetColorTexture(0.1, 0.1, 0.1, 0.8)

  button.Label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  button.Label:SetPoint("LEFT", button, "LEFT", 8, 0)
  button.Label:SetTextColor(1, 1, 1)

  Mixin(button, CategoryButtonMixin)
  button:SetCategory(categoryID)
  button:SetScript("OnClick", button.OnClick)
  button:SetScript("OnEnter", button.OnEnter)
  button:SetScript("OnLeave", button.OnLeave)

  return button
end

-- Create category buttons
local categoryButtons = {}
local yOffset = 0
for i = 1, 4 do
  local button = CreateCategoryButton(LeftPanel, i)
  button:SetPoint("TOPLEFT", LeftPanel, "TOPLEFT", PADDING, -yOffset)
  yOffset = yOffset + BUTTON_HEIGHT + OPTION_GAP_Y
  tinsert(categoryButtons, button)
end

-- Example Checkbox Option (improved styling)
local function CreateStyledCheckbox(parent, text, dbKey)
  local checkbox = CreateFrame("CheckButton", nil, parent)
  checkbox:SetSize(20, 20)

  -- Custom checkbox background
  checkbox.Background = checkbox:CreateTexture(nil, "BACKGROUND")
  checkbox.Background:SetAllPoints()
  checkbox.Background:SetColorTexture(0.2, 0.2, 0.2, 1)

  -- Checkmark texture
  checkbox.Check = checkbox:CreateTexture(nil, "OVERLAY")
  checkbox.Check:SetSize(16, 16)
  checkbox.Check:SetPoint("CENTER")
  checkbox.Check:SetColorTexture(0.1, 0.8, 0.1, 1) -- Green checkmark
  checkbox.Check:Hide()

  -- Label
  checkbox.Label = checkbox:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  checkbox.Label:SetPoint("LEFT", checkbox, "RIGHT", 8, 0)
  checkbox.Label:SetText(text)
  checkbox.Label:SetTextColor(1, 1, 1)

  -- Hover effects
  checkbox:SetScript("OnEnter", function(self)
    self.Background:SetColorTexture(0.3, 0.3, 0.3, 1)
  end)
  checkbox:SetScript("OnLeave", function(self)
    self.Background:SetColorTexture(0.2, 0.2, 0.2, 1)
  end)

  -- Click handling
  checkbox:SetScript("OnClick", function(self)
    local checked = not GetDBValue(dbKey)
    SetDBValue(dbKey, checked)
    self.Check:SetShown(checked)
  end)

  -- Initialize state
  local initialState = GetDBValue(dbKey)
  checkbox.Check:SetShown(initialState)

  return checkbox
end

-- Example usage
local exampleCheckbox = CreateStyledCheckbox(RightPanel, "Enable Enhanced Audio", "EnhancedAudio")
exampleCheckbox:SetPoint("TOPLEFT", Description, "BOTTOMLEFT", 0, -20)

-- Register callback for this setting
CallbackRegistry:RegisterSettingCallback("EnhancedAudio", function(value)
  print("Enhanced Audio changed:", value)
  -- Add enable/disable logic here
end)

-- Function to show config menu (called from existing slash command)
local function ShowConfigMenu()
  ConfigFrame:Show()
end
addon.ShowConfigMenu = ShowConfigMenu

-- Integration with WoW's Interface Options
local function RegisterWithInterfaceOptions()
  if Settings and Settings.RegisterCanvasLayoutCategory then
    local category = Settings.RegisterCanvasLayoutCategory(ConfigFrame, "NoobTacoUI-Media")
    Settings.RegisterAddOnCategory(category)
  end
end

-- Register when addon loads
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, loadedAddonName)
  if loadedAddonName == "NoobTacoUI-Media" then
    RegisterWithInterfaceOptions()
    self:UnregisterEvent("ADDON_LOADED")
  end
end)

-- Collection Notifications module configuration
local function CreateCollectionNotificationsConfig()
  if not addon.CollectionNotifications then return end

  local yOffset = -60
  local function CreateCheckbox(parent, text, setting)
    local checkbox = CreateStyledCheckbox(parent, text, "CollectionNotifications." .. setting)
    checkbox:SetPoint("TOPLEFT", Description, "BOTTOMLEFT", 0, yOffset)
    yOffset = yOffset - 25

    -- Register callback to update the collection notification settings
    CallbackRegistry:RegisterSettingCallback("CollectionNotifications." .. setting, function(value)
      addon.CollectionNotifications.SetSetting(setting, value)
      if setting == "enabled" then
        if value then
          addon.CollectionNotifications.RegisterEvents()
        else
          addon.CollectionNotifications.UnregisterEvents()
        end
      end
    end)

    return checkbox
  end

  -- Create checkboxes for all collection notification types
  CreateCheckbox(RightPanel, "Enable Collection Notifications", "enabled")
  CreateCheckbox(RightPanel, "New Pet Notifications", "newPet")
  CreateCheckbox(RightPanel, "New Mount Notifications", "newMount")
  CreateCheckbox(RightPanel, "New Toy Notifications", "newToy")
  CreateCheckbox(RightPanel, "Achievement Notifications", "newAchievement")
  CreateCheckbox(RightPanel, "Transmog Notifications", "newTransmog")
  CreateCheckbox(RightPanel, "Title Notifications", "newTitle")
  CreateCheckbox(RightPanel, "Show Chat Messages", "showMessages")
end

-- Module registrations
RegisterModule({
  name = "Collection Notifications",
  dbKey = "CollectionNotifications",
  description =
  "Play audio notifications when you collect new pets, mounts, toys, achievements, transmog appearances, and titles. Configure which types of collections trigger notifications and customize the sounds played for each type.",
  configFunc = CreateCollectionNotificationsConfig,
  categoryID = 2, -- Audio category
  uiOrder = 50,
})

RegisterModule({
  name = "Enhanced Audio",
  dbKey = "EnhancedAudio",
  description = "Provides enhanced audio features and custom sound effects.",
  toggleFunc = function(state) print("Enhanced Audio toggled:", state) end,
  categoryID = 2, -- Audio category
  uiOrder = 100,
})

RegisterModule({
  name = "Custom Fonts",
  dbKey = "CustomFonts",
  description = "Enables custom font rendering and typography options.",
  toggleFunc = function(state) print("Custom Fonts toggled:", state) end,
  categoryID = 3, -- Fonts category
  uiOrder = 200,
})
