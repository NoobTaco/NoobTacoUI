-- NoobTacoUI-Media Collection Notifications Module
-- Provides audio notifications for various collection-related events in World of Warcraft
-- Author: NoobTaco
-- Version: @project-version@

local addonName, addon = ...
local LSM = LibStub("LibSharedMedia-3.0")

-- Default settings for collection notifications
local defaultSettings = {
  enabled = true,
  newPet = true,
  newMount = true,
  newToy = true,
  newTransmog = true,
  showMessages = true,
  soundPet = "NT_InfussionOfLight",
  soundMount = "NT_Mount",
  soundToy = "NT_Chest",
  soundTransmog = "NT_Chest",
}

-- Initialize settings if they don't exist
local function InitializeSettings()
  if not NoobTacoUIMediaDB then
    NoobTacoUIMediaDB = {}
  end

  -- One-time migration from legacy NoobTacoDB if present
    local legacy = rawget(_G, "NoobTacoDB")
    if legacy and type(legacy) == "table" and type(legacy.CollectionNotifications) == "table" then
      NoobTacoUIMediaDB.CollectionNotifications = NoobTacoUIMediaDB.CollectionNotifications or legacy.CollectionNotifications
    end

  if not NoobTacoUIMediaDB.CollectionNotifications then
    NoobTacoUIMediaDB.CollectionNotifications = {}
    print("|cFF16C3F2NoobTacoUI-Media|r: Creating new CollectionNotifications settings table")
  end

  -- Set defaults for any missing values
  local changedSettings = {}
  for key, value in pairs(defaultSettings) do
    if NoobTacoUIMediaDB.CollectionNotifications[key] == nil then
      NoobTacoUIMediaDB.CollectionNotifications[key] = value
      table.insert(changedSettings, key)
    end
  end

  -- Normalize legacy non-boolean values for checkbox keys
  local boolKeys = { "enabled", "newPet", "newMount", "newToy", "newTransmog", "showMessages" }
  for _, k in ipairs(boolKeys) do
    local v = NoobTacoUIMediaDB.CollectionNotifications[k]
    if v == 1 or v == "1" or v == "true" then
      v = true
    elseif v == 0 or v == "0" or v == "false" or v == nil then
      v = false
    elseif type(v) ~= "boolean" then
      -- Anything else non-boolean defaults to false for safety
      v = false
    end
    NoobTacoUIMediaDB.CollectionNotifications[k] = v
  end

  if #changedSettings > 0 then
    print("|cFF16C3F2NoobTacoUI-Media|r: Initialized default values for: " .. table.concat(changedSettings, ", "))
  end
end

-- Helper function to get setting value
local function GetSetting(key)
  InitializeSettings()
  local value = NoobTacoUIMediaDB.CollectionNotifications[key]
  if value ~= nil then return value end
  -- Fallback to legacy table if present
  local legacy = rawget(_G, "NoobTacoDB")
  if legacy and legacy.CollectionNotifications then
    return legacy.CollectionNotifications[key]
  end
  return nil
end

-- Helper function to set setting value
local function SetSetting(key, value)
  InitializeSettings()
  if value == 1 then value = true end
  if value == nil then value = false end
  NoobTacoUIMediaDB.CollectionNotifications[key] = value
  -- Mirror to legacy table for backward compatibility during transition
  local legacy = rawget(_G, "NoobTacoDB")
  if legacy then
    legacy.CollectionNotifications = legacy.CollectionNotifications or {}
    legacy.CollectionNotifications[key] = value
  end
  if addon.CallbackRegistry then
    addon.CallbackRegistry:Trigger("CollectionNotifications." .. key, value)
  end
end

-- Play sound notification
local function PlayNotificationSound(soundKey)
  if not GetSetting("enabled") then return end

  local soundName = GetSetting(soundKey)
  if type(soundName) ~= "string" or soundName == "" then return end

  -- Get the sound file from LibSharedMedia
  local soundFile = LSM:Fetch("sound", soundName)
  if soundFile then
    PlaySoundFile(soundFile, "Master")
  end
end

-- Collection notification handlers
local CollectionNotifications = CreateFrame("Frame")

