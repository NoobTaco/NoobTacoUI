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
local function OnNewPet(self, event, speciesID)
    if GetSetting("newPet") and speciesID then
        local name = C_PetJournal.GetPetInfoBySpeciesID(speciesID)
        if name then
            PlayNotificationSound("soundPet")
            if GetSetting("showMessages") then
                print(string.format("|cFF16C3F2NoobTacoUI|r: New pet collected: |cFF00FF00%s|r", name))
            end
        end
    end
end

-- Mount collection notification
local function OnNewMount(self, event, mountID)
    if GetSetting("newMount") and mountID then
        local name = C_MountJournal.GetMountInfoByID(mountID)
        if name then
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
            PlayNotificationSound("soundToy")
            if GetSetting("showMessages") then
                print(string.format("|cFF16C3F2NoobTacoUI|r: New toy collected: |cFF00FF00%s|r", name))
            end
        end
    end
end

-- Achievement notification
local function OnAchievementEarned(self, event, achievementID)
    if GetSetting("newAchievement") and achievementID then
        local name = GetAchievementInfo(achievementID)
        if name then
            PlayNotificationSound("soundAchievement")
            if GetSetting("showMessages") then
                print(string.format("|cFF16C3F2NoobTacoUI|r: Achievement earned: |cFF00FF00%s|r", name))
            end
        end
    end
end

-- Transmog collection notification
local function OnTransmogCollected(self, event, appearanceID, sourceID)
    if GetSetting("newTransmog") then
        PlayNotificationSound("soundTransmog")
        if GetSetting("showMessages") then
            print("|cFF16C3F2NoobTacoUI|r: New transmog appearance collected!")
        end
    end
end

-- Title earned notification
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
        
        -- Title events (if available)
        if GetSetting("newTitle") then
            CollectionNotifications:RegisterEvent("TITLE_EARNED")
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
    elseif event == "ACHIEVEMENT_EARNED" then
        OnAchievementEarned(self, event, ...)
    elseif event == "TRANSMOG_COLLECTION_UPDATED" then
        OnTransmogCollected(self, event, ...)
    elseif event == "TITLE_EARNED" then
        OnTitleEarned(self, event, ...)
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
        print("  |cFFFFFF00/ntmcollection status|r - Show current settings")
    end
end
