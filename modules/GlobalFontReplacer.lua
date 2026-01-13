local addonName, addon = ...
local GlobalFontReplacer = {}
addon.GlobalFontReplacer = GlobalFontReplacer

local LSM = LibStub("LibSharedMedia-3.0")

-- Helper to safely check if an object is a Font
local function SafeIsFont(obj)
    if type(obj) ~= "table" then return false end
    if not obj.IsObjectType then return false end
    local success, result = pcall(obj.IsObjectType, obj, "Font")
    return success and result
end

-- Deep Frame Traversal (Recursive Scanner)
-- Defined at file scope so the Event Handler can use it for LOD addons
local function RecursiveApplyFont(frame, fontPathToApply)
    if not frame or not fontPathToApply then return end

    -- If this frame itself is a FontString, apply it
    local isFontString
    if frame.IsObjectType then
        local success, result = pcall(frame.IsObjectType, frame, "FontString")
        isFontString = success and result
    end

    if isFontString then
        local _, size, flags = frame:GetFont()
        frame:SetFont(fontPathToApply, size, flags)
    end

    -- If it has children, recurse
    if frame.GetChildren then
        local children = { frame:GetChildren() }
        for _, child in ipairs(children) do
            RecursiveApplyFont(child, fontPathToApply)
        end
    end
    -- Also check regions (textures, fontstrings) if valid
    if frame.GetRegions then
        local regions = { frame:GetRegions() }
        for _, region in ipairs(regions) do
            local isRegionFontString
            if region.IsObjectType then
                local success, result = pcall(region.IsObjectType, region, "FontString")
                isRegionFontString = success and result
            end

            if isRegionFontString then
                local _, size, flags = region:GetFont()
                region:SetFont(fontPathToApply, size, flags)
            end
        end
    end
end

function GlobalFontReplacer:ApplyFont()
    -- Check if feature is enabled
    if not NoobTacoUIDB or not NoobTacoUIDB.GeneralSettings or not NoobTacoUIDB.GeneralSettings.enableGlobalFont then
        return
    end

    local settings = NoobTacoUIDB.GeneralSettings

    -- 1. Setup Font Paths from LSM
    local interfaceFontPath = LSM:Fetch("font", settings.globalFont or "Poppins-Regular")

    local overrides = settings.fontOverrides or {}
    local chatFontPath = LSM:Fetch("font", overrides.chat or settings.globalFont or "Poppins-Regular")
    local combatFontPath = LSM:Fetch("font", overrides.combat or settings.globalFont or "Poppins-Regular")
    local questFontPath = LSM:Fetch("font", overrides.quester or settings.globalFont or "Poppins-Regular")

    if not interfaceFontPath then return end

    -- 2. Define Source Mappings (Lower case for comparison)
    local sourceMap = {
        ["frizqt__.ttf"] = interfaceFontPath,
        ["arialn.ttf"]   = chatFontPath,
        ["skurri.ttf"]   = combatFontPath,
        ["morpheus.ttf"] = questFontPath,

        -- Fallbacks / Variants
        ["frizqt__.otf"] = interfaceFontPath,
        ["arialn.otf"]   = chatFontPath,
        ["skurri.otf"]   = combatFontPath,
        ["morpheus.otf"] = questFontPath,
    }

    -- 3. Iterate Global Environment for Font Objects (SAFELY)
    local processedFonts = {}

    for name, obj in pairs(_G) do
        if SafeIsFont(obj) then
            if not processedFonts[obj] then
                processedFonts[obj] = true

                local success, file, height, flags = pcall(obj.GetFont, obj)

                if success and file then
                    local normalizedFile = string.lower(file)
                    normalizedFile = string.gsub(normalizedFile, "\\", "/")
                    local filename = normalizedFile:match("([^/]+)$")

                    if filename and sourceMap[filename] then
                        obj:SetFont(sourceMap[filename], height, flags)
                    end
                end
            end
        end
    end

    -- 4. Overwrite Global Variables for Combat Text & Nameplates
    -- These are used by the C engine for floating text
    if combatFontPath then
        DAMAGE_TEXT_FONT = combatFontPath
    end
    if interfaceFontPath then
        UNIT_NAME_FONT = interfaceFontPath
        NAMEPLATE_FONT = interfaceFontPath
        STANDARD_TEXT_FONT = interfaceFontPath
    end

    -- 5. Manual Overrides for stubborn system fonts (Combat & Names)
    if combatFontPath then
        local manualTargets = {
            "CombatTextFont",
            "SystemFont_Shadow_Huge",
            "SystemFont_Shadow_Large",
            "SystemFont_NamePlateFixed",
            "SystemFont_LargeNamePlateFixed",
            "SystemFont_World",
        }
        for _, name in ipairs(manualTargets) do
            local obj = _G[name]
            if obj and obj.SetFont and obj.GetFont then
                local _, h, f = obj:GetFont()
                obj:SetFont(combatFontPath, h, f)
            end
        end
    end

    -- 6. Standard Frames that are already loaded
    if questFontPath then
        -- Objective Tracker is usually loaded
        local function SafeSetFont(name, font)
            local f = _G[name]
            if f and f.SetFont and f.GetFont then
                local _, s, fl = f:GetFont()
                f:SetFont(font, s, fl)
            end
        end
        SafeSetFont("ObjectiveTrackerBlocksFrame.QuestHeader.Text", questFontPath)
        SafeSetFont("ObjectiveTrackerFrame.HeaderMenu.Title", questFontPath)
    end
