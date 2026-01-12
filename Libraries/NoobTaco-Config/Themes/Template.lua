local Lib = LibStub("NoobTaco-Config-1.0")

--[[
  NoobTaco-Config Theme Template

  Copy this file to create your own custom theme.
  Usage:
  1. Define your theme table following the structure below.
  2. Call Lib.Theme:RegisterTheme("YourThemeName", YourThemeTable)
  3. Set the theme using Lib.Theme:SetTheme("YourThemeName")
]]

local MyCustomTheme = {
  -- Background color for the main frame (r, g, b, alpha)
  background = { 0.1, 0.1, 0.1, 0.9 },

  -- Header text color
  header = { 1, 0.82, 0, 1 },

  -- Border color for frames and inputs
  border = { 0.4, 0.4, 0.4, 1 },

  -- Standard text color
  text = { 1, 1, 1, 1 },

  -- Highlight color (used for focus, selection, etc.)
  highlight = { 1, 0.82, 0, 1 },

  -- Button styling
  button = {
    normal   = { 0.2, 0.2, 0.2, 1 }, -- Default button background
    hover    = { 0.3, 0.3, 0.3, 1 }, -- Mouseover background
    selected = { 0.2, 0.6, 1, 1 },   -- Selected/Active background
    text     = { 1, 1, 1, 1 },       -- Button text color
  },

  -- Alert box colors based on severity
  alert = {
    warning = { 1, 0.6, 0, 1 },   -- Orange
    error   = { 1, 0.2, 0.2, 1 }, -- Red
    success = { 0.2, 1, 0.2, 1 }, -- Green
    info    = { 0.2, 0.6, 1, 1 }, -- Blue
  }
}

-- Register the theme if Config Lib is loaded
if Lib and Lib.Theme then
  Lib.Theme:RegisterTheme("MyCustomTheme", MyCustomTheme)
end
