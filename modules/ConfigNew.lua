-- NoobTacoUI New Config System
-- Utilizing NoobTaco-Config library

local addonName, addon = ...
_G.NoobTacoUIAddon = addon -- Maintain compatibility with other modules

-- Initial configuration
local MainLayout = nil

-------------------------------------------------------------------------------
-- Database Initialization (Copied/Simplified from legacy ConfigMenu.lua)
-------------------------------------------------------------------------------
local function InitializeDatabase()
  -- Initialize global database structure
  NoobTacoUIDB = NoobTacoUIDB or {}

  -- Initialize General Settings if needed
  if not NoobTacoUIDB.GeneralSettings then
    NoobTacoUIDB.GeneralSettings = {
      showMinimapButton = true,
      enableAddonCompartment = true,
      minimapButtonAngle = 225,
      AppliedProfiles = {},
    }
  end

  -- Ensure AppliedProfiles exists for existing databases
  if not NoobTacoUIDB.GeneralSettings.AppliedProfiles then
    NoobTacoUIDB.GeneralSettings.AppliedProfiles = {}
  end

  -- Initialize the Config Library State with our DB
  if addon.ConfigState and addon.ConfigState.Initialize then
    addon.ConfigState:Initialize(NoobTacoUIDB)
  end
end

-------------------------------------------------------------------------------
-- Schema Definitions
-------------------------------------------------------------------------------

local function GetAboutSchema()
  return {
    type = "group",
    children = {
      {
        type = "about",
        title = "About NoobTacoUI",
        icon = addon.UIAssets and addon.UIAssets.Logo or "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\logo.tga",
        version = "Version " ..
            (C_AddOns and C_AddOns.GetAddOnMetadata and C_AddOns.GetAddOnMetadata(addonName, "Version") or "1.4.3"),
        description =
        "Shared media assets and enhanced UI components for the NoobTacoUI addon suite. Featuring modern Nord-themed visual assets and robust configuration systems designed for the Midnight expansion and beyond.",
        links = {
          { label = "GitHub",     url = "https://github.com/NoobTaco/NoobTacoUI" },
          { label = "CurseForge", url = "https://www.curseforge.com/wow/addons/noobtacoui" },
        }
      }
    }
  }
end

-------------------------------------------------------------------------------
-- Main UI Setup
-------------------------------------------------------------------------------

local function InitializeConfigUI()
  if MainLayout then return end

  -- Check if library is available
  if not addon.ConfigLayout or not addon.ConfigRenderer then
    print("|cFF16C3F2NoobTacoUI|r: |cFFFF0000Error:|r Configuration library (NoobTaco-Config) failed to load.")
    return
  end

  -- Create the main container frame
  -- The library handles the frame creation and styling
  MainLayout = addon.ConfigLayout:CreateTwoColumnLayout(UIParent)
  MainLayout:Hide()

  -- Expose the frame for compatibility
  addon.EnhancedConfigFrame = MainLayout

  -- Set Default Theme
  if addon.ConfigTheme then
    addon.ConfigTheme:SetTheme("Nord")
  end

  -- Add Sidebar Item: About
  MainLayout.sidebarButtons = {}
  MainLayout.sidebarButtons["about"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "about", "About", function()
    addon.ConfigRenderer:Render(GetAboutSchema(), MainLayout)
  end)

  -- Default to About page on first show
  -- This is handled in ShowConfigMenu

  -- Register with Blizzard Settings Panel
  if Settings and Settings.RegisterCanvasLayoutCategory then
    local category, layout = Settings.RegisterCanvasLayoutCategory(MainLayout, "NoobTacoUI")
    addon.SettingsCategory = category
    Settings.RegisterAddOnCategory(category)
  else
    -- Fallback for older clients (Classic, etc)
    MainLayout.name = "NoobTacoUI"
    InterfaceOptions_AddCategory(MainLayout)
  end
end

function addon.ShowConfigMenu()
  InitializeConfigUI()
  if MainLayout then
    -- Open valid settings panel
    if Settings and Settings.OpenToCategory then
      -- Modern API
      Settings.OpenToCategory(addon.SettingsCategory:GetID())
    else
      -- Legacy API or fallback (though we are targeting Midnight so Settings should exist)
      InterfaceOptionsFrame_OpenToCategory(MainLayout)
    end

    -- Select About by default if nothing rendered or first time
    if MainLayout.sidebarButtons and MainLayout.sidebarButtons["about"] then
      MainLayout.sidebarButtons["about"]:Click()
    end
  end
end

-- Compatibility
addon.ShowEnhancedConfig = addon.ShowConfigMenu

-------------------------------------------------------------------------------
-- Initialization logic
-------------------------------------------------------------------------------

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, loadedAddonName)
  if loadedAddonName == addonName then
    InitializeDatabase()

    -- Set up minimap button visibility etc (to be migrated later)
    -- For now we just ensure DB is ready

    self:UnregisterEvent("ADDON_LOADED")
  end
end)

-------------------------------------------------------------------------------
-- Slash Commands
-------------------------------------------------------------------------------
SLASH_NTUICONFIG1 = "/ntconfig"
SLASH_NTUICONFIG2 = "/ntuiconfig"
SLASH_NTUICONFIG3 = "/ntmedia"
SLASH_NTUICONFIG4 = "/ntuimedia"
SlashCmdList["NTUICONFIG"] = function()
  addon.ShowConfigMenu()
end

-- Collection Notifications shortcut (Placeholder until migrated)
SLASH_NTCC1 = "/ntcc"
SlashCmdList["NTCC"] = function()
  print("|cFF16C3F2NoobTacoUI|r: Collection Notifications settings migration in progress...")
  addon.ShowConfigMenu()
end
