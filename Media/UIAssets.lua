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

local function IsMidnight()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion and tocVersion >= 120000
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

  -- Background textures using your NoobTaco theme
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

  -- Colors extracted from NoobTaco theme
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
    Addons = "Interface\\Icons\\INV_Misc_EngGizmos_27",               -- Gizmo for addon integration
    General = "Interface\\Icons\\INV_Misc_Gear_01",                   -- Gear for general settings
    Game = "Interface\\Icons\\INV_Misc_Spyglass_02",                  -- Spyglass for game/view settings
    Close = "Interface\\Buttons\\UI-Panel-MinimizeButton-Up",         -- Close/X button
    -- Alternative options:
    SettingsAlt = "Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up", -- Gear wheel
    AboutAlt = "Interface\\Icons\\INV_Scroll_08",                     -- Scroll
    CloseAlt = "Interface\\Buttons\\UI-Panel-HideButton-Up",          -- Alternative close button
  }
}

-- Utility functions for creating consistent UI elements
addon.UIUtils = {}

-- Font system for consistent Poppins typography with NoobTaco-appropriate weights
local function GetUIFont(fontType, size)
  local LSM = LibStub("LibSharedMedia-3.0")
  local fontWeight
  size = size or 12

  -- NoobTaco typography hierarchy with appropriate Poppins weights
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
  checkbox:SetSize(size or 22, size or 22)

  -- Override the template's textures with Nord colors if needed
  -- This would require custom textures, but we can enhance the existing ones

  return checkbox
end

  -- Enable mouse interaction by default
  button:EnableMouse(true)

  return button
end

  -- Enable mouse interaction by default
  button:EnableMouse(true)

  return button
end