-- Pet collection notification
local function OnNewPet(self, event, petGUID)
  if GetSetting("newPet") and petGUID then
    -- The NEW_PET_ADDED event provides a pet GUID, not a species ID
    -- We need to get the species ID from the pet GUID first
    local speciesID, _, _, _, _, _, _, name = C_PetJournal.GetPetInfoByPetID(petGUID)

    if speciesID and name then
      -- Check how many of this species we have collected using WoW's API
      local numCollected = C_PetJournal.GetNumCollectedInfo(speciesID)

      -- Only notify if this is the first one we've collected of this species
      if numCollected and numCollected <= 1 then
        PlayNotificationSound("soundPet")
        if GetSetting("showMessages") then
          print(string.format("|cFF16C3F2NoobTacoUI|r: New pet species collected: |cFF00FF00%s|r", name))
        end
      end
    elseif speciesID then
      -- Fallback: try to get name from species ID if direct name lookup failed
      local speciesName = C_PetJournal.GetPetInfoBySpeciesID(speciesID)

      if speciesName then
        -- Check how many of this species we have collected using WoW's API
        local numCollected = C_PetJournal.GetNumCollectedInfo(speciesID)

        -- Only notify if this is the first one we've collected of this species
        if numCollected and numCollected <= 1 then
          PlayNotificationSound("soundPet")
          if GetSetting("showMessages") then
            print(string.format("|cFF16C3F2NoobTacoUI|r: New pet species collected: |cFF00FF00%s|r", speciesName))
          end
        end
      end
    end
  end
end

-- Mount collection notification
local function OnNewMount(self, event, mountID)
  if GetSetting("newMount") and mountID then
    local name = C_MountJournal.GetMountInfoByID(mountID)

    if name then
      -- For mounts, the NEW_MOUNT_ADDED event should only fire for genuinely new mounts
      -- Unlike pets which can have duplicates, mounts are unique - you either have it or you don't
      PlayNotificationSound("soundMount")
      if GetSetting("showMessages") then
        print(string.format("|cFF16C3F2NoobTacoUI|r: New mount collected: |cFF00FF00%s|r", name))
      end
    end
  end
end

-- Toy collection notification
local function OnNewToy(self, event, itemID)
  if GetSetting("newToy") and itemID then
    local name = C_ToyBox.GetToyInfo(itemID)

    if name then
      -- For toys, the NEW_TOY_ADDED event should only fire for genuinely new toys
      -- Similar to mounts, toys are unique - you either have it or you don't
      PlayNotificationSound("soundToy")
      if GetSetting("showMessages") then
        print(string.format("|cFF16C3F2NoobTacoUI|r: New toy collected: |cFF00FF00%s|r", name))
      end
    end
  end
end

-- Transmog collection notification
-- Uses the proper TRANSMOG_COLLECTION_SOURCE_ADDED event (thanks to All the Things addon for the reference!)
local function OnTransmogCollected(self, event, sourceID)
  if not GetSetting("newTransmog") then
    return
  end

  if sourceID and type(sourceID) == "number" then
    -- Get source information
    local sourceInfo = nil
    if C_TransmogCollection and C_TransmogCollection.GetSourceInfo then
      sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID)
    end

    -- Play the notification sound
    PlayNotificationSound("soundTransmog")

    if GetSetting("showMessages") then
      local displayText = "New transmog appearance collected!"

      -- Try to get item name
      if sourceInfo and sourceInfo.itemID and sourceInfo.itemID > 0 then
        local itemName = C_Item.GetItemNameByID(sourceInfo.itemID)
        if itemName then
          displayText = string.format("New transmog collected: |cFF00FF00%s|r", itemName)
        end
      end

      print(string.format("|cFF16C3F2NoobTacoUI|r: %s", displayText))
    end
  end
end

-- Event registration and handlers
local function RegisterEvents()
  if GetSetting("enabled") then
    -- Pet events
    if GetSetting("newPet") then
      CollectionNotifications:RegisterEvent("NEW_PET_ADDED")
    end

    -- Mount events
    if GetSetting("newMount") then
      CollectionNotifications:RegisterEvent("NEW_MOUNT_ADDED")
    end

    -- Toy events
    if GetSetting("newToy") then
      CollectionNotifications:RegisterEvent("NEW_TOY_ADDED")
    end

    -- Transmog events
    if GetSetting("newTransmog") then
      CollectionNotifications:RegisterEvent("TRANSMOG_COLLECTION_SOURCE_ADDED")
    end
  end
