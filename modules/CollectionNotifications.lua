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
  volume = 0.8,
  soundPet = "NT_InfussionOfLight",
  soundMount = "NT_Mount",
  soundToy = "NT_Chest",
  soundTransmog = "NT_Chest",
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
-- REMOVED: Default WoW toasts work well for achievements
-- local function OnAchievementEarned(self, event, achievementID)

-- Transmog collection notification
local function OnTransmogCollected(self, event, ...)
  -- Debug message to test if event is triggering with all parameters
  local args = {...}
  print(string.format(
    "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Transmog event triggered! Event: %s, ArgCount: %d",
    tostring(event), #args))
  
  -- Print all arguments to see what we actually get
  for i, arg in ipairs(args) do
    print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Arg[%d] = %s (type: %s)", 
      i, tostring(arg), type(arg)))
  end

  if GetSetting("newTransmog") then
    -- Try to get source info if we have parameters
    local itemName = nil
    local sourceID = args[1] -- First argument might be sourceID
    local appearanceID = args[2] -- Second argument might be appearanceID
    
    -- Try different parameter combinations
    if sourceID and C_TransmogCollection and C_TransmogCollection.GetSourceInfo then
      local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceID)
      print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Source info lookup - SourceID: %s, Found: %s", 
        tostring(sourceID), tostring(sourceInfo and "yes" or "no")))
      
      if sourceInfo and sourceInfo.itemID and sourceInfo.itemID > 0 then
        itemName = GetItemInfo(sourceInfo.itemID)
        print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Item lookup - ItemID: %s, Name: %s", 
          tostring(sourceInfo.itemID), tostring(itemName or "nil")))
      end
    end

    PlayNotificationSound("soundTransmog")
    if GetSetting("showMessages") then
      local displayText = "New transmog appearance collected!"
      if itemName then
        displayText = string.format("New transmog collected: |cFF00FF00%s|r", itemName)
      elseif sourceID or appearanceID then
        displayText = string.format("New transmog appearance collected (Source: %s, Appearance: %s)", 
          tostring(sourceID or "nil"), tostring(appearanceID or "nil"))
      end
      print(string.format("|cFF16C3F2NoobTacoUI|r: %s", displayText))
    end

    print(string.format(
      "|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Transmog notification sent - SourceID: %s, AppearanceID: %s, ItemName: %s",
      tostring(sourceID), tostring(appearanceID), tostring(itemName or "Unknown")))
  else
    print(string.format("|cFFFF8000[DEBUG]|r |cFF16C3F2NoobTacoUI|r: Transmog notification disabled. Enabled: %s",
      tostring(GetSetting("newTransmog"))))
  end
end

-- Title earned notification
-- REMOVED: Most titles are earned through achievements, default WoW toasts work well
-- local function OnTitleEarned(self, event, titleID)

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
      CollectionNotifications:RegisterEvent("TRANSMOG_COLLECTION_UPDATED")
    end

    -- Note: Achievement and title notifications removed - default WoW toasts work well
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
  elseif event == "TRANSMOG_COLLECTION_UPDATED" then
    OnTransmogCollected(self, event, ...)
  end
  -- Note: Achievement and title events removed - default WoW toasts work well
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
    local sampleToyIDs = { 88375, 86573, 104299, 113670, 128310, 140325, 151016, 163750, 174450, 188692 }

    for _, toyID in ipairs(sampleToyIDs) do
      local toyName = C_ToyBox.GetToyInfo(toyID)
      if toyName then
        local hasToy = PlayerHasToy(toyID)
        local isUsable = C_ToyBox.IsToyUsable(toyID)

        if hasToy then
          collectedCount = collectedCount + 1
          if #sampleToys < 3 then
            table.insert(sampleToys, { name = toyName, usable = isUsable })
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
  elseif args == "testtransmog" then
    print("|cFF16C3F2NoobTacoUI|r Testing transmog notification...")
    PlayNotificationSound("soundTransmog")
    if GetSetting("showMessages") then
      print("|cFF16C3F2NoobTacoUI|r: New transmog collected: |cFF00FF00Test Appearance|r (Chest)")
    end
  elseif args == "transmog" then
    print("|cFF16C3F2NoobTacoUI|r Transmog collection analysis:")
    
    -- Test basic transmog API availability
    print("  Checking transmog API availability...")
    
    if C_TransmogCollection then
      print("    |cFF00FF00C_TransmogCollection|r - Available")
      
      -- Check what functions are available
      local availableFunctions = {}
      local functionNames = {
        "GetSourceInfo",
        "PlayerHasTransmog", 
        "PlayerHasTransmogBySourceID",
        "GetSourcesOfAppearance",
        "GetAllSourcesOfAppearance"
      }
      
      for _, funcName in ipairs(functionNames) do
        if C_TransmogCollection[funcName] then
          table.insert(availableFunctions, funcName)
        end
      end
      
      if #availableFunctions > 0 then
        print("    Available functions:")
        for _, funcName in ipairs(availableFunctions) do
          print("      |cFF00FF00" .. funcName .. "|r")
        end
      else
        print("    |cFFFF0000No C_TransmogCollection functions found|r")
      end
    else
      print("    |cFFFF0000C_TransmogCollection|r - Not available")
    end
    
    -- Check transmog sets API
    if C_TransmogSets then
      print("    |cFF00FF00C_TransmogSets|r - Available")
      if C_TransmogSets.GetSetsInfo then
        local setsInfo = C_TransmogSets.GetSetsInfo()
        local totalSets = setsInfo and #setsInfo or 0
        print("      Total transmog sets: " .. tostring(totalSets))
      end
    else
      print("    |cFFFF0000C_TransmogSets|r - Not available")
    end
    
    -- Simple test with known items instead of appearance IDs
    print("  |cFFFFFF00Testing with sample items:|r")
    local sampleItems = {
      2589, -- Linen Cloth (basic item)
      25, -- Worn Shortsword
      6948, -- Hearthstone
      1396, -- Elven Chain Vest
      2447, -- Peacebloom
    }
    
    local foundItems = 0
    for _, itemID in ipairs(sampleItems) do
      local itemName = GetItemInfo(itemID)
      if itemName then
        foundItems = foundItems + 1
        print(string.format("    Item %d: %s", itemID, itemName))
        
        -- Try to get source info if the API is available
        if C_TransmogCollection and C_TransmogCollection.GetSourceInfo then
          -- Note: This may not work for all items as not all items have transmog sources
          local sourceInfo = C_TransmogCollection.GetSourceInfo(itemID)
          if sourceInfo then
            print(string.format("      Source info found for item %d", itemID))
          end
        end
      end
    end
    
    print("  |cFF808080Note: Transmog API varies by WoW version - some functions may not be available|r")
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
    print("  |cFFFFFF00/ntmcollection testmount|r - Test mount notification specifically")
    print("  |cFFFFFF00/ntmcollection mounts|r - Show mount collection debug info")
    print("  |cFFFFFF00/ntmcollection testtoy|r - Test toy notification specifically")
    print("  |cFFFFFF00/ntmcollection toys|r - Show toy collection debug info")
    print("  |cFFFFFF00/ntmcollection testtransmog|r - Test transmog notification specifically")
    print("  |cFFFFFF00/ntmcollection transmog|r - Show transmog collection debug info")
    print("  |cFFFFFF00/ntmcollection status|r - Show current settings")
    print("  |cFF808080Note: Achievement and title notifications removed (WoW defaults work better)|r")
  end
end
