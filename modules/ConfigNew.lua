-- NoobTacoUI New Config System
-- Utilizing NoobTaco-Config library

local addonName, addon = ...
_G.NoobTacoUIAddon = addon -- Maintain compatibility with other modules

local LDB = LibStub("LibDataBroker-1.1")
local LibDBIcon = LibStub("LibDBIcon-1.0")
local L = addon.L or function(s) return s end -- Localization placeholder

-------------------------------------------------------------------------------
-- Helpers & Version Detection
-------------------------------------------------------------------------------
local function GetWoWVersion()
  local version, build, date, tocVersion = GetBuildInfo()
  return version, build, date, tocVersion
end

local function IsRetail()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= 100000
end

local function IsClassicEra()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion < 20000
end

local function IsCata()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= 40000 and tocVersion < 50000
end

local function IsSoD()
  local C_Seasons = _G.C_Seasons
  return C_Seasons and C_Seasons.HasActiveSeason() and (C_Seasons.GetActiveSeason() == Enum.SeasonID.SeasonOfDiscovery)
end

-- Helper to check if an addon is loaded
local function IsAddonLoaded(name)
  return C_AddOns and C_AddOns.IsAddOnLoaded(name)
end

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

-------------------------------------------------------------------------------
-- Minimap Button Logic
-------------------------------------------------------------------------------
local function InitializeMinimapButton()
  local minimapButtonLDB = LDB:NewDataObject("NoobTacoUI", {
    type = "launcher",
    text = "NoobTacoUI",
    icon = addon.UIAssets and addon.UIAssets.Logo or "Interface\\AddOns\\NoobTacoUI\\Media\\Textures\\logo.tga",
    OnClick = function(self, button)
      if button == "LeftButton" then
        addon.ShowConfigMenu()
      elseif button == "RightButton" then
        -- Toggle Collection Notifications shortcut
        local current = NoobTacoUIDB.CollectionNotifications and NoobTacoUIDB.CollectionNotifications.enabled
        if current ~= nil then
          addon.CollectionNotifications.SetSetting("enabled", not current)
          local status = (not current) and "|cFFA3BE8CEnabled|r" or "|cFFBF616ADisabled|r"
          print("|cFF16C3F2NoobTacoUI|r: Collection Notifications " .. status)
        end
      end
    end,
    OnTooltipShow = function(tooltip)
      tooltip:AddLine("|cFF16C3F2NoobTacoUI|r")
      tooltip:AddLine("Left-click: Open configuration", 0.7, 0.7, 0.7)
      tooltip:AddLine("Right-click: Toggle Collection Notifications", 0.7, 0.7, 0.7)
      tooltip:AddLine("Drag to reposition", 0.5, 0.5, 0.5)
    end,
  })

  -- Register icon
  if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings then
    LibDBIcon:Register("NoobTacoUI", minimapButtonLDB, NoobTacoUIDB.GeneralSettings)
  end
end

-------------------------------------------------------------------------------
-- Schema Definitions
-------------------------------------------------------------------------------

local function GetGeneralSettingsSchema()
  return {
    type = "group",
    children = {
      { type = "header", label = "General Settings" },
      {
        type = "checkbox",
        label = "Show Minimap Button",
        id = "GeneralSettings.hide", -- LibDBIcon uses 'hide' to control visibility (inverted logic)
        default = false,
        onChange = function(val)
          if val then
            LibDBIcon:Hide("NoobTacoUI")
          else
            LibDBIcon:Show("NoobTacoUI")
          end
        end
      },
      {
        type = "checkbox",
        label = "Enable Addon Compartment",
        id = "GeneralSettings.enableAddonCompartment",
        default = true,
      },
      {
        type = "description",
        text = "|cFFFF0000Note:|r Changing Addon Compartment settings requires a UI reload."
      },
      {
        type = "button",
        label = "Reload UI",
        onClick = function() ReloadUI() end
      }
    }
  }
end