end

local function UnregisterEvents()
  CollectionNotifications:UnregisterAllEvents()
end

-- Main event handler
CollectionNotifications:SetScript("OnEvent", function(self, event, ...)
  if event == "NEW_PET_ADDED" then
    OnNewPet(self, event, ...)
  elseif event == "NEW_MOUNT_ADDED" then
    OnNewMount(self, event, ...)
  elseif event == "NEW_TOY_ADDED" then
    OnNewToy(self, event, ...)
  elseif event == "TRANSMOG_COLLECTION_SOURCE_ADDED" then
    OnTransmogCollected(self, event, ...)
  end
end)

-- Initialize on addon loaded
local function OnAddonLoaded(self, event, loadedAddonName)
  if loadedAddonName == addonName then
    InitializeSettings()
    RegisterEvents()

    -- Register callback for settings changes
    if addon.CallbackRegistry then
      addon.CallbackRegistry:RegisterSettingCallback("CollectionNotifications.enabled", function(value)
        if value then
          RegisterEvents()
        else
          UnregisterEvents()
        end
      end)
    end

    self:UnregisterEvent("ADDON_LOADED")
  end
end

-- Register addon loaded event
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", OnAddonLoaded)

-- Export functions for config menu
if addon then
  addon.CollectionNotifications = {
    GetSetting = GetSetting,
    SetSetting = SetSetting,
    RegisterEvents = RegisterEvents,
    UnregisterEvents = UnregisterEvents,
    PlayNotificationSound = PlayNotificationSound,
  }
end

-- Slash command for testing sounds
SLASH_NTMCOLLECTION1 = "/ntmcollection"
SLASH_NTMCOLLECTION2 = "/ntmcol"
SlashCmdList["NTMCOLLECTION"] = function(msg)
  local args = string.lower(msg or "")

  if args == "test" then
    print("|cFF16C3F2NoobTacoUI|r Collection Notifications: Testing all sounds...")
    PlayNotificationSound("soundPet")
    C_Timer.After(1, function() PlayNotificationSound("soundMount") end)
    C_Timer.After(2, function() PlayNotificationSound("soundToy") end)
    C_Timer.After(3, function() PlayNotificationSound("soundTransmog") end)
  elseif args == "testpet" then
    print("|cFF16C3F2NoobTacoUI|r Testing pet notification...")
    PlayNotificationSound("soundPet")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New pet species collected: |cFF00FF00Test Pet|r")
    end
  elseif args == "testmount" then
    print("|cFF16C3F2NoobTacoUI|r Testing mount notification...")
    PlayNotificationSound("soundMount")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New mount collected: |cFF00FF00Test Mount|r")
    end
  elseif args == "testtoy" then
    print("|cFF16C3F2NoobTacoUI|r Testing toy notification...")
    PlayNotificationSound("soundToy")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New toy collected: |cFF00FF00Test Toy|r")
    end
  elseif args == "testtransmog" then
    print("|cFF16C3F2NoobTacoUI|r Testing transmog notification...")
    PlayNotificationSound("soundTransmog")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New transmog collected: |cFF00FF00Test Transmog Item|r")
    end
  elseif args == "status" then
    print("|cFF16C3F2NoobTacoUI|r Collection Notifications Status:")
    print("  Enabled: " .. (GetSetting("enabled") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Pets: " .. (GetSetting("newPet") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Mounts: " .. (GetSetting("newMount") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Toys: " .. (GetSetting("newToy") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Transmog: " .. (GetSetting("newTransmog") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
  else
    print("|cFF16C3F2NoobTacoUI|r Collection Notifications commands:")
    print("  |cFFFFFF00/ntmcollection test|r - Test all notification sounds")
    print("  |cFFFFFF00/ntmcollection testpet|r - Test pet notification")
    print("  |cFFFFFF00/ntmcollection testmount|r - Test mount notification")
    print("  |cFFFFFF00/ntmcollection testtoy|r - Test toy notification")
    print("  |cFFFFFF00/ntmcollection testtransmog|r - Test transmog notification")
    print("  |cFFFFFF00/ntmcollection status|r - Show current settings")
  end
end
