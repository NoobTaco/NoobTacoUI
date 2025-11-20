-- NoobTacoUI-Media Version Command Module
-- Author: NoobTaco
-- Version: @project-version@

local addonName = "NoobTacoUI-Media"
local addonVersion = "v1.3.1-beta" -- Fallback version - should match latest git tag

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
  local coloredTitle = "|cFF16C3F2NoobTacoUI|r|cFFFFFFFFMedia|r"
  local currentVersion = GetCurrentVersion()
  local message = string.format("%s version: |cFF00FF00%s|r", coloredTitle, currentVersion)
  print(message)
end

-- Register the slash command
SLASH_NTMVERSION1 = "/ntm"
SLASH_NTMVERSION2 = "/ntmversion"
SlashCmdList["NTMVERSION"] = function(msg)
  local args = string.lower(msg or "")

  if args == "version" or args == "ver" or args == "v" then
    ShowVersion()
  elseif args == "config" or args == "cfg" or args == "options" then
    -- Show configuration menu (requires ConfigMenu.lua to be loaded)
    if _G.NoobTacoUIMediaAddon and _G.NoobTacoUIMediaAddon.ShowConfigMenu then
      _G.NoobTacoUIMediaAddon.ShowConfigMenu()
    else
      print("|cFF16C3F2NoobTacoUI|r|cFFFFFFFFMedia|r: Configuration menu not available")
    end
  elseif args == "" then
    -- Show help when no arguments provided
    print("|cFF16C3F2NoobTacoUI|r|cFFFFFFFFMedia|r commands:")
    print("  |cFFFFFF00/ntm version|r - Display addon version")
    print("  |cFFFFFF00/ntm ver|r - Display addon version (short)")
    print("  |cFFFFFF00/ntm v|r - Display addon version (shortest)")
    print("  |cFFFFFF00/ntm config|r - Open configuration menu")
    print("  |cFFFFFF00/ntm cfg|r - Open configuration menu (short)")
    print("  |cFFFFFF00/ntmcollection|r - Collection notification commands")
  else
    print("|cFFFF0000Unknown command:|r " .. args)
    print("Type |cFFFFFF00/ntm|r for available commands")
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