local function GetAudioSettingsSchema()
  -- Helper options for known sounds
  local soundOptions = {
    { label = "Game: Pet Collected",      value = "NT_Pet" },
    { label = "Game: Mount Collected",    value = "NT_Mount_Collection" },
    { label = "Game: Toy Collected",      value = "NT_Toy_Collection" },
    { label = "Game: Transmog Collected", value = "NT_Transmog" },
    { label = "Game: Quest Complete",     value = "NT_Quest_Complete" },
    { label = "Interface: Achievement",   value = 569143 }, -- SoundID
  }

  return {
    type = "group",
    children = {
      { type = "header", label = "Collection Notifications" },
      {
        type = "description",
        text = "Receive audio notifications when you collect new items."
      },
      {
        type = "checkbox",
        label = "Enable Notifications",
        id = "CollectionNotifications.enabled",
        default = true,
        onChange = function(val)
          if addon.CollectionNotifications then
            addon.CollectionNotifications.SetSetting("enabled", val)
          end
        end
      },
      { type = "header", label = "Sound Selection" },
      {
        type = "media",
        label = "Pet Sound",
        id = "CollectionNotifications.soundPet",
        options = soundOptions,
        default = "NT_Pet"
      },
      {
        type = "media",
        label = "Mount Sound",
        id = "CollectionNotifications.soundMount",
        options = soundOptions,
        default = "NT_Mount_Collection"
      },
      {
        type = "media",
        label = "Toy Sound",
        id = "CollectionNotifications.soundToy",
        options = soundOptions,
        default = "NT_Toy_Collection"
      },
      {
        type = "media",
        label = "Transmog Sound",
        id = "CollectionNotifications.soundTransmog",
        options = soundOptions,
        default = "NT_Transmog"
      },
      { type = "header", label = "Test Sounds" },
      {
        type = "row",
        children = {
          {
            type = "button",
            label = "Test All",
            width = 100,
            onClick = function()
              if addon.CollectionNotifications then addon.CollectionNotifications.PlayNotificationSound("soundPet", true) end
            end
          }
        }
      }
    }
  }
end

local function GetGameSettingsSchema()
  -- Helper to set scale and prompt reload
  local function SetUIScale(scale, label)
    SetCVar("useUiScale", "1")
    SetCVar("uiScale", scale)
    print("|cFF16C3F2NoobTacoUI|r: UI Scale set to |cFFA3BE8C" .. scale .. "|r (" .. label .. ")")

    StaticPopupDialogs["NOOBTACOUI_RELOAD_UI"] = {
      text = "UI Scale changed to " ..
          label .. ".\nA reload is required for settings to take full effect.\nReload now?",
      button1 = "Yes",
      button2 = "No",
      OnAccept = function()
        ReloadUI()
      end,
      timeout = 0,
      whileDead = true,
      hideOnEscape = true,
      preferredIndex = 3,
    }
    StaticPopup_Show("NOOBTACOUI_RELOAD_UI")
  end

  local width, height = GetPhysicalScreenSize()
  local resDisplay = width .. "x" .. height

  return {
    type = "group",
    children = {
      { type = "header", label = "Game Settings" },
      {
        type = "callout",
        title = "WARNING: CVars Modification",
        text = "Changing these settings (UiScale) affects the entire game interface. Use with caution.",
        buttonText = "I Understand",
        severity = "high",             -- Red/Error style
        onButtonClick = function() end -- No action needed, just advisory
      },
      {
        type = "description",
        text = "Detected Resolution: |cFF88C0D0" .. resDisplay .. "|r"
      },
      { type = "header", label = "Pixel Perfect Scaling" },
      {
        type = "description",
        text =
        "Set your UI scale to match your resolution for maximum sharpness. High Visibility modes (2:1 logic) keep things crisp while being much easier to read."
      },
      {
        type = "row",
        children = {
          {
            type = "button",
            label = "4K Standard (0.35)",
            width = 160,
            onClick = function() SetUIScale(0.355555555, "4K Standard") end
          },
          {
            type = "button",
            label = "4K High Vis (0.71)",
            width = 160,
            onClick = function() SetUIScale(0.711111111, "4K High Vis") end
          }
        }
      },
      {
        type = "row",
        children = {
          {
            type = "button",
            label = "1440p Standard (0.53)",
            width = 160,
            onClick = function() SetUIScale(0.533333333, "1440p Standard") end
          },
          {
            type = "button",
            label = "1440p High Vis (1.06)",
            width = 160,
            onClick = function() SetUIScale(1.066666666, "1440p High Vis") end
          }
        }
      },
      {
        type = "row",
        children = {
          {
            type = "button",
            label = "1080p Standard (0.71)",
            width = 160,
            onClick = function() SetUIScale(0.711111111, "1080p Standard") end
          },
          {
            type = "button",
            label = "1080p High Vis (1.42)",
            width = 160,
            onClick = function() SetUIScale(1.422222222, "1080p High Vis") end
          }
        }
      },
      { type = "header", label = "Current Status" },
      {
        type = "button",
        label = "Print Current Scale",
        onClick = function()
          local current = GetCVar("uiScale")
          print("|cFF16C3F2NoobTacoUI|r: Current UI Scale: " .. (current or "N/A"))
        end
      }
    }
  }
