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
  newAchievement = true,
  newTransmog = true,
  newTitle = true,
  volume = 0.8,
  soundPet = "NT_InfussionOfLight",
  soundMount = "NT_Mount",
  soundToy = "NT_Chest",
  soundAchievement = "NT_InfussionOfLight",
  soundTransmog = "NT_Chest",
  soundTitle = "NT_InfussionOfLight",
}

-- Initialize settings if they don't exist
local function InitializeSettings()
  if not NoobTacoDB.CollectionNotifications then
    NoobTacoDB.CollectionNotifications = {}
  end

  -- Set defaults for any missing values
  for key, value in pairs(defaultSettings) do
    if NoobTacoDB.CollectionNotifications[key] == nil then
      NoobTacoDB.CollectionNotifications[key] = value
    end
  end
end

-- Helper function to get setting value
local function GetSetting(key)
  InitializeSettings()
  return NoobTacoDB.CollectionNotifications[key]
end

-- Helper function to set setting value
local function SetSetting(key, value)
  InitializeSettings()
  NoobTacoDB.CollectionNotifications[key] = value
  if addon.CallbackRegistry then
    addon.CallbackRegistry:Trigger("CollectionNotifications." .. key, value)
  end
end

-- Play sound notification
local function PlayNotificationSound(soundKey)
  if not GetSetting("enabled") then return end

  local soundName = GetSetting(soundKey)
  if not soundName then return end

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
  -- Debug message to test if event is triggering
  print(string.format(
    "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Pet collection event triggered! Event: %s, PetGUID: %s", event or "nil",
    tostring(petGUID or "nil")))

  if GetSetting("newPet") and petGUID then
    -- The NEW_PET_ADDED event provides a pet GUID, not a species ID
    -- We need to get the species ID from the pet GUID first
    local speciesID, customName, level, xp, maxXp, displayID, isFavorite, name = C_PetJournal.GetPetInfoByPetID(petGUID)

    print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Pet info lookup - SpeciesID: %s, Name: %s",
      tostring(speciesID or "nil"), tostring(name or "nil")))

    if speciesID and name then
      -- Check how many of this species we have collected using WoW's API
      local numCollected, limit = C_PetJournal.GetNumCollectedInfo(speciesID)
      print(string.format(
        "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Species collection count - Collected: %s, Limit: %s",
        tostring(numCollected or "nil"), tostring(limit or "nil")))

      -- Only notify if this is the first one we've collected of this species
      if numCollected and numCollected <= 1 then
        PlayNotificationSound("soundPet")
        if GetSetting("showMessages") then
          print(string.format("|cFF16C3F2NoobTacoUI|r: New pet species collected: |cFF00FF00%s|r", name))
        end
        print(string.format(
          "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: First collection of species %s - notification sent", name))
      else
        print(string.format(
          "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Already have %s of species %s - no notification",
          tostring(numCollected), name))
      end
    elseif speciesID then
      -- Fallback: try to get name from species ID if direct name lookup failed
      local speciesName = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
      print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Fallback species name lookup: %s",
        tostring(speciesName or "nil")))

      if speciesName then
        -- Check how many of this species we have collected using WoW's API
        local numCollected, limit = C_PetJournal.GetNumCollectedInfo(speciesID)
        print(string.format(
          "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Fallback collection count - Collected: %s, Limit: %s",
          tostring(numCollected or "nil"), tostring(limit or "nil")))

        -- Only notify if this is the first one we've collected of this species
        if numCollected and numCollected <= 1 then
          PlayNotificationSound("soundPet")
          if GetSetting("showMessages") then
            print(string.format("|cFF16C3F2NoobTacoUI|r: New pet species collected: |cFF00FF00%s|r", speciesName))
          end
          print(string.format(
            "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: First collection of species %s - notification sent", speciesName))
        else
          print(string.format(
            "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Already have %s of species %s - no notification",
            tostring(numCollected), speciesName))
        end
      end
    end
  else
    print(string.format(
      "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Pet notification disabled or invalid petGUID. Enabled: %s",
      tostring(GetSetting("newPet"))))
  end
