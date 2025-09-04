-- NoobTacoUI-Media Version Command Module
-- Author: NoobTaco
-- Version: 1.0.9

local addonName = "NoobTacoUI-Media"
local addonVersion = "1.0.9" -- Fallback version
local isAddonLoaded = false

-- Create a frame to handle the slash command
local versionFrame = CreateFrame("Frame")

-- Function to display version information
local function ShowVersion()
  local coloredTitle = "|cFF16C3F2NoobTacoUI|r|cFFFFFFFFMedia|r"

  -- Try to get version from metadata if addon is loaded
  local currentVersion = addonVersion
  if isAddonLoaded and GetAddOnMetadata then
    currentVersion = GetAddOnMetadata(addonName, "Version") or addonVersion
  end

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
  elseif args == "" then
    -- Show help when no arguments provided
    print("|cFF16C3F2NoobTacoUI|r|cFFFFFFFFMedia|r commands:")
    print("  |cFFFFFF00/ntm version|r - Display addon version")
    print("  |cFFFFFF00/ntm ver|r - Display addon version (short)")
    print("  |cFFFFFF00/ntm v|r - Display addon version (shortest)")
  else
    print("|cFFFF0000Unknown command:|r " .. args)
    print("Type |cFFFFFF00/ntm|r for available commands")
  end
end

-- Optional: Show a message when the addon loads (can be disabled)
local function OnAddonLoaded(self, event, loadedAddonName)
  if loadedAddonName == addonName then
    isAddonLoaded = true
    -- Try to update version from metadata now that addon is loaded
    if GetAddOnMetadata then
      addonVersion = GetAddOnMetadata(addonName, "Version") or addonVersion
    end
    -- Uncomment the line below if you want a load message
    -- print(string.format("|cFF16C3F2NoobTacoUI|r|cFFFFFFFFMedia|r %s loaded. Type |cFFFFFF00/ntm version|r to see version info.", addonVersion))
    versionFrame:UnregisterEvent("ADDON_LOADED")
  end
end

-- Register event for when addon loads
versionFrame:RegisterEvent("ADDON_LOADED")
versionFrame:SetScript("OnEvent", OnAddonLoaded)
