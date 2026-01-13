-- NoobTacoUI New Config System
-- Utilizing NoobTaco-Config library

local addonName, addon = ...
_G.NoobTacoUIAddon = addon -- Maintain compatibility with other modules

-- Centralized bridge to NoobTaco-Config library is handled in version.lua
-- addon.ConfigLayout, addon.ConfigRenderer, addon.ConfigState, addon.ConfigTheme are already set.

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

local function IsMoP()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= 50000 and tocVersion < 60000
end

local function IsWoD()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= 60000 and tocVersion < 70000
end

local function IsLegion()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= 70000 and tocVersion < 80000
end

local function IsBfA()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= 80000 and tocVersion < 90000
end

local function IsShadowlands()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= 90000 and tocVersion < 100000
end

local function IsDragonflight()
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= 100000 and tocVersion < 110000
end

local function AreCollectionsAvailable()
  return IsMoP() or IsWoD() or IsLegion() or IsBfA() or IsShadowlands() or IsDragonflight() or IsRetail()
end

local function GetExpansionName()
  if IsClassicEra() then
    return "Classic Era"
  elseif IsCata() then
    return "Cataclysm"
  elseif IsMoP() then
    return "Mists of Pandaria"
  elseif IsWoD() then
    return "Warlords of Draenor"
  elseif IsLegion() then
    return "Legion"
  elseif IsBfA() then
    return "Battle for Azeroth"
  elseif IsShadowlands() then
    return "Shadowlands"
  elseif IsDragonflight() then
    return "Dragonflight"
  elseif IsRetail() then
    return "Retail"
  end
  return "Unknown"
end

local function IsSoD()
  local C_Seasons = _G.C_Seasons
  return C_Seasons and C_Seasons.HasActiveSeason() and (C_Seasons.GetActiveSeason() == Enum.SeasonID.SeasonOfDiscovery)
end

-- Helper to check if an addon is loaded
local function IsAddonLoaded(name)
  return C_AddOns and C_AddOns.IsAddOnLoaded(name)
end

-- Helper to check if a profile is supported by current client
local function IsProfileSupported(profile)
  if not profile then return false end
  if not profile.minTocVersion then return true end -- Supported by default if no version specified
  local _, _, _, tocVersion = GetWoWVersion()
  return tocVersion >= profile.minTocVersion
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
      showMinimapButton = true, -- For legacy compatibility
      hide = false,             -- Modern key for LibDBIcon
      enableAddonCompartment = true,
      minimapPos = 225,
      AppliedProfiles = {},
      ExcludedProfiles = {},
    }
  end

  -- Ensure AppliedProfiles exists for existing databases
  if not NoobTacoUIDB.GeneralSettings.AppliedProfiles then
    NoobTacoUIDB.GeneralSettings.AppliedProfiles = {}
  end

  -- Ensure ExcludedProfiles exists for existing databases
  if not NoobTacoUIDB.GeneralSettings.ExcludedProfiles then
    NoobTacoUIDB.GeneralSettings.ExcludedProfiles = {}
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
    icon = [[Interface\AddOns\NoobTacoUI\Media\Textures\logo.tga]],
    OnClick = function(self, button)
      if button == "LeftButton" then
        addon.ShowConfigMenu()
      end
    end,
    OnTooltipShow = function(tooltip)
      local theme = addon.ConfigTheme
      if theme and theme.ProcessText then
        tooltip:AddLine(theme:ProcessText("|chighlight|NoobTaco|r|cffF8F9FAUI|r"))
        tooltip:AddLine(theme:ProcessText("Left-click: Open configuration"), 0.7, 0.7, 0.7)
        tooltip:AddLine(theme:ProcessText("Drag to reposition"), 0.5, 0.5, 0.5)
      else
        tooltip:AddLine("|chighlight|NoobTacoUI|r")
        tooltip:AddLine("Left-click: Open configuration", 0.7, 0.7, 0.7)
        tooltip:AddLine("Drag to reposition", 0.5, 0.5, 0.5)
      end
    end,
  })

  -- Register icon
  if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings then
    LibDBIcon:Register("NoobTacoUI", minimapButtonLDB, NoobTacoUIDB.GeneralSettings)
  end