end

-- Mount collection notification
local function OnNewMount(self, event, mountID)
  -- Debug message to test if event is triggering
  print(string.format(
    "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Mount collection event triggered! Event: %s, MountID: %s",
    event or "nil",
    tostring(mountID or "nil")))

  if GetSetting("newMount") and mountID then
    local name, spellID, icon, isActive, isUsable, sourceType, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected =
        C_MountJournal.GetMountInfoByID(mountID)
    print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Mount info lookup - Name: %s, IsCollected: %s",
      tostring(name or "nil"), tostring(isCollected or "nil")))

    if name then
      -- Check if this mount was already collected before this event
      -- The isCollected flag should be true now, but we want to check if this is the first time
      -- We can do this by checking if the mount is usable (newly collected mounts are immediately usable)

      -- Additional check: get all mounts and see if this one was already known
      local numMounts = C_MountJournal.GetNumMounts()
      local wasAlreadyKnown = false

      -- Note: This is a simple approach - in a real scenario, we might need more sophisticated tracking
      -- For now, we'll assume that if the mount journal event fired, it's a new collection
      print(string.format(
        "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Mount collection status - Name: %s, Usable: %s, Total mounts: %s",
        tostring(name), tostring(isUsable or "nil"), tostring(numMounts or "nil")))

      -- For mounts, the NEW_MOUNT_ADDED event should only fire for genuinely new mounts
      -- Unlike pets which can have duplicates, mounts are unique - you either have it or you don't
      PlayNotificationSound("soundMount")
      if GetSetting("showMessages") then
        print(string.format("|cFF16C3F2NoobTacoUI|r: New mount collected: |cFF00FF00%s|r", name))
      end
      print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Mount notification sent for: %s", name))
    end
  else
    print(string.format(
      "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Mount notification disabled or invalid mountID. Enabled: %s",
      tostring(GetSetting("newMount"))))
  end
end

-- Toy collection notification
local function OnNewToy(self, event, itemID)
  -- Debug message to test if event is triggering
  print(string.format(
    "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Toy collection event triggered! Event: %s, ItemID: %s", event or "nil",
    tostring(itemID or "nil")))

  if GetSetting("newToy") and itemID then
    local name = C_ToyBox.GetToyInfo(itemID)
    print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Toy name lookup result: %s", tostring(name or "nil")))

    if name then
      -- Check if we already have this toy using the toy box API
      local isToyUsable = C_ToyBox.IsToyUsable(itemID)
      local hasToy = PlayerHasToy(itemID)
      
      print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Toy status - Usable: %s, Have: %s", 
        tostring(isToyUsable or "nil"), tostring(hasToy or "nil")))
      
      -- For toys, the NEW_TOY_ADDED event should only fire for genuinely new toys
      -- Similar to mounts, toys are unique - you either have it or you don't
      PlayNotificationSound("soundToy")
      if GetSetting("showMessages") then
        print(string.format("|cFF16C3F2NoobTacoUI|r: New toy collected: |cFF00FF00%s|r", name))
      end
      print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Toy notification sent for: %s", name))
    end
  else
    print(string.format(
      "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Toy notification disabled or invalid itemID. Enabled: %s",
      tostring(GetSetting("newToy"))))
  end
end

-- Achievement notification
local function OnAchievementEarned(self, event, achievementID)
  -- Debug message to test if event is triggering
  print(string.format(
    "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Achievement event triggered! Event: %s, AchievementID: %s",
    event or "nil",
    tostring(achievementID or "nil")))

  if GetSetting("newAchievement") and achievementID then
    local name = GetAchievementInfo(achievementID)
    print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Achievement name lookup result: %s",
      tostring(name or "nil")))

    if name then
      PlayNotificationSound("soundAchievement")
      if GetSetting("showMessages") then
        print(string.format("|cFF16C3F2NoobTacoUI|r: Achievement earned: |cFF00FF00%s|r", name))
      end
    end
  else
    print(string.format(
      "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Achievement notification disabled or invalid achievementID. Enabled: %s",
      tostring(GetSetting("newAchievement"))))
  end