end

-- Initialize the module
function GlobalFontReplacer:Initialize()
    self:ApplyFont()
end

-- Helper to get Quest Font path for the Event Handler
function GlobalFontReplacer:GetQuestFontPath()
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings then
        local settings = NoobTacoUIDB.GeneralSettings
        local overrides = settings.fontOverrides or {}
        local fontName = overrides.quester or settings.globalFont or "Poppins-Regular"
        return LSM:Fetch("font", fontName)
    end
    return nil
end

-- Helper to set critical global variables early
-- NOTE: DAMAGE_TEXT_FONT must be set before the combat text system initializes.
-- Changes to combat text font require a /reload to take effect.
local function SetEarlyCombatGlobals()
    if not NoobTacoUIDB or not NoobTacoUIDB.GeneralSettings or not NoobTacoUIDB.GeneralSettings.enableGlobalFont then
        return
    end

    local settings = NoobTacoUIDB.GeneralSettings
    local overrides = settings.fontOverrides or {}

    -- Combat Text Font (requires reload to take effect)
    local combatFontPath = LSM:Fetch("font", overrides.combat or settings.globalFont or "Poppins-Regular")
    if combatFontPath then
        DAMAGE_TEXT_FONT = combatFontPath
    end

    -- Interface/Names fonts
    local interfaceFontPath = LSM:Fetch("font", settings.globalFont or "Poppins-Regular")
    if interfaceFontPath then
        UNIT_NAME_FONT = interfaceFontPath
        NAMEPLATE_FONT = interfaceFontPath
        STANDARD_TEXT_FONT = interfaceFontPath
    end
end

-- Public method to check if reload is needed after settings change
function GlobalFontReplacer:RequiresReload()
    return true -- Combat text changes always require reload
end

-- Event handling
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

local addonLoaded = false

eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" then
        -- Set global variables AS EARLY AS POSSIBLE when our addon loads
        if arg1 == "NoobTacoUI" and not addonLoaded then
            addonLoaded = true
            SetEarlyCombatGlobals()
        end

        -- Handle LoadOnDemand Addons for Spellbook/Talents/Professions
        -- We apply the "Quest/Header" font to these.
        local questFontPath = GlobalFontReplacer:GetQuestFontPath()
        if questFontPath then
            if arg1 == "Blizzard_PlayerSpells" then
                local f = _G.PlayerSpellsFrame
                if f then RecursiveApplyFont(f, questFontPath) end
            elseif arg1 == "Blizzard_ClassTalentUI" then
                local f = _G.ClassTalentFrame
                if f then RecursiveApplyFont(f, questFontPath) end
            elseif arg1 == "Blizzard_Professions" then
                local f = _G.ProfessionFrame
                if f then RecursiveApplyFont(f, questFontPath) end
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Full font application (Font Objects, frame traversal, etc.)
        GlobalFontReplacer:Initialize()
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)
