-- NoobTacoUI-Media Configuration Menu
-- Based on Plumber's ControlCenter design

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
local DIFFERENT_CATEGORY_OFFSET = 8
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
local function SetDBValue(dbKey, value)
  NoobTacoDB[dbKey] = value
  CallbackRegistry:Trigger(dbKey, value)
end
addon.GetDBValue = GetDBValue
addon.SetDBValue = SetDBValue

-- Categories for organizing modules
local CATEGORY_ORDER = {
  [1] = "Audio",
}

-- Module registry
addon.Modules = addon.Modules or {}
local function RegisterModule(moduleData)
  tinsert(addon.Modules, moduleData)
end

-- Forward declarations
local CreateCollectionNotificationsConfig
local ScrollFrame, ScrollChild, SelectionTexture, preview, description

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

-- ScrollFrame for left panel (following Plumber's pattern)
ScrollFrame = CreateFrame("Frame", nil, ConfigFrame)
ScrollFrame:SetPoint("TOPLEFT", TitleBar, "BOTTOMLEFT", 0, 0)
ScrollFrame:SetPoint("BOTTOMLEFT", ConfigFrame, "BOTTOMLEFT", 0, 0)
ScrollFrame:SetWidth(LEFT_SECTOR_WIDTH)

ScrollChild = CreateFrame("Frame", nil, ScrollFrame)
ScrollChild:SetSize(8, 8)
ScrollChild:SetPoint("TOPLEFT", ScrollFrame, "TOPLEFT", 0, 0)
ScrollFrame.ScrollChild = ScrollChild

-- Right Panel (Details)
local RightPanel = CreateFrame("Frame", nil, ConfigFrame)
RightPanel:SetPoint("TOPLEFT", TitleBar, "BOTTOMLEFT", LEFT_SECTOR_WIDTH, 0)
RightPanel:SetPoint("BOTTOMRIGHT", ConfigFrame, "BOTTOMRIGHT", 0, 0)

local RightPanelBG = RightPanel:CreateTexture(nil, "BACKGROUND")
RightPanelBG:SetAllPoints()
RightPanelBG:SetColorTexture(0.08, 0.08, 0.08, 0.8)

-- Header height for calculations
local headerHeight = TitleBar:GetHeight()

-- Preview texture (following Plumber's design)
local previewSize = FRAME_WIDTH - LEFT_SECTOR_WIDTH - 2 * PADDING + 4
preview = RightPanel:CreateTexture(nil, "OVERLAY")
preview:SetSize(previewSize, previewSize)
preview:SetPoint("TOPRIGHT", RightPanel, "TOPRIGHT", -PADDING, -PADDING)

-- Description text in right panel
description = RightPanel:CreateFontString(nil, "OVERLAY", "GameTooltipText")
description:SetPoint("TOPLEFT", preview, "BOTTOMLEFT", 4, -PADDING)
description:SetPoint("BOTTOMRIGHT", RightPanel, "BOTTOMRIGHT", -PADDING - 4, PADDING)
description:SetJustifyH("LEFT")
description:SetJustifyV("TOP")
description:SetSpacing(2)
description:SetTextColor(0.659, 0.659, 0.659)
description:SetShadowColor(0, 0, 0)
description:SetShadowOffset(1, -1)
description:SetText("Select a category from the left panel to view its description and options.")

-- Dividers (following Plumber's design)
local dividerTop = RightPanel:CreateTexture(nil, "OVERLAY")
dividerTop:SetSize(16, 16)
dividerTop:SetPoint("TOPRIGHT", ConfigFrame, "TOPLEFT", LEFT_SECTOR_WIDTH, -headerHeight)
dividerTop:SetColorTexture(0.2, 0.2, 0.2, 0.8)

local dividerBottom = RightPanel:CreateTexture(nil, "OVERLAY")
dividerBottom:SetSize(16, 16)
dividerBottom:SetPoint("BOTTOMRIGHT", ConfigFrame, "BOTTOMLEFT", LEFT_SECTOR_WIDTH, 0)
dividerBottom:SetColorTexture(0.2, 0.2, 0.2, 0.8)

local dividerMiddle = RightPanel:CreateTexture(nil, "OVERLAY")
dividerMiddle:SetPoint("TOPLEFT", dividerTop, "BOTTOMLEFT", 0, 0)
dividerMiddle:SetPoint("BOTTOMRIGHT", dividerBottom, "TOPRIGHT", 0, 0)
dividerMiddle:SetColorTexture(0.2, 0.2, 0.2, 0.8)

-- Selection highlight (following Plumber's design)
SelectionTexture = ScrollChild:CreateTexture(nil, "ARTWORK")
SelectionTexture:SetSize(LEFT_SECTOR_WIDTH - PADDING, BUTTON_HEIGHT)
SelectionTexture:SetColorTexture(0.2, 0.6, 1, 0.1)
SelectionTexture:SetBlendMode("ADD")
SelectionTexture:Hide()

-- Version text in lower right corner (following Plumber's pattern)
local VersionText = RightPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
VersionText:SetPoint("BOTTOMRIGHT", RightPanel, "BOTTOMRIGHT", -PADDING, PADDING)
VersionText:SetTextColor(0.24, 0.24, 0.24) -- Subtle gray color like Plumber
VersionText:SetJustifyH("RIGHT")
VersionText:SetJustifyV("BOTTOM")

-- Get version from addon metadata or fallback
local function GetAddonVersion()
  local version
  -- Try modern API first
  if C_AddOns and C_AddOns.GetAddOnMetadata then
    version = C_AddOns.GetAddOnMetadata("NoobTacoUI-Media", "Version")
  end

  -- Check if version is the placeholder token or invalid
  if not version or version == "@project-version@" or version == "" then
    -- During development, use the current fallback version
    version = "1.1.3"
  end

  return version
end
VersionText:SetText("v" .. GetAddonVersion())

-- Category Button Mixin (following Plumber's pattern)
local CategoryButtonMixin = {}

function CategoryButtonMixin:SetCategory(categoryID)
  self.categoryID = categoryID
  self.categoryKey = CATEGORY_ORDER[categoryID] or "Unknown"
  self.Label:SetText(self.categoryKey)
end

function CategoryButtonMixin:OnLoad()
  self.collapsed = false
  self.childOptions = {}
  self:UpdateArrow()
end

function CategoryButtonMixin:UpdateArrow()
  if self.collapsed then
    self.Arrow:SetText("▶")
  else
    self.Arrow:SetText("▼")
  end
end

function CategoryButtonMixin:Expand()
  if self.collapsed then
    self.collapsed = false
    self.Drawer:SetHeight(self.drawerHeight or 100)
    self.Drawer:Show()
    self:UpdateArrow()
  end
end

function CategoryButtonMixin:Collapse()
  if not self.collapsed then
    self.collapsed = true
    self.Drawer:SetHeight(DIFFERENT_CATEGORY_OFFSET)
    self.Drawer:Hide()
    self:UpdateArrow()
  end
end

function CategoryButtonMixin:ToggleCollapse()
  if self.collapsed then
    self:Expand()
  else
    self:Collapse()
  end
end

function CategoryButtonMixin:OnClick()
  self:ToggleCollapse()

  -- Show category description
  if self.categoryID == 1 then -- Audio category (now category 1)
    description:SetText(
      "Audio Category\n\nConfigure audio-related features including collection notifications, custom sounds, and audio alerts.")
    preview:SetColorTexture(0.1, 0.3, 0.5, 0.8) -- Blue tint for audio
  else
    description:SetText("Category: " ..
      (self.categoryKey or "Unknown") .. "\n\nThis category contains media assets and configuration options.")
    preview:SetColorTexture(0.15, 0.15, 0.15, 0.8)
  end
end

function CategoryButtonMixin:OnEnter()
  self.Background:SetColorTexture(0.2, 0.2, 0.2, 1)

  -- Show selection highlight
  SelectionTexture:ClearAllPoints()
  SelectionTexture:SetPoint("LEFT", self, "LEFT", -PADDING, 0)
  SelectionTexture:Show()
end

function CategoryButtonMixin:OnLeave()
  self.Background:SetColorTexture(0.1, 0.1, 0.1, 0.8)
  if not self:IsMouseOver() then
    SelectionTexture:Hide()
  end
end

function CategoryButtonMixin:AddChildOption(option)
  if not self.numOptions then
    self.numOptions = 0
  end
  self.numOptions = self.numOptions + 1
  tinsert(self.childOptions, option)
end

function CategoryButtonMixin:InitializeDrawer()
  self.drawerHeight = (self.numOptions or 1) * (OPTION_GAP_Y + BUTTON_HEIGHT) + OPTION_GAP_Y + DIFFERENT_CATEGORY_OFFSET
  self.Drawer:SetHeight(self.drawerHeight)
end

-- Create Category Button function (following Plumber's design)
local function CreateCategoryButton(parent)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(LEFT_SECTOR_WIDTH - PADDING, BUTTON_HEIGHT)

  -- Background
  button.Background = button:CreateTexture(nil, "BACKGROUND")
  button.Background:SetAllPoints()
  button.Background:SetColorTexture(0.1, 0.1, 0.1, 0.8)

  -- Arrow indicator
  button.Arrow = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  button.Arrow:SetPoint("LEFT", button, "LEFT", 8, 0)
  button.Arrow:SetTextColor(0.8, 0.8, 0.8)

  -- Label
  button.Label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  button.Label:SetPoint("LEFT", button, "LEFT", 28, 0)
  button.Label:SetJustifyH("LEFT")
  button.Label:SetTextColor(1, 1, 1)

  -- Drawer for child options
  button.Drawer = CreateFrame("Frame", nil, button)
  button.Drawer:SetPoint("TOPLEFT", button, "BOTTOMLEFT", 0, 0)
  button.Drawer:SetSize(16, 16)

  Mixin(button, CategoryButtonMixin)
  button:SetScript("OnClick", button.OnClick)
  button:SetScript("OnEnter", button.OnEnter)
  button:SetScript("OnLeave", button.OnLeave)
  button:OnLoad()

  return button
end

-- Sub-option Button function (for items under categories)
local function CreateSubOptionButton(parent, text, onClick)
  local button = CreateFrame("Button", nil, parent)
  button:SetSize(LEFT_SECTOR_WIDTH - 6 * PADDING, BUTTON_HEIGHT)

  button.Background = button:CreateTexture(nil, "BACKGROUND")
  button.Background:SetAllPoints()
  button.Background:SetColorTexture(0.05, 0.05, 0.05, 0.6)

  button.Label = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  button.Label:SetPoint("LEFT", button, "LEFT", 24, 0) -- Indented more than category
  button.Label:SetText(text)
  button.Label:SetTextColor(0.8, 0.8, 0.8)             -- Slightly dimmer than category

  button:SetScript("OnClick", onClick)
  button:SetScript("OnEnter", function(self)
    self.Background:SetColorTexture(0.15, 0.15, 0.15, 0.8)
    self.Label:SetTextColor(1, 1, 1)

    -- Show selection highlight
    SelectionTexture:ClearAllPoints()
    SelectionTexture:SetPoint("LEFT", self, "LEFT", -PADDING * 1.5, 0)
    SelectionTexture:Show()
  end)
  button:SetScript("OnLeave", function(self)
    self.Background:SetColorTexture(0.05, 0.05, 0.05, 0.6)
    self.Label:SetTextColor(0.8, 0.8, 0.8)
    if not self:IsMouseOver() then
      SelectionTexture:Hide()
    end
  end)

  return button
end

-- Create category buttons and structure
local categoryButtons = {}
local fromOffsetY = PADDING
local lastCategoryButton

-- Create only the Audio category
local button = CreateCategoryButton(ScrollChild)
button:SetCategory(1) -- Audio is now category 1
button:SetPoint("TOPLEFT", ScrollChild, "TOPLEFT", PADDING, -fromOffsetY)

tinsert(categoryButtons, button)

-- Add sub-options for Audio category
local collectionNotifButton = CreateSubOptionButton(button.Drawer, "Collection Notifications", function()
  description:SetText(
    "Collection Notifications\n\nReceive audio notifications when you collect new pets, mounts, toys, and transmog appearances.\n\nUse the settings button (⚙) to open the detailed configuration window, or toggle the checkbox to enable/disable globally.")
  preview:SetColorTexture(0.1, 0.5, 0.3, 0.8) -- Green tint for collection notifications
  -- Removed CreateCollectionNotificationsConfig() - now using popup instead
end)

-- Add checkbox for global enable toggle
local globalEnableCheckbox = CreateFrame("CheckButton", nil, collectionNotifButton, "ChatConfigCheckButtonTemplate")
globalEnableCheckbox:SetPoint("LEFT", collectionNotifButton, "LEFT", 2, 0)
globalEnableCheckbox:SetSize(16, 16)
globalEnableCheckbox:SetChecked(GetDBValue("CollectionNotificationsEnabled") ~= false)
globalEnableCheckbox:SetScript("OnClick", function(self)
  SetDBValue("CollectionNotificationsEnabled", self:GetChecked())
  -- No longer need to refresh right panel config since we use popup now
end)

-- Adjust the label position to make room for the checkbox
collectionNotifButton.Label:SetPoint("LEFT", collectionNotifButton, "LEFT", 44, 0)

-- Add cog wheel settings button (following Plumber's design)
local cogButton = CreateFrame("Button", nil, collectionNotifButton)
cogButton:SetSize(16, 16)
cogButton:SetPoint("RIGHT", collectionNotifButton, "RIGHT", -4, 0)

-- Create cog wheel texture/icon
local cogIcon = cogButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
cogIcon:SetPoint("CENTER")
cogIcon:SetText("⚙") -- Gear/cog Unicode character
cogIcon:SetTextColor(0.7, 0.7, 0.7)

-- Hover effects for cog button
cogButton:SetScript("OnEnter", function(self)
  cogIcon:SetTextColor(1, 1, 1) -- Brighter on hover
  GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
  GameTooltip:SetText("Collection Notifications Settings", 1, 1, 1)
  GameTooltip:AddLine("Click to open detailed configuration window", 0.8, 0.8, 0.8, true)
  GameTooltip:Show()
end)

cogButton:SetScript("OnLeave", function(self)
  cogIcon:SetTextColor(0.7, 0.7, 0.7) -- Back to normal
  GameTooltip:Hide()
end)

-- Forward declaration for the popup window function
local CreateCollectionNotificationsPopup

cogButton:SetScript("OnClick", function()
  CreateCollectionNotificationsPopup()
end)

collectionNotifButton:SetPoint("TOPLEFT", button.Drawer, "TOPLEFT", 8, -OPTION_GAP_Y)
button:AddChildOption(collectionNotifButton)

button:InitializeDrawer()
lastCategoryButton = button

-- Collection Notifications Config Creation Function
function CreateCollectionNotificationsConfig()
  -- Clear existing config elements
  if RightPanel.configElements then
    for _, element in ipairs(RightPanel.configElements) do
      if element and element.Hide then
        element:Hide()
      end
    end
    RightPanel.configElements = nil
  end

  RightPanel.configElements = {}

  -- Configuration panel for Collection Notifications
  local configPanel = CreateFrame("Frame", nil, RightPanel)
  configPanel:SetPoint("TOPLEFT", description, "BOTTOMLEFT", -4, -20)
  configPanel:SetPoint("BOTTOMRIGHT", RightPanel, "BOTTOMRIGHT", -PADDING, 40)
  tinsert(RightPanel.configElements, configPanel)

  local yOffset = 0

  -- Check if Collection Notifications are globally enabled
  local isGloballyEnabled = GetDBValue("CollectionNotificationsEnabled") ~= false

  -- Store all configurable elements for enabling/disabling
  local configurableElements = {}

  -- Collection Type Toggles
  local collectionTypes = {
    { key = "PetNotificationsEnabled",      label = "Pet Collections" },
    { key = "MountNotificationsEnabled",    label = "Mount Collections" },
    { key = "ToyNotificationsEnabled",      label = "Toy Collections" },
    { key = "TransmogNotificationsEnabled", label = "Transmog Collections" }
  }

  for _, typeData in ipairs(collectionTypes) do
    local typeLabel = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    typeLabel:SetPoint("TOPLEFT", configPanel, "TOPLEFT", 20, -yOffset)
    typeLabel:SetText(typeData.label)
    typeLabel:SetTextColor(0.9, 0.9, 0.9)

    local typeCheckbox = CreateFrame("CheckButton", nil, configPanel, "ChatConfigCheckButtonTemplate")
    typeCheckbox:SetPoint("LEFT", typeLabel, "RIGHT", 10, 0)
    typeCheckbox:SetSize(18, 18)
    typeCheckbox:SetChecked(GetDBValue(typeData.key) ~= false)
    typeCheckbox:SetScript("OnClick", function(self)
      SetDBValue(typeData.key, self:GetChecked())
    end)

    -- Add to configurable elements for enable/disable functionality
    tinsert(configurableElements, { element = typeLabel, type = "fontstring" })
    tinsert(configurableElements, { element = typeCheckbox, type = "button" })

    yOffset = yOffset + 25
  end

  yOffset = yOffset + 10

  -- Audio Selection Section
  local audioLabel = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  audioLabel:SetPoint("TOPLEFT", configPanel, "TOPLEFT", 0, -yOffset)
  audioLabel:SetText("Notification Sound")
  audioLabel:SetTextColor(1, 1, 1)
  tinsert(configurableElements, { element = audioLabel, type = "fontstring" })

  yOffset = yOffset + 25

  -- Simple dropdown for audio selection (avoiding deprecated APIs)
  local currentSound = GetDBValue("CollectionNotificationSound") or "NT_InfussionOfLight"

  local dropdownButton = CreateFrame("Button", nil, configPanel)
  dropdownButton:SetSize(200, 24)
  dropdownButton:SetPoint("TOPLEFT", configPanel, "TOPLEFT", 20, -yOffset)

  local dropdownBG = dropdownButton:CreateTexture(nil, "BACKGROUND")
  dropdownBG:SetAllPoints()
  dropdownBG:SetColorTexture(0.15, 0.15, 0.15, 0.9)

  local dropdownText = dropdownButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  dropdownText:SetPoint("LEFT", dropdownButton, "LEFT", 8, 0)
  dropdownText:SetText(currentSound)
  dropdownText:SetTextColor(1, 1, 1)

  local dropdownArrow = dropdownButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  dropdownArrow:SetPoint("RIGHT", dropdownButton, "RIGHT", -8, 0)
  dropdownArrow:SetText("▼")
  dropdownArrow:SetTextColor(0.8, 0.8, 0.8)

  -- Test button next to dropdown
  local testButton = CreateFrame("Button", nil, configPanel)
  testButton:SetSize(60, 24)
  testButton:SetPoint("LEFT", dropdownButton, "RIGHT", 10, 0)

  local testBG = testButton:CreateTexture(nil, "BACKGROUND")
  testBG:SetAllPoints()
  testBG:SetColorTexture(0.2, 0.4, 0.2, 0.9)

  local testText = testButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  testText:SetPoint("CENTER")
  testText:SetText("Test")
  testText:SetTextColor(1, 1, 1)

  testButton:SetScript("OnClick", function()
    -- Test play the current sound
    local soundFile = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Audio\\nt_InfussionOfLight.ogg"
    PlaySoundFile(soundFile, "Master")
  end)

  testButton:SetScript("OnEnter", function(self)
    testBG:SetColorTexture(0.3, 0.5, 0.3, 1)
  end)

  testButton:SetScript("OnLeave", function(self)
    testBG:SetColorTexture(0.2, 0.4, 0.2, 0.9)
  end)

  -- Add dropdown and test button to configurable elements
  tinsert(configurableElements, { element = dropdownButton, type = "button" })
  tinsert(configurableElements, { element = testButton, type = "button" })

  -- Simple sound selection (can be expanded later)
  local sounds = { "NT_InfussionOfLight", "NT_Chest", "NT_Mount" }
  local currentIndex = 1
  for i, sound in ipairs(sounds) do
    if sound == currentSound then
      currentIndex = i
      break
    end
  end

  dropdownButton:SetScript("OnClick", function()
    currentIndex = currentIndex + 1
    if currentIndex > #sounds then
      currentIndex = 1
    end
    local newSound = sounds[currentIndex]
    dropdownText:SetText(newSound)
    SetDBValue("CollectionNotificationSound", newSound)
  end)

  dropdownButton:SetScript("OnEnter", function(self)
    dropdownBG:SetColorTexture(0.25, 0.25, 0.25, 1)
  end)

  dropdownButton:SetScript("OnLeave", function(self)
    dropdownBG:SetColorTexture(0.15, 0.15, 0.15, 0.9)
  end)

  -- Function to enable/disable elements based on global toggle
  local function UpdateElementsState(enabled)
    for _, elementData in ipairs(configurableElements) do
      local element = elementData.element
      local elementType = elementData.type

      if elementType == "fontstring" then
        if enabled then
          element:SetTextColor(0.9, 0.9, 0.9) -- Normal color
        else
          element:SetTextColor(0.4, 0.4, 0.4) -- Greyed out
        end
      elseif elementType == "button" then
        if enabled then
          element:Enable()
          element:SetAlpha(1.0)
        else
          element:Disable()
          element:SetAlpha(0.5) -- Semi-transparent when disabled
        end
      end
    end
  end

  -- Apply initial state
  UpdateElementsState(isGloballyEnabled)
end

-- Collection Notifications Popup Window (following Plumber's design pattern)
function CreateCollectionNotificationsPopup()
  -- Check if popup already exists and close it
  if _G["NoobTacoUICollectionNotifPopup"] then
    _G["NoobTacoUICollectionNotifPopup"]:Hide()
    _G["NoobTacoUICollectionNotifPopup"] = nil
  end

  -- Create the popup window
  local popupWidth = 400
  local popupHeight = 300
  local popup = CreateFrame("Frame", "NoobTacoUICollectionNotifPopup", UIParent)
  popup:SetSize(popupWidth, popupHeight)
  popup:SetPoint("CENTER", UIParent, "CENTER", 50, 0) -- Slight offset from center
  popup:SetMovable(true)
  popup:SetClampedToScreen(true)
  popup:RegisterForDrag("LeftButton")
  popup:SetScript("OnDragStart", function(self) self:StartMoving() end)
  popup:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
  popup:SetFrameStrata("DIALOG")
  popup:SetFrameLevel(100)

  -- Background (following Plumber's style)
  local bg = popup:CreateTexture(nil, "BACKGROUND")
  bg:SetAllPoints()
  bg:SetColorTexture(0.1, 0.1, 0.1, 0.95)

  -- Border
  local border = popup:CreateTexture(nil, "BORDER")
  border:SetAllPoints()
  border:SetColorTexture(0.3, 0.3, 0.3, 1)
  border:SetPoint("TOPLEFT", popup, "TOPLEFT", -2, 2)
  border:SetPoint("BOTTOMRIGHT", popup, "BOTTOMRIGHT", 2, -2)

  -- Title Bar
  local titleBar = CreateFrame("Frame", nil, popup)
  titleBar:SetHeight(28)
  titleBar:SetPoint("TOPLEFT", popup, "TOPLEFT", 0, 0)
  titleBar:SetPoint("TOPRIGHT", popup, "TOPRIGHT", 0, 0)

  local titleBG = titleBar:CreateTexture(nil, "BACKGROUND")
  titleBG:SetAllPoints()
  titleBG:SetColorTexture(0.2, 0.2, 0.2, 1)

  local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  title:SetPoint("LEFT", titleBar, "LEFT", 12, 0)
  title:SetText("Collection Notifications Settings")
  title:SetTextColor(1, 1, 1)

  -- Close button
  local closeButton = CreateFrame("Button", nil, titleBar)
  closeButton:SetSize(20, 20)
  closeButton:SetPoint("RIGHT", titleBar, "RIGHT", -4, 0)

  local closeX = closeButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  closeX:SetPoint("CENTER")
  closeX:SetText("×")
  closeX:SetTextColor(0.8, 0.8, 0.8)

  closeButton:SetScript("OnClick", function() popup:Hide() end)
  closeButton:SetScript("OnEnter", function() closeX:SetTextColor(1, 0.2, 0.2) end)
  closeButton:SetScript("OnLeave", function() closeX:SetTextColor(0.8, 0.8, 0.8) end)

  -- Content area
  local contentFrame = CreateFrame("Frame", nil, popup)
  contentFrame:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", 12, -8)
  contentFrame:SetPoint("BOTTOMRIGHT", popup, "BOTTOMRIGHT", -12, 12)

  -- Check if Collection Notifications are globally enabled
  local isGloballyEnabled = GetDBValue("CollectionNotificationsEnabled") ~= false

  local yOffset = 0

  -- Global Enable Toggle
  local enableLabel = contentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  enableLabel:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 0, -yOffset)
  enableLabel:SetText("Enable Collection Notifications")
  enableLabel:SetTextColor(1, 1, 1)

  local enableCheckbox = CreateFrame("CheckButton", nil, contentFrame, "ChatConfigCheckButtonTemplate")
  enableCheckbox:SetPoint("LEFT", enableLabel, "RIGHT", 10, 0)
  enableCheckbox:SetSize(20, 20)
  enableCheckbox:SetChecked(isGloballyEnabled)

  yOffset = yOffset + 35

  -- Store configurable elements for enable/disable functionality
  local popupConfigurableElements = {}

  -- Collection Type Toggles
  local collectionTypes = {
    { key = "PetNotificationsEnabled",      label = "Pet Collections" },
    { key = "MountNotificationsEnabled",    label = "Mount Collections" },
    { key = "ToyNotificationsEnabled",      label = "Toy Collections" },
    { key = "TransmogNotificationsEnabled", label = "Transmog Collections" }
  }

  for _, typeData in ipairs(collectionTypes) do
    local typeLabel = contentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    typeLabel:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 20, -yOffset)
    typeLabel:SetText(typeData.label)
    typeLabel:SetTextColor(0.9, 0.9, 0.9)

    local typeCheckbox = CreateFrame("CheckButton", nil, contentFrame, "ChatConfigCheckButtonTemplate")
    typeCheckbox:SetPoint("LEFT", typeLabel, "RIGHT", 10, 0)
    typeCheckbox:SetSize(18, 18)
    typeCheckbox:SetChecked(GetDBValue(typeData.key) ~= false)
    typeCheckbox:SetScript("OnClick", function(self)
      SetDBValue(typeData.key, self:GetChecked())
    end)

    -- Add to configurable elements
    tinsert(popupConfigurableElements, { element = typeLabel, type = "fontstring" })
    tinsert(popupConfigurableElements, { element = typeCheckbox, type = "button" })

    yOffset = yOffset + 25
  end

  yOffset = yOffset + 15

  -- Audio Selection Section
  local audioLabel = contentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  audioLabel:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 0, -yOffset)
  audioLabel:SetText("Notification Sound")
  audioLabel:SetTextColor(1, 1, 1)
  tinsert(popupConfigurableElements, { element = audioLabel, type = "fontstring" })

  yOffset = yOffset + 25

  -- Audio dropdown and test button
  local currentSound = GetDBValue("CollectionNotificationSound") or "NT_InfussionOfLight"

  local dropdownButton = CreateFrame("Button", nil, contentFrame)
  dropdownButton:SetSize(180, 24)
  dropdownButton:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 20, -yOffset)

  local dropdownBG = dropdownButton:CreateTexture(nil, "BACKGROUND")
  dropdownBG:SetAllPoints()
  dropdownBG:SetColorTexture(0.15, 0.15, 0.15, 0.9)

  local dropdownText = dropdownButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  dropdownText:SetPoint("LEFT", dropdownButton, "LEFT", 8, 0)
  dropdownText:SetText(currentSound)
  dropdownText:SetTextColor(1, 1, 1)

  local dropdownArrow = dropdownButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  dropdownArrow:SetPoint("RIGHT", dropdownButton, "RIGHT", -8, 0)
  dropdownArrow:SetText("▼")
  dropdownArrow:SetTextColor(0.8, 0.8, 0.8)

  -- Test button
  local testButton = CreateFrame("Button", nil, contentFrame)
  testButton:SetSize(60, 24)
  testButton:SetPoint("LEFT", dropdownButton, "RIGHT", 10, 0)

  local testBG = testButton:CreateTexture(nil, "BACKGROUND")
  testBG:SetAllPoints()
  testBG:SetColorTexture(0.2, 0.4, 0.2, 0.9)

  local testText = testButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  testText:SetPoint("CENTER")
  testText:SetText("Test")
  testText:SetTextColor(1, 1, 1)

  testButton:SetScript("OnClick", function()
    local soundFile = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Audio\\nt_InfussionOfLight.ogg"
    PlaySoundFile(soundFile, "Master")
  end)

  testButton:SetScript("OnEnter", function(self) testBG:SetColorTexture(0.3, 0.5, 0.3, 1) end)
  testButton:SetScript("OnLeave", function(self) testBG:SetColorTexture(0.2, 0.4, 0.2, 0.9) end)

  -- Add dropdown and test button to configurable elements
  tinsert(popupConfigurableElements, { element = dropdownButton, type = "button" })
  tinsert(popupConfigurableElements, { element = testButton, type = "button" })

  -- Sound selection functionality
  local sounds = { "NT_InfussionOfLight", "NT_Chest", "NT_Mount" }
  local currentIndex = 1
  for i, sound in ipairs(sounds) do
    if sound == currentSound then
      currentIndex = i
      break
    end
  end

  dropdownButton:SetScript("OnClick", function()
    currentIndex = currentIndex + 1
    if currentIndex > #sounds then
      currentIndex = 1
    end
    local newSound = sounds[currentIndex]
    dropdownText:SetText(newSound)
    SetDBValue("CollectionNotificationSound", newSound)
  end)

  dropdownButton:SetScript("OnEnter", function(self) dropdownBG:SetColorTexture(0.25, 0.25, 0.25, 1) end)
  dropdownButton:SetScript("OnLeave", function(self) dropdownBG:SetColorTexture(0.15, 0.15, 0.15, 0.9) end)

  -- Function to update popup elements state
  local function UpdatePopupElementsState(enabled)
    for _, elementData in ipairs(popupConfigurableElements) do
      local element = elementData.element
      local elementType = elementData.type

      if elementType == "fontstring" then
        if enabled then
          element:SetTextColor(0.9, 0.9, 0.9)
        else
          element:SetTextColor(0.4, 0.4, 0.4)
        end
      elseif elementType == "button" then
        if enabled then
          element:Enable()
          element:SetAlpha(1.0)
        else
          element:Disable()
          element:SetAlpha(0.5)
        end
      end
    end
  end

  -- Global enable checkbox functionality
  enableCheckbox:SetScript("OnClick", function(self)
    local enabled = self:GetChecked()
    SetDBValue("CollectionNotificationsEnabled", enabled)
    UpdatePopupElementsState(enabled)

    -- Also update the main config if it's open
    if RightPanel.configElements and RightPanel.configElements[1] and RightPanel.configElements[1]:IsShown() then
      CreateCollectionNotificationsConfig()
    end
  end)

  -- Apply initial state
  UpdatePopupElementsState(isGloballyEnabled)

  popup:Show()
end

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

-- Slash command to open config
SLASH_NTUICONFIG1 = "/ntconfig"
SlashCmdList["NTUICONFIG"] = function()
  ShowConfigMenu()
end

-- Additional slash commands for Collection Notifications
SLASH_NTCC1 = "/ntcc"
SlashCmdList["NTCC"] = function()
  ShowConfigMenu()
  -- Find and click the Collection Notifications button to open it directly
  for _, button in ipairs(categoryButtons) do
    if button.categoryID == 1 then -- Audio category (now category 1)
      if button.collapsed then
        button:Expand()
      end
      break
    end
  end
end

-- Test Collection Notification function
local function TestCollectionNotification()
  if addon.PlayNotificationSound then
    addon.PlayNotificationSound()
    print("NoobTacoUI-Media: Test notification played!")
  else
    print("NoobTacoUI-Media: Collection notification system not loaded.")
  end
end

SLASH_NTTESTCOLLECTION1 = "/nttestcollection"
SlashCmdList["NTTESTCOLLECTION"] = TestCollectionNotification