end

-- Transmog collection notification
local function OnTransmogCollected(self, event, appearanceID, sourceID)
  -- Debug message to test if event is triggering
  print(string.format(
    "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Transmog event triggered! Event: %s, AppearanceID: %s, SourceID: %s",
    event or "nil", tostring(appearanceID or "nil"), tostring(sourceID or "nil")))

  if GetSetting("newTransmog") then
    PlayNotificationSound("soundTransmog")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New transmog appearance collected!")
    end
  else
    print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Transmog notification disabled. Enabled: %s",
      tostring(GetSetting("newTransmog"))))
  end
end

-- Title earned notification
-- Note: Most titles in WoW are earned through achievements, so title notifications
-- are typically handled by the achievement notification system above.
-- This function is kept for potential future use if a separate title event is added.
local function OnTitleEarned(self, event, titleID)
  if GetSetting("newTitle") and titleID then
    PlayNotificationSound("soundTitle")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New title earned!")
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

    -- Achievement events
    if GetSetting("newAchievement") then
      CollectionNotifications:RegisterEvent("ACHIEVEMENT_EARNED")
    end

    -- Transmog events
    if GetSetting("newTransmog") then
      CollectionNotifications:RegisterEvent("TRANSMOG_COLLECTION_UPDATED")
    end

    -- Note: Title notifications are handled through achievements
    -- as there's no separate TITLE_EARNED event in WoW's API
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
  elseif event == "ACHIEVEMENT_EARNED" then
    OnAchievementEarned(self, event, ...)
  elseif event == "TRANSMOG_COLLECTION_UPDATED" then
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
    C_Timer.After(3, function() PlayNotificationSound("soundAchievement") end)
    C_Timer.After(4, function() PlayNotificationSound("soundTransmog") end)
    C_Timer.After(5, function() PlayNotificationSound("soundTitle") end)
  elseif args == "testmount" then
    print("|cFF16C3F2NoobTacoUI|r Testing mount notification...")
    PlayNotificationSound("soundMount")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New mount collected: |cFF00FF00Test Mount|r")
    end
  elseif args == "mounts" then
    print("|cFF16C3F2NoobTacoUI|r Mount collection analysis:")
    local numMounts = C_MountJournal.GetNumMounts()
    local collectedCount = 0
    local usableCount = 0
    local factionRestrictedCount = 0
    local hiddenCount = 0

    print("  Scanning mount database...")

    -- Count different categories of mounts
    for i = 1, math.min(numMounts or 0, 1500) do -- Limit to prevent lag
      local name, spellID, icon, isActive, isUsable, sourceType, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected =
      C_MountJournal.GetMountInfoByID(i)

      if name then
        if isCollected then
          collectedCount = collectedCount + 1
        end
        if isUsable then
          usableCount = usableCount + 1
        end
        if isFactionSpecific then
          factionRestrictedCount = factionRestrictedCount + 1
        end
        if shouldHideOnChar then
          hiddenCount = hiddenCount + 1
        end
      end
    end

    print("  |cFFFFFF00Results:|r")
    print("    Total mounts in game database: " .. tostring(numMounts or "unknown"))
    print("    |cFF00FF00Mounts you own:|r " .. tostring(collectedCount))
    print("    |cFF00FF00Mounts you can use:|r " .. tostring(usableCount))
    print("    |cFFFF8000Faction-restricted mounts:|r " .. tostring(factionRestrictedCount))
    print("    |cFFFF0000Hidden from your character:|r " .. tostring(hiddenCount))
    print("  |cFF808080Note: Your mount journal shows usable collected mounts|r")

    -- Show a few collected mounts as examples
    print("  |cFFFFFF00Sample collected mounts:|r")
    local sampleCount = 0
    for i = 1, math.min(numMounts or 0, 200) do -- Check first 200 for samples
      if sampleCount >= 3 then break end

      local name, spellID, icon, isActive, isUsable, sourceType, isFavorite, isFactionSpecific, faction, shouldHideOnChar, isCollected =
      C_MountJournal.GetMountInfoByID(i)

      if name and isCollected then
        sampleCount = sampleCount + 1
        local statusInfo = ""
        if isUsable then statusInfo = statusInfo .. " |cFF00FF00Usable|r" end
        if isFactionSpecific then statusInfo = statusInfo .. " |cFFFF8000Faction|r" end
        if shouldHideOnChar then statusInfo = statusInfo .. " |cFFFF0000Hidden|r" end

        print(string.format("    %s%s", name, statusInfo))
      end
    end
  elseif args == "testtoy" then
    print("|cFF16C3F2NoobTacoUI|r Testing toy notification...")
    PlayNotificationSound("soundToy")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New toy collected: |cFF00FF00Test Toy|r")
    end
  elseif args == "toys" then
    print("|cFF16C3F2NoobTacoUI|r Toy collection analysis:")
    
    -- Get all toy IDs and check which ones we have
    local collectedCount = 0
    local usableCount = 0
    local sampleToys = {}
    
    print("  Scanning toy collection...")
    
    -- Sample some known toy IDs to test the API
    local sampleToyIDs = {88375, 86573, 104299, 113670, 128310, 140325, 151016, 163750, 174450, 188692}
    
    for _, toyID in ipairs(sampleToyIDs) do
      local toyName = C_ToyBox.GetToyInfo(toyID)
      if toyName then
        local hasToy = PlayerHasToy(toyID)
        local isUsable = C_ToyBox.IsToyUsable(toyID)
        
        if hasToy then
          collectedCount = collectedCount + 1
          if #sampleToys < 3 then
            table.insert(sampleToys, {name = toyName, usable = isUsable})
          end
        end
        if isUsable then
          usableCount = usableCount + 1
        end
      end
    end
    
    -- Try to get total toy count from C_ToyBox if available
    local totalToys = "unknown"
    if C_ToyBox.GetNumToys then
      totalToys = tostring(C_ToyBox.GetNumToys())
    end
    
    print("  |cFFFFFF00Results (sample check):|r")
    print("    Total toys in sample: " .. tostring(#sampleToyIDs))
    print("    |cFF00FF00Sample toys you own:|r " .. tostring(collectedCount))
    print("    |cFF00FF00Sample toys usable:|r " .. tostring(usableCount))
    print("  |cFF808080Note: This is a limited sample of toy IDs|r")
    
    -- Show collected toy samples
    if #sampleToys > 0 then
      print("  |cFFFFFF00Sample collected toys:|r")
      for _, toy in ipairs(sampleToys) do
        local statusInfo = toy.usable and " |cFF00FF00Usable|r" or " |cFFFF0000Not Usable|r"
        print(string.format("    %s%s", toy.name, statusInfo))
      end
    end
  elseif args == "status" then
    print("|cFF16C3F2NoobTacoUI|r Collection Notifications Status:")
    print("  Enabled: " .. (GetSetting("enabled") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Pets: " .. (GetSetting("newPet") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Mounts: " .. (GetSetting("newMount") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Toys: " .. (GetSetting("newToy") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Achievements: " .. (GetSetting("newAchievement") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Transmog: " .. (GetSetting("newTransmog") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
    print("  Titles: " .. (GetSetting("newTitle") and "|cFF00FF00Yes|r" or "|cFFFF0000No|r"))
  else
    print("|cFF16C3F2NoobTacoUI|r Collection Notifications commands:")
    print("  |cFFFFFF00/ntmcollection test|r - Test all notification sounds")
    print("  |cFFFFFF00/ntmcollection testmount|r - Test mount notification specifically")
    print("  |cFFFFFF00/ntmcollection mounts|r - Show mount collection debug info")
    print("  |cFFFFFF00/ntmcollection testtoy|r - Test toy notification specifically")
    print("  |cFFFFFF00/ntmcollection toys|r - Show toy collection debug info")
    print("  |cFFFFFF00/ntmcollection status|r - Show current settings")
  end
end