end

-------------------------------------------------------------------------------
-- Global functions for AddonCompartment integration
-------------------------------------------------------------------------------
function NoobTacoUI_OnAddonCompartmentClick(addonName, buttonName)
  -- Check if addon compartment is enabled in settings
  local enableCompartment = true -- Default to enabled
  if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings then
    local setting = NoobTacoUIDB.GeneralSettings.enableAddonCompartment
    if setting ~= nil then
      enableCompartment = setting
    end
  end

  if not enableCompartment then
    addon:Print(
      "|cffD78144NoobTaco|r|cffF8F9FAUI|r: |cerror|Addon drawer integration is disabled|r - Enable in General Settings")
    return
  end

  if buttonName == "LeftButton" then
    addon.ShowConfigMenu()
  end
end

function NoobTacoUI_OnAddonCompartmentEnter(addonName, menuButtonFrame)
  -- Check if addon compartment is enabled in settings
  local enableCompartment = true -- Default to enabled
  if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings then
    local setting = NoobTacoUIDB.GeneralSettings.enableAddonCompartment
    if setting ~= nil then
      enableCompartment = setting
    end
  end

  local theme = addon.ConfigTheme
  local function AddThemedLine(text, r, g, b)
    if theme and theme.ProcessText then
      GameTooltip:AddLine(theme:ProcessText(text), r, g, b)
    else
      GameTooltip:AddLine(text, r, g, b)
    end
  end

  GameTooltip:SetOwner(menuButtonFrame, "ANCHOR_LEFT")
  if theme and theme.ProcessText then
    GameTooltip:SetText(theme:ProcessText("|chighlight|NoobTaco|r|cffF8F9FAUI|r"), 1, 1, 1)
  else
    GameTooltip:SetText("|chighlight|NoobTaco|r|cffF8F9FAUI|r", 1, 1, 1)
  end

  AddThemedLine("Media addon with enhanced configuration", 0.7, 0.7, 0.7)
  AddThemedLine(" ", 1, 1, 1)

  if not enableCompartment then
    AddThemedLine("|cerror|Addon drawer integration is disabled|r", 1, 0.7, 0.7)
    AddThemedLine("Enable in General Settings to use", 0.7, 0.7, 0.7)
  else
    AddThemedLine("Left-click: Open configuration", 0.7, 0.7, 0.7)
  end

  GameTooltip:Show()
end

function NoobTacoUI_OnAddonCompartmentLeave(addonName, menuButtonFrame)
  GameTooltip:Hide()
end

-------------------------------------------------------------------------------
-- Schema Definitions
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Persistent Schemas
-------------------------------------------------------------------------------
addon.ConfigSchemas = {}

