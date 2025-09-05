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

-- Collection Notifications Configuration Popup
function addon.CreateCollectionNotificationsPopup()
  -- Check if popup already exists and close it
  if _G["NoobTacoUICollectionNotifPopup"] then
    _G["NoobTacoUICollectionNotifPopup"]:Hide()
    _G["NoobTacoUICollectionNotifPopup"] = nil
  end

  -- Create the popup window
  local popupWidth = 450
  local popupHeight = 350
  local popup = CreateFrame("Frame", "NoobTacoUICollectionNotifPopup", UIParent)
  popup:SetSize(popupWidth, popupHeight)
  popup:SetPoint("CENTER", UIParent, "CENTER", 50, 0)
  popup:SetMovable(true)
  popup:SetClampedToScreen(true)
  popup:RegisterForDrag("LeftButton")
  popup:SetScript("OnDragStart", function(self) self:StartMoving() end)
  popup:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
  popup:SetFrameStrata("DIALOG")
  popup:SetFrameLevel(100)

  -- Background using Nord colors
  local bg = popup:CreateTexture(nil, "BACKGROUND")
  bg:SetAllPoints()
  bg:SetColorTexture(unpack(addon.UIAssets.Colors.Nord1))

  -- Border
  local border = popup:CreateTexture(nil, "BORDER")
  border:SetPoint("TOPLEFT", popup, "TOPLEFT", -2, 2)
  border:SetPoint("BOTTOMRIGHT", popup, "BOTTOMRIGHT", 2, -2)
  border:SetColorTexture(unpack(addon.UIAssets.Colors.Nord3))

  -- Title Bar
  local titleBar = CreateFrame("Frame", nil, popup)
  titleBar:SetHeight(32)
  titleBar:SetPoint("TOPLEFT", popup, "TOPLEFT", 0, 0)
  titleBar:SetPoint("TOPRIGHT", popup, "TOPRIGHT", 0, 0)

  local titleBG = titleBar:CreateTexture(nil, "BACKGROUND")
  titleBG:SetAllPoints()
  titleBG:SetColorTexture(unpack(addon.UIAssets.Colors.Nord2))

  local title = titleBar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  title:SetPoint("LEFT", titleBar, "LEFT", 12, 0)
  title:SetText("Collection Notifications Settings")
  title:SetTextColor(unpack(addon.UIAssets.Colors.Nord6))

  -- Close button
  local closeButton = CreateFrame("Button", nil, titleBar)
  closeButton:SetSize(20, 20)
  closeButton:SetPoint("RIGHT", titleBar, "RIGHT", -6, 0)

  local closeX = closeButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  closeX:SetPoint("CENTER")
  closeX:SetText("×")
  closeX:SetTextColor(unpack(addon.UIAssets.Colors.Nord4))

  closeButton:SetScript("OnClick", function() popup:Hide() end)
  closeButton:SetScript("OnEnter", function() closeX:SetTextColor(unpack(addon.UIAssets.Colors.Nord11)) end)
  closeButton:SetScript("OnLeave", function() closeX:SetTextColor(unpack(addon.UIAssets.Colors.Nord4)) end)

  -- Content area
  local contentFrame = CreateFrame("Frame", nil, popup)
  contentFrame:SetPoint("TOPLEFT", titleBar, "BOTTOMLEFT", 16, -12)
  contentFrame:SetPoint("BOTTOMRIGHT", popup, "BOTTOMRIGHT", -16, 16)

  local yOffset = 0

  -- Global Enable Toggle
  local enableLabel = contentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  enableLabel:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 0, -yOffset)
  enableLabel:SetText("Enable Collection Notifications")
  enableLabel:SetTextColor(unpack(addon.UIAssets.Colors.Nord6))

  local enableCheckbox = CreateFrame("CheckButton", nil, contentFrame, "ChatConfigCheckButtonTemplate")
  enableCheckbox:SetPoint("LEFT", enableLabel, "RIGHT", 10, 0)
  enableCheckbox:SetSize(20, 20)
  enableCheckbox:SetChecked(GetSetting("enabled"))

  yOffset = yOffset + 40

  -- Collection Type Toggles
  local collectionTypes = {
    { key = "newPet",      label = "Pet Collections",      sound = "soundPet" },
    { key = "newMount",    label = "Mount Collections",    sound = "soundMount" },
    { key = "newToy",      label = "Toy Collections",      sound = "soundToy" },
    { key = "newTransmog", label = "Transmog Collections", sound = "soundTransmog" }
  }

  local configurableElements = {}

  for _, typeData in ipairs(collectionTypes) do
    local typeLabel = contentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    typeLabel:SetPoint("TOPLEFT", contentFrame, "TOPLEFT", 20, -yOffset)
    typeLabel:SetText(typeData.label)
    typeLabel:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))

    local typeCheckbox = CreateFrame("CheckButton", nil, contentFrame, "ChatConfigCheckButtonTemplate")
    typeCheckbox:SetPoint("LEFT", typeLabel, "RIGHT", 10, 0)
    typeCheckbox:SetSize(18, 18)
    typeCheckbox:SetChecked(GetSetting(typeData.key))
    typeCheckbox:SetScript("OnClick", function(self)
      SetSetting(typeData.key, self:GetChecked())
    end)

    -- Test button for each type
    local testButton = CreateFrame("Button", nil, contentFrame)
    testButton:SetSize(50, 20)
    testButton:SetPoint("LEFT", typeCheckbox, "RIGHT", 80, 0)

    local testBG = testButton:CreateTexture(nil, "BACKGROUND")
    testBG:SetAllPoints()
    testBG:SetColorTexture(unpack(addon.UIAssets.Colors.Nord8))
    testBG:SetAlpha(0.8)

    local testText = testButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    testText:SetPoint("CENTER")
    testText:SetText("Test")
    testText:SetTextColor(unpack(addon.UIAssets.Colors.Nord0))

    testButton:SetScript("OnClick", function()
      local soundType = typeData.key:gsub("new", ""):lower()
      PlayNotificationSound(soundType)
    end)

    testButton:SetScript("OnEnter", function(self) testBG:SetAlpha(1.0) end)
    testButton:SetScript("OnLeave", function(self) testBG:SetAlpha(0.8) end)

    -- Add to configurable elements
    table.insert(configurableElements, { element = typeLabel, type = "fontstring" })
    table.insert(configurableElements, { element = typeCheckbox, type = "button" })
    table.insert(configurableElements, { element = testButton, type = "button" })

    yOffset = yOffset + 25
  end

  -- Function to update elements state
  local function UpdateElementsState(enabled)
    for _, elementData in ipairs(configurableElements) do
      local element = elementData.element
      local elementType = elementData.type

      if elementType == "fontstring" then
        if enabled then
          element:SetTextColor(unpack(addon.UIAssets.Colors.Nord5))
        else
          element:SetTextColor(unpack(addon.UIAssets.Colors.Nord3))
        end
      elseif elementType == "button" then
        if enabled then
          element:Enable()
          element:SetAlpha(1.0)
        else
          element:Disable()
          element:SetAlpha(0.5)
        end
      end
    end
  end

  -- Global enable checkbox functionality
  enableCheckbox:SetScript("OnClick", function(self)
    local enabled = self:GetChecked()
    SetSetting("enabled", enabled)
    UpdateElementsState(enabled)
  end)

  -- Apply initial state
  UpdateElementsState(GetSetting("enabled"))

  popup:Show()
end