end

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

local function GetAddonIntegrationSchema()
  local children = {}

  -- 1. Description
  table.insert(children, {
    type = "description",
    text =
    "Import optimized profiles for supported addons to match the NoobTacoUI aesthetic. For the best experience, please ensure all recommended addons are installed."
  })

  -- 2. Mandatory Edit Mode (Retail only)
  if IsRetail() then
    local editModeProfile = addon.AddonProfiles and addon.AddonProfiles.EditMode
    if editModeProfile then
      table.insert(children, {
        type = "callout",
        title = "STEP 1: MANDATORY EDIT MODE SETUP",
        text =
        "You MUST import the Edit Mode layout for the UI to function correctly. This controls the position of all standard Blizzard frames.",
        buttonText = "GET IMPORT STRING",
        severity = "warning",
        onButtonClick = function()
          if editModeProfile.applyFunction then
            editModeProfile.applyFunction()
          end
        end
      })
    end
  end

  -- 3. Automated Setup
  table.insert(children, { type = "header", label = "STEP 2: AUTOMATED SETUP" })
  table.insert(children, {
    type = "callout",
    title = "Apply All Profiles",
    text =
    "Automatically apply profiles for all detected and supported addons. This will overwrite existing settings for these addons.",
    buttonText = "APPLY ALL PROFILES",
    severity = "info",
    onButtonClick = function()
      StaticPopupDialogs["NOOBTACOUI_BULK_APPLY"] = {
        text = "This will overwrite settings for ALL supported addons detected.\nAre you sure you want to continue?",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function()
          -- Bulk Apply Logic
          if addon.AddonProfiles then
            -- Order matters!
            local applyOrder = {
              "BetterBlizzFrames",
              "Platynator",
              "SenseiClassResourceBar",
              "XIV_Databar",
              "Details",
              "zBarButtonBG",
              "CooldownManagerTweaks"
            }

            local count = 0
            for _, name in ipairs(applyOrder) do
              local profile = addon.AddonProfiles[name]
              if profile and profile.applyFunction then
                profile.applyFunction(true) -- true = isBulk (suppress individual popups)
                count = count + 1
              end
            end

            print("|cFF16C3F2NoobTacoUI|r: Bulk setup complete. " .. count .. " profiles processed.")
            ReloadUI()
          end
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
      }
      StaticPopup_Show("NOOBTACOUI_BULK_APPLY")
    end
  })

  -- 4. Individual Addon Profiles
  table.insert(children, { type = "header", label = "INDIVIDUAL ADDON PROFILES" })
  table.insert(children, {
    type = "description",
    text = "TIP: You can also update individual addon profiles below if you don't want to reset everything."
  })

  if addon.AddonProfiles then
    -- Define display order
    local displayOrder = {
      "BetterBlizzFrames",
      "Platynator",
      "XIV_Databar",
      "SenseiClassResourceBar",
      "Details",
      "CooldownManagerTweaks",
      "zBarButtonBG"
    }

    local appliedProfiles = NoobTacoUIDB.GeneralSettings.AppliedProfiles or {}

    for _, profileKey in ipairs(displayOrder) do
      local profile = addon.AddonProfiles[profileKey]
      if profile then
        -- status logic
        local status = "|cFFBF616ANOT LOADED|r"
        local isLoaded = C_AddOns.IsAddOnLoaded(profile.name)

        -- Special check for XIV_Databar which has multiple folder names
        if profileKey == "XIV_Databar" then
          if C_AddOns.IsAddOnLoaded("XIV_Databar") or C_AddOns.IsAddOnLoaded("XIV_Databar_Continued") or C_AddOns.IsAddOnLoaded("XIV_Databar-Continued") then
            isLoaded = true
          end
        end

        if isLoaded then
          local currentVer = appliedProfiles[profileKey]
          if not currentVer then
            status = "|cFFD08770NEW|r"
          elseif currentVer < profile.version then
            status = "|cFFebcb8bUPDATE|r"
          else
            status = "|cFFA3BE8CINSTALLED|r"
          end
        end

        local label = profile.displayName .. "  " .. status

        local profileChildren = {}

        -- Description
        table.insert(profileChildren, {
          type = "description",
          text = profile.description
        })

        -- Instructions
        if profile.instructions then
          local instructText = "Instructions:\n"
          for i, line in ipairs(profile.instructions) do
            instructText = instructText .. i .. ". " .. line .. "\n"
          end
          table.insert(profileChildren, {
            type = "description",
            text = instructText
          })
        end

        -- Action Buttons
        if isLoaded then
          table.insert(profileChildren, {
            type = "button",
            label = profile.isCustomApply and "APPLY PROFILE" or "COPY PROFILE STRING",
            width = 200,
            onClick = function()
              if profile.applyFunction then
                profile.applyFunction()
              elseif profile.profileString then
                -- Generic Copy Dialog
                StaticPopupDialogs["NOOBTACOUI_GENERIC_COPY"] = {
                  text = "CTRL+C to copy the profile string for " .. profile.displayName,
                  button1 = "Close",
                  hasEditBox = true,
                  editBoxWidth = 400,
                  OnShow = function(self)
                    self.EditBox:SetText(profile.profileString)
                    self.EditBox:SetFocus()
                    self.EditBox:HighlightText()
                  end,
                  EditBoxOnEnterPressed = function(self) self:GetParent():Hide() end,
                  EditBoxOnEscapePressed = function(self) self:GetParent():Hide() end,
                  timeout = 0,
                  whileDead = true,
                  hideOnEscape = true,
                }
                StaticPopup_Show("NOOBTACOUI_GENERIC_COPY")
              end
            end
          })
        else
          table.insert(profileChildren, {
            type = "description",
            text = "|cFFBF616AAddon is not loaded. Please enable it to apply the profile.|r"
          })
        end

        -- Download Link Button (if url exists)
        if profile.downloadUrl then
          table.insert(profileChildren, {
            type = "row",
            children = {
              {
                type = "button",
                label = "Get Addon",
                width = 100,
                onClick = function()
                  -- Can't open browser, but can show url
                  local text = "Download at:\n" .. profile.downloadUrl
                  StaticPopupDialogs["NOOBTACOUI_SHOW_URL"] = {
                    text = text,
                    button1 = "Close",
                    hasEditBox = true,
                    OnShow = function(self)
                      self.EditBox:SetText(profile.downloadUrl)
                      self.EditBox:HighlightText()
                    end,
                    timeout = 0,
                    whileDead = true,
                    hideOnEscape = true,
                  }
                  StaticPopup_Show("NOOBTACOUI_SHOW_URL")
                end
              }
            }
          })
        end


        table.insert(children, {
          type = "expandable",
          label = label,
          expanded = false,
          children = profileChildren
        })
      end
    end
  end

  return {
    type = "group",
    children = children
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

  -- Add Sidebar Items
  MainLayout.sidebarButtons = {}
  MainLayout.sidebarButtons["general"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "general", "General", function()
    addon.ConfigRenderer:Render(GetGeneralSettingsSchema(), MainLayout)
  end)

  MainLayout.sidebarButtons["audio"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "audio", "Audio", function()
    addon.ConfigRenderer:Render(GetAudioSettingsSchema(), MainLayout)
  end)

  MainLayout.sidebarButtons["about"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "about", "About", function()
    addon.ConfigRenderer:Render(GetAboutSchema(), MainLayout)
  end)

  MainLayout.sidebarButtons["addons"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "addons", "Addon Integration",
    function()
      addon.ConfigRenderer:Render(GetAddonIntegrationSchema(), MainLayout)
    end)

  MainLayout.sidebarButtons["gamesettings"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "gamesettings",
    "Game Settings", function()
      addon.ConfigRenderer:Render(GetGameSettingsSchema(), MainLayout)
    end)

  -- Default to General page on first show
  MainLayout.lastSelected = MainLayout.sidebarButtons["general"]


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
    -- Select General by default, or About if preferred
    if MainLayout.sidebarButtons then
      if MainLayout.sidebarButtons["general"] then
        MainLayout.sidebarButtons["general"]:Click()
      elseif MainLayout.sidebarButtons["about"] then
        MainLayout.sidebarButtons["about"]:Click()
      end
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

    InitializeMinimapButton()

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
