-- NoobTacoUI-Media UI Assets Registry
-- Inspired by Plumber's asset management

local addonName, addon = ...

-- Asset paths for easy management
addon.UIAssets = {
  -- Background textures using your Nord theme
  Background = {
    Main = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Textures\\NT_nord0",
    Panel = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Textures\\NT_nord1",
    Dark = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Textures\\NT_nord3",
    Accent = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Textures\\NT_nord8",
  },

  -- Gradient textures for depth
  Gradients = {
    MainGrad = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Textures\\NT_nord0_grd",
    PanelGrad = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Textures\\NT_nord1_grd",
    DarkGrad = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Textures\\NT_nord3_grd",
    AccentGrad = "Interface\\AddOns\\NoobTacoUI-Media\\Media\\Textures\\NT_nord8_grd",
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
  }
}

-- Utility functions for creating consistent UI elements
addon.UIUtils = {}

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
  button.Text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
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
  button.Icon = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
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

-- Create a category header with Nord styling
function addon.UIUtils:CreateCategoryHeader(parent, text)
  local header = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
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