local function BuildSchemas()
  if addon.ConfigSchemas.General then return end -- Already built


  -- General Settings
  addon.ConfigSchemas.General = {
    type = "group",
    children = {
      { type = "header",      label = "General Settings" },
      { type = "description", text = "Configure how NoobTacoUI appears and behaves in your game." },
      { type = "header",      label = "Minimap & Interface" },
      {
        type = "checkbox",
        label = "Show Minimap Button",
        invertValue = true,
        id = "GeneralSettings.hide",
        default = false,
        onChange = function(val)
          if not val then
            LibDBIcon:Show("NoobTacoUI")
            addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Minimap button shown")
          else
            LibDBIcon:Hide("NoobTacoUI")
            addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Minimap button hidden")
          end
          if addon.ConfigState then addon.ConfigState:Commit() end
        end
      },
      {
        type = "slider",
        label = "Minimap Button Angle",
        id = "GeneralSettings.minimapPos",
        min = 0,
        max = 360,
        step = 1,
        default = 225,
        onChange = function(val)
          if LibDBIcon:IsRegistered("NoobTacoUI") then
            LibDBIcon:Refresh("NoobTacoUI", NoobTacoUIDB.GeneralSettings)
          end
        end
      },
      {
        type = "checkbox",
        label = "Enable Addon Compartment",
        id = "GeneralSettings.enableAddonCompartment",
        default = true,
        onChange = function(val)
          if val then
            addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Addon drawer integration |csuccess|Enabled|r")
          else
            addon:Print(
              "|chighlight|NoobTaco|r|cffF8F9FAUI|r: Addon drawer integration |cerror|Disabled|r - UI Reload required to fully hide entry.")
          end
          if addon.ConfigState then addon.ConfigState:Commit() end
        end
      },
      { type = "description", text = "|cheader|Minimap Button:|r Shows a small button on your minimap for quick access to configuration and notifications toggle. Changes take effect immediately." },
      { type = "description", text = "|cheader|Minimap Button Angle:|r Adjusts the angle of the minimap button. Changes take effect immediately." },
      { type = "description", text = "|cheader|Addon Drawer:|r Integrates with WoW's addon compartment (the new addon drawer button) for easy access from the micro menu. When disabled, the drawer entry will show but be non-functional until re-enabled." },
      { type = "alert",       severity = "info",                                                                                                                                                                                                             text = "WARNING: Changing Addon Compartment settings requires a UI reload." },
      {
        type = "button",
        label = "Reload UI",
        onClick = function() ReloadUI() end
      },
    }
  }


  -- Game Settings
  local width, height = GetPhysicalScreenSize()
  local resDisplay = width .. "x" .. height
  local function SetUIScale(scale, label)
    SetCVar("useUiScale", "1")
    SetCVar("uiScale", scale)
    addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: UI Scale set to |csuccess|" .. scale .. "|r (" .. label .. ")")

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

  addon.ConfigSchemas.Game = {
    type = "group",
    children = {
      { type = "header",      label = "Game Settings" },
      { type = "description", text = "Optimize your display settings for the best visual experience." },
      {
        type = "alert",
        text =
        "WARNING: CVars Modification. Changing these settings (UiScale) affects the entire game interface. Use with caution.",
        severity = "warning"
      },
      { type = "header", label = "Pixel Perfect Scaling" },
      {
        type = "description",
        text =
        "|cheader|What Is This?|r Pixel Perfect Scaling ensures your UI is rendered at the optimal scale for your monitor, eliminating blurriness and making text crisp.\n\n|cheader|Two Modes Available:|r\n• |csuccess|Standard (1:1)|r - Maximum screen space, smaller UI elements, perfectly sharp\n• |csuccess|High Visibility (2:1)|r - Doubled UI size for easier reading, still perfectly sharp\n\n|cheader|How To Choose:|r\n1. Check your detected resolution below\n2. Try the Standard mode first\n3. If text is too small, use High Visibility mode\n4. A UI reload is required after changing"
      },
      {
        type = "description",
        text = "Detected Resolution: |cinfo|" .. resDisplay .. "|r"
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
          local currentScale = tonumber(GetCVar("uiScale"))
          local scaleText = currentScale and string.format("%.9f", currentScale) or "N/A"
          local mode = ""

          if currentScale then
            local _, screenHeight = GetPhysicalScreenSize()
            local scales = {
              ["0.355555555"] = "4K Standard",
              ["0.533333333"] = "1440p Standard",
              ["1.066666666"] = "1440p High Vis",
              ["1.422222222"] = "1080p High Vis"
            }

            -- Handle shared scale for 4K High Vis / 1080p Standard
            if math.abs(currentScale - 0.711111111) < 0.000001 then
              if screenHeight > 2000 then
                mode = " (4K High Vis)"
              else
                mode = " (1080p Standard)"
              end
            else
              for s, name in pairs(scales) do
                if math.abs(currentScale - tonumber(s)) < 0.000001 then
                  mode = " (" .. name .. ")"
                  break
                end
              end
            end
          end

          addon:Print("|chighlight|NoobTaco|r|cffF8F9FAUI|r: Current UI Scale: |cinfo|" .. scaleText .. "|r" .. mode)
        end
      }
    }
  }

  -- About Schema
  addon.ConfigSchemas.About = {
    type = "group",
    children = {
      {
        type = "about",
        icon = [[Interface\AddOns\NoobTacoUI\Media\Textures\logo.tga]],
        title = "NoobTaco|cffF8F9FAUI|r",
        version = "Version " ..
            (C_AddOns and C_AddOns.GetAddOnMetadata and C_AddOns.GetAddOnMetadata(addonName, "Version") or "2.1.0"),
        description =
        "Shared media assets and enhanced UI components for the NoobTacoUI addon suite. Featuring modern NoobTaco-themed visual assets and robust configuration systems designed for the Midnight expansion and beyond.\n\nCreated by NoobTaco Development Team.",
        links = {
          {
            label = "Donate",
            url = "https://ko-fi.com/mikenorton",
            onClick = function()
              StaticPopupDialogs["NOOBTACOUI_GENERIC_COPY"] = {
                text = "CTRL+C to copy the link: https://ko-fi.com/mikenorton",
                button1 = "Close",
                hasEditBox = true,
                editBoxWidth = 400,
                OnShow = function(self)
                  self.EditBox:SetText("https://ko-fi.com/mikenorton")
                  self.EditBox:SetFocus()
                  self.EditBox:HighlightText()
                end,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
              }
              StaticPopup_Show("NOOBTACOUI_GENERIC_COPY")
            end
          },
          {
            label = "GitHub",
            url = "https://github.com/noobtaco/config",
            onClick = function()
              StaticPopupDialogs["NOOBTACOUI_GENERIC_COPY"] = {
                text = "CTRL+C to copy the link: https://github.com/noobtaco/config",
                button1 = "Close",
                hasEditBox = true,
                editBoxWidth = 400,
                OnShow = function(self)
                  self.EditBox:SetText("https://github.com/noobtaco/config")
                  self.EditBox:SetFocus()
                  self.EditBox:HighlightText()
                end,
                timeout = 0,
                whileDead = true,
                hideOnEscape = true,
                preferredIndex = 3,
              }
              StaticPopup_Show("NOOBTACOUI_GENERIC_COPY")
            end
          },
        }
      },
      { type = "header", label = "Getting Started" },
      {
        type = "description",
        text =
            "|cheader|New to NoobTacoUI? Start Here!|r\n\n" ..
            "|csuccess|Step 1:|r Visit 'Game Settings' to optimize your display\n" ..
            "|csuccess|Step 2:|r Click 'Addon Integration' in the sidebar\n" ..
            "|csuccess|Step 3:|r Follow the mandatory Edit Mode setup\n" ..
            "|csuccess|Step 4:|r Use the automated profile application to set up all addons\n" ..
            "|csuccess|Step 5:|r Customize 'General' settings to your preference\n\n" ..
            "|chighlight|Need Help?|r Each section has detailed explanations to guide you through the process."
      },
    }
  }

  -- Addon Integration (Profiles)
  -- Build schema dynamically to ensure addon load state is current
  addon.BuildAddonsSchema = function()
    local integrationChildren = {
      {
        type = "header",
        label = "Addon Integration"
      },
      {
        type = "description",
        text =
        "Welcome to NoobTacoUI! Follow these steps to set up your interface. Each step builds on the previous one for a complete UI experience."
      },
    }

    table.insert(integrationChildren, {
      type = "callout",
      title = "STEP 1: PIXEL PERFECT SCALING",
      text =
      "|cheader|Do This First:|r Before importing your layout, ensure your UI scale is optimized for your resolution. This ensures that all UI elements are positioned exactly as intended.\n\n|cheader|What To Do:|r\n1. Click 'GO TO GAME SETTINGS' below\n2. Choose the mode (Standard or High Vis) that fits your monitor\n3. Reload UI when prompted",
      buttonText = "GO TO GAME SETTINGS",
      severity = "info",
      onButtonClick = function()
        if MainLayout and MainLayout.sidebarButtons["gamesettings"] then
          MainLayout.sidebarButtons["gamesettings"]:Click()
        end
      end
    })

    if IsRetail() then
      local editModeProfile = addon.AddonProfiles and addon.AddonProfiles.EditMode
      if editModeProfile then
        table.insert(integrationChildren, {
          type = "callout",
          title = "STEP 2: MANDATORY EDIT MODE SETUP",
          text =
          "|cheader|Why This Matters:|r Edit Mode controls the position and layout of all default Blizzard UI elements (player frame, target frame, action bars, minimap, etc.). This is the foundation of NoobTacoUI.\n\n|cheader|What To Do:|r\n1. Click 'GET IMPORT STRING' below\n2. Copy the string (CTRL+C)\n3. Press ESC to open the game menu, then click 'Edit Mode'\n4. In Edit Mode, click the Layout dropdown menu at the top\n5. Select 'Import' and paste (CTRL+V) the string, then click Import",
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

    table.insert(integrationChildren, {
      type = "callout",
      title = "STEP 3: AUTOMATED SETUP",
      text =
      "|cheader|What This Does:|r Applies profiles for ALL supported addons you have installed. Each profile is pre-configured to work perfectly with NoobTacoUI.\n\n|cheader|Your Choice:|r You can:\n• Use this button to apply all profiles at once (recommended for new users)\n• Or scroll down and apply profiles individually (advanced users)\n\n|cwarning|Note:|r This will overwrite your existing addon settings for supported addons.",
      buttonText = "APPLY ALL PROFILES",
      severity = "success",
      onButtonClick = function()
        StaticPopupDialogs["NOOBTACOUI_BULK_APPLY"] = {
          text = "This will overwrite settings for ALL supported addons detected.\nAre you sure you want to continue?",
          button1 = "Yes",
          button2 = "No",
          OnAccept = function()
            if addon.AddonProfiles then
              local applyOrder = {
                "BetterBlizzFrames",
                "Platynator",
                "SenseiClassResourceBar",
                "zBarButtonBG",
                "XIV_Databar",
                "Details"
              }
              local count = 0
              local excludedProfiles = NoobTacoUIDB.GeneralSettings.ExcludedProfiles or {}
              for _, name in ipairs(applyOrder) do
                local profile = addon.AddonProfiles[name]
                local isExcluded = excludedProfiles[name]
                if profile and profile.applyFunction and IsProfileSupported(profile) and not isExcluded then
                  profile.applyFunction(true)
                  count = count + 1
                end
              end
              addon:Print("|cffD78144NoobTaco|r|cffF8F9FAUI|r: Bulk setup complete. " ..
                (count or 0) .. " profiles processed.")
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

    table.insert(integrationChildren, { type = "header", label = "Individual Addon Profiles" })
    table.insert(integrationChildren, {
      type = "description",
      text =
      "|cheader|Advanced Setup:|r Pick and choose which addon profiles to apply. This is useful if:\n• You only use certain addons\n• You want to update one specific addon profile\n• You prefer to configure addons yourself"
    })

    if addon.AddonProfiles then
      local appliedProfiles = NoobTacoUIDB.GeneralSettings.AppliedProfiles or {}

      -- Helper to generate a card for a given profile key (or nil if manual profile object)
      local function GenerateAddonCard(profileKey, manualProfile, sectionTag)
        local profile = manualProfile or addon.AddonProfiles[profileKey]
        if not profile then return end

        if not manualProfile and not IsProfileSupported(profile) then return end

        local status = "|cerror|NOT LOADED|r"
        local isLoaded = false
        local addonNameCheck = profile.name

        -- Special handling for complex addon names
        if profileKey == "XIV_Databar" then
          if C_AddOns.IsAddOnLoaded("XIV_Databar") or C_AddOns.IsAddOnLoaded("XIV_Databar_Continued") or C_AddOns.IsAddOnLoaded("XIV_Databar-Continued") or C_AddOns.IsAddOnLoaded("XIV_Databar_Continued_Mainline") or C_AddOns.IsAddOnLoaded("XIV_DataBar") then
            isLoaded = true
          end
        elseif profileKey == "NoobTaco-GotOne" then
          if C_AddOns.IsAddOnLoaded("NoobTaco-GotOne") or C_AddOns.IsAddOnLoaded("NoobTaco_GotOne") then
            isLoaded = true
          end
        else
          isLoaded = C_AddOns.IsAddOnLoaded(profile.name)
        end

        local displayTag = sectionTag or ""

        if isLoaded then
          if profileKey == "NoobTaco-GotOne" then
            status = "|csuccess|ACTIVE|r"
          else
            local currentVer = appliedProfiles[profileKey]
            if not currentVer then
              status = "|cwarning|NEW|r"
            elseif currentVer < profile.version then
              status = "|cwarning|UPDATE|r"
            else
              status = "|csuccess|UP TO DATE|r"
            end
          end
        end

        local profileChildren = {}
        table.insert(profileChildren, { type = "description", text = profile.description })

        -- Add Exclusion Checkbox (Skip for GotOne as it has no profile to apply)
        if profileKey ~= "NoobTaco-GotOne" then
          table.insert(profileChildren, {
            type = "checkbox",
            label = "Include in Bulk Setup",
            id = "GeneralSettings.ExcludedProfiles." .. profileKey,
            invertValue = true,
            default = false,
            onChange = function(val)
              if addon.ConfigState then addon.ConfigState:Commit() end
            end
          })
        end

        if profile.instructions then
          local instructText = ""
          for i, line in ipairs(profile.instructions) do
            instructText = instructText .. i .. ". " .. line .. "\n"
          end
          table.insert(profileChildren, { type = "description", text = instructText })
        end

        if isLoaded then
          if profileKey ~= "NoobTaco-GotOne" then
            table.insert(profileChildren, {
              type = "button",
              label = profile.isCustomApply and "APPLY PROFILE" or "COPY PROFILE STRING",
              width = 200,
              onClick = function()
                if profile.applyFunction then
                  profile.applyFunction()
                elseif profile.profileString then
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
                    timeout = 0,
                    whileDead = true,
                    hideOnEscape = true,
                  }
                  StaticPopup_Show("NOOBTACOUI_GENERIC_COPY")
                end
              end
            })
          end
        else
          if profile.downloadUrl and profile.downloadUrl ~= "N/A" then
            table.insert(profileChildren, {
              type = "description",
              text = "|cerror|Addon is not loaded.|r"
            })
            table.insert(profileChildren, {
              type = "button",
              label = "DOWNLOAD ADDON",
              width = 200,
              onClick = function()
                StaticPopupDialogs["NOOBTACOUI_DOWNLOAD_LINK"] = {
                  text = "CTRL+C to copy the download link for " .. profile.displayName,
                  button1 = "Close",
                  hasEditBox = true,
                  editBoxWidth = 400,
                  OnShow = function(self)
                    self.EditBox:SetText(profile.downloadUrl)
                    self.EditBox:SetFocus()
                    self.EditBox:HighlightText()
                  end,
                  timeout = 0,
                  whileDead = true,
                  hideOnEscape = true,
                  preferredIndex = 3,
                }
                StaticPopup_Show("NOOBTACOUI_DOWNLOAD_LINK")
              end
            })
          else
            table.insert(profileChildren, {
              type = "description",
              text = "|cerror|Addon is not loaded. Please enable it to apply the profile.|r"
            })
          end
        end

        table.insert(integrationChildren, {
          type = "card",
          label = profile.displayName .. "  " .. status .. displayTag,
          children = profileChildren
        })
      end

      -- 1. Core Required Addons
      table.insert(integrationChildren, { type = "header", label = "Core Required Addons" })
      local requiredAddons = {
        "BetterBlizzFrames",
        "Platynator",
        "SenseiClassResourceBar",
        "zBarButtonBG"
      }
      for _, key in ipairs(requiredAddons) do
        GenerateAddonCard(key, nil, "  |cerror|REQUIRED|r")
      end

      -- 2. Recommended & Optional Addons
      table.insert(integrationChildren, { type = "header", label = "Recommended & Optional Addons" })

      -- Manual Entry for NoobTaco-GotOne
      local gotOneProfile = {
        name = "NoobTaco-GotOne",
        displayName = "NoobTaco-GotOne",
        description =
        "Companion addon for high-performance audio notifications. Highly recommended for the full experience.",
        downloadUrl = "https://www.curseforge.com/wow/addons/noobtaco-gotone",
        version = "1.0" -- Placeholder
      }
      GenerateAddonCard("NoobTaco-GotOne", gotOneProfile, "  |csuccess|RECOMMENDED|r")

      local optionalAddons = {
        "XIV_Databar",
        "Details"
      }
      for _, key in ipairs(optionalAddons) do
        GenerateAddonCard(key, nil, "  |cinfo|OPTIONAL|r")
      end
    end

    addon.ConfigSchemas.Addons = {
      type = "group",
      children = integrationChildren
    }
    return addon.ConfigSchemas.Addons
  end

  -- Initialize with empty schema, will be rebuilt on render
  addon.ConfigSchemas.Addons = { type = "group", children = {} }
end

-------------------------------------------------------------------------------
-- Main UI Setup
-------------------------------------------------------------------------------

local function InitializeConfigUI()
  if MainLayout then return end

  -- Check if library is available
  if not addon.ConfigLayout or not addon.ConfigRenderer then
    addon:Print(
      "|cffD78144NoobTaco|r|cffF8F9FAUI|r: |cerror|Error:|r Configuration library (NoobTaco-Config) failed to load.")
    return
  end
  BuildSchemas()

  -- Create the main container frame
  MainLayout = addon.ConfigLayout:CreateTwoColumnLayout(UIParent)
  MainLayout:Hide()

  -- Expose the frame for compatibility
  addon.EnhancedConfigFrame = MainLayout

  -- Set Default Theme
  if addon.ConfigTheme then
    addon.ConfigTheme:SetTheme("NoobTaco")
  end

  -- Add Sidebar Items
  MainLayout.sidebarButtons = {}
  MainLayout.sidebarButtons["about"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "about", "About", function()
    addon.ConfigState:SetValue("lastSection", "about")
    addon.ConfigRenderer:Render(addon.ConfigSchemas.About, MainLayout)
  end)

  MainLayout.sidebarButtons["addons"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "addons", "Addon Integration",
    function()
      addon.ConfigState:SetValue("lastSection", "addons")
      local schema = addon.BuildAddonsSchema()
      addon.ConfigRenderer:Render(schema, MainLayout)
    end)

  MainLayout.sidebarButtons["gamesettings"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "gamesettings",
    "Game Settings", function()
      addon.ConfigState:SetValue("lastSection", "gamesettings")
      addon.ConfigRenderer:Render(addon.ConfigSchemas.Game, MainLayout)
    end)

  MainLayout.sidebarButtons["general"] = addon.ConfigLayout:AddSidebarButton(MainLayout, "general", "General", function()
    addon.ConfigState:SetValue("lastSection", "general")
    addon.ConfigRenderer:Render(addon.ConfigSchemas.General, MainLayout)
  end)

  -- Default to About page on first show
  MainLayout.lastSelected = MainLayout.sidebarButtons["about"]


  -- Ensure a section is rendered when the frame is shown (e.g. via Blizzard Options)
  MainLayout:SetScript("OnShow", function()
    local lastSection = addon.ConfigState:GetValue("lastSection") or "about"
    if MainLayout.sidebarButtons[lastSection] then
      -- Only click if it's not already the selected button to avoid redundant renders
      -- However, Renderer:Render usually handles its own state.
      -- To be safe and ensure the page is actually there:
      MainLayout.sidebarButtons[lastSection]:Click()
    else
      MainLayout.sidebarButtons["about"]:Click()
    end
  end)

  -- Register with Blizzard Settings Panel
  if Settings and Settings.RegisterCanvasLayoutCategory then
    local category, layout = Settings.RegisterCanvasLayoutCategory(MainLayout, "|cffD78144NoobTaco|r|cffF8F9FAUI|r")
    addon.SettingsCategory = category
    Settings.RegisterAddOnCategory(category)
  elseif InterfaceOptions_AddCategory then
    -- Fallback for older clients (Classic, etc)
    MainLayout.name = "|cffD78144NoobTaco|r|cffF8F9FAUI|r"
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
    -- Initial Render (Restore last section)
    local lastSection = addon.ConfigState:GetValue("lastSection") or "about"
    if MainLayout.sidebarButtons[lastSection] then
      MainLayout.sidebarButtons[lastSection]:Click()
    else
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
    InitializeMinimapButton()
    InitializeConfigUI()

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
