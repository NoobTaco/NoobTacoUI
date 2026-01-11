-- NoobTacoUI Version Command Module
-- Author: NoobTaco
-- Version: @project-version@

local addonName, addon = ...
_G.NoobTacoUIAddon = addon    -- Maintain compatibility with other modules
local addonVersion = "v1.4.3" -- Fallback version - should match latest git tag

-- Bridge to NoobTaco-Config library
local ConfigLib = LibStub("NoobTaco-Config-1.0", true)
if ConfigLib then
  addon.ConfigLayout = ConfigLib.Layout
  addon.ConfigRenderer = ConfigLib.Renderer
  addon.ConfigState = ConfigLib.State
  addon.ConfigTheme = ConfigLib.Theme
end

-- Centralized themed print function
function addon:Print(msg)
  if self.ConfigTheme and self.ConfigTheme.ProcessText then
    print(self.ConfigTheme:ProcessText(msg))
  else
    print(msg)
  end
end

-- Create a frame to handle the slash command
local versionFrame = CreateFrame("Frame")

-- Function to get the current addon version
local function GetCurrentVersion()
  local version

  -- Try modern API first, then fallback to legacy API
  if C_AddOns and C_AddOns.GetAddOnMetadata then
    version = C_AddOns.GetAddOnMetadata(addonName, "Version")
  elseif GetAddOnMetadata then
    version = GetAddOnMetadata(addonName, "Version")
  end

  -- Check if version is the placeholder token or invalid
  if not version or version == "@project-version@" or version == "" then
    -- During development, use the fallback version
    version = addonVersion
  end

  return version
end

-- Function to display version information
local function ShowVersion()
  local coloredTitle = "|chighlight|NoobTaco|r|cffF8F9FAUI|r"
  local currentVersion = GetCurrentVersion()
  local message = string.format("%s version: |csuccess|%s|r", coloredTitle, currentVersion)
  addon:Print(message)
end

-- Register the slash command
SLASH_NTVERSION1 = "/nt"
SLASH_NTVERSION2 = "/noobtaco"
SlashCmdList["NTVERSION"] = function(msg)
  local args = string.lower(msg or "")

  if args == "version" or args == "ver" or args == "v" then
    ShowVersion()
  elseif args == "config" or args == "cfg" or args == "options" then
    -- Show configuration menu (handled in ConfigNew.lua)
    if _G.NoobTacoUIAddon and _G.NoobTacoUIAddon.ShowConfigMenu then
      _G.NoobTacoUIAddon.ShowConfigMenu()
    else
      addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: |cerror|Configuration menu not available|r")
    end
  elseif args == "" then
    -- Show help when no arguments provided
    addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r commands:")
    addon:Print("  |cwarning|/nt version|r - Display addon version")
    addon:Print("  |cwarning|/nt ver|r - Display addon version (short)")
    addon:Print("  |cwarning|/nt v|r - Display addon version (shortest)")
    addon:Print("  |cwarning|/nt config|r - Open configuration menu")
    addon:Print("  |cwarning|/nt cfg|r - Open configuration menu (short)")
  else
    addon:Print("|cerror|Unknown command:|r " .. args)
    addon:Print("Type |cwarning|/nt|r for available commands")
  end
end

-- Optional: Show a message when the addon loads (can be disabled)
local function OnAddonLoaded(self, event, loadedAddonName)
  if loadedAddonName == addonName then
    -- Try to update version from metadata now that addon is loaded
    if GetAddOnMetadata then
      addonVersion = GetAddOnMetadata(addonName, "Version") or addonVersion
    end
    versionFrame:UnregisterEvent("ADDON_LOADED")
  end
end

-- Register event for when addon loads
versionFrame:RegisterEvent("ADDON_LOADED")
versionFrame:SetScript("OnEvent", OnAddonLoaded)
