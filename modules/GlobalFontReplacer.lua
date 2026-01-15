local addonName, addon = ...
local GlobalFontReplacer = {}
addon.GlobalFontReplacer = GlobalFontReplacer

local LSM = LibStub("LibSharedMedia-3.0")

-- Luacheck globals for Blizzard frames
-- luacheck: globals PlayerSpellsFrame ClassTalentFrame ProfessionFrame

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
    local interfaceFontPath = LSM:Fetch("font", settings.globalFont or "Poppins-SemiBold")

    local overrides = settings.fontOverrides or {}
    local chatFontPath = LSM:Fetch("font", overrides.chat or settings.globalFont or "Poppins-SemiBold")
    local combatFontPath = LSM:Fetch("font", overrides.combat or settings.globalFont or "Poppins-SemiBold")
    local questFontPath = LSM:Fetch("font", overrides.quester or settings.globalFont or "Poppins-SemiBold")
    local systemFontPath = LSM:Fetch("font", overrides.system or settings.globalFont or "Poppins-SemiBold")

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
                        local finalFlags = flags
                        -- Apply SLUG and FILTER flags to combat-related fonts for Midnight kerning fix
                        if sourceMap[filename] == combatFontPath then
                            local _, _, _, interfaceVersion = GetBuildInfo()
                            local isMidnight = interfaceVersion >= 120000

                            if isMidnight then
                                if not finalFlags or finalFlags == "" then
                                    finalFlags = "SLUG, FILTER"
                                else
                                    if not string.find(finalFlags, "SLUG") then finalFlags = finalFlags .. ", SLUG" end
                                    if not string.find(finalFlags, "FILTER") then finalFlags = finalFlags .. ", FILTER" end
                                end
                            else
                                -- Fallback for Retail/Classic: Use standard OUTLINE if no flags exist
                                if not finalFlags or finalFlags == "" then
                                    finalFlags = "OUTLINE"
                                end
                            end
                        end
                        obj:SetFont(sourceMap[filename], height, finalFlags)

                        -- Apply SetSpacing(0) fallback for combat fonts
                        if sourceMap[filename] == combatFontPath and obj.SetSpacing then
                            obj:SetSpacing(0)
                        end
                    end
                end
            end
        end
    end

    -- 4. Overwrite Global Variables for Combat Text & Nameplates
    -- These are used by the C engine for floating text
    if combatFontPath then
        DAMAGE_TEXT_FONT = combatFontPath
        UNIT_NAME_FONT = combatFontPath
        NAMEPLATE_FONT = combatFontPath
    end
    if interfaceFontPath then
        STANDARD_TEXT_FONT = interfaceFontPath
    end

    -- 5. Manual Overrides for stubborn system fonts
    -- We force these regardless of current font path to ensure we override other addons
    if combatFontPath or interfaceFontPath then
        -- Pure Combat / World targets
        local combatTargets = {
            "CombatTextFont",
            "SystemFont_NamePlateFixed",
            "SystemFont_LargeNamePlateFixed",
            "SystemFont_World",
        }

        -- Large System Headers (Main Menu, etc.)
        -- We'll link these to Combat for now as per current mapping, but split them for future granularity
        local systemTargets = {
            "NumberFont_Shadow_Huge",
            "NumberFont_Shadow_Med",
            "NumberFont_Shadow_Small",
            "SystemFont_Shadow_Huge",
            "SystemFont_Shadow_Huge1",
            "SystemFont_Shadow_Huge2",
            "SystemFont_Shadow_Huge3",
            "SystemFont_Shadow_Huge4",
            "SystemFont_Shadow_Large",
            "SystemFont_Shadow_Med1",
            "SystemFont_Shadow_Med2",
            "SystemFont_Shadow_Med3",
            "SystemFont_Huge1",
            "SystemFont_Huge2",
            "SystemFont_Huge3",         -- Modern Retail SCT
            "SystemFont_Outline_Huge2", -- Modern Retail SCT
        }

        local function ApplyForced(list, fontPath)
            if not fontPath then return end
            for _, name in ipairs(list) do
                local obj = _G[name]
                if obj and obj.SetFont and obj.GetFont then
                    local _, h, _ = obj:GetFont()

                    -- Use SLUG for Midnight, OUTLINE for Retail/Classic
                    local _, _, _, interfaceVersion = GetBuildInfo()
                    local isMidnight = interfaceVersion >= 120000
                    local finalFlags = isMidnight and "SLUG" or "OUTLINE"

                    obj:SetFont(fontPath, h, finalFlags)

                    -- Force SetSpacing(0) to fix "stretching" on modern fonts
                    if obj.SetSpacing then
                        obj:SetSpacing(0)
                    end

                    -- Ensure no shadow for a perfectly clean look
                    if obj.SetShadowOffset then
                        obj:SetShadowOffset(0, 0)
                    end
                end
            end
        end

        ApplyForced(combatTargets, combatFontPath)
        ApplyForced(systemTargets, systemFontPath) -- Decoupled from combatFontPath
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
    -- Apply immediately
    self:ApplyFont()

    -- Re-apply on a slight delay to ensure we override addons like Platynator
    -- that might be applying their own fonts during the same initialization window.
    C_Timer.After(0.5, function()
        self:ApplyFont()
    end)

    -- Second fallback for late-loading nameplate elements
    C_Timer.After(2, function()
        self:ApplyFont()
    end)
end

-- Helper to get Quest Font path for the Event Handler
function GlobalFontReplacer:GetQuestFontPath()
    if NoobTacoUIDB and NoobTacoUIDB.GeneralSettings then
        local settings = NoobTacoUIDB.GeneralSettings
        local overrides = settings.fontOverrides or {}
        local fontName = overrides.quester or settings.globalFont or "Poppins-SemiBold"
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
    local combatFontPath = LSM:Fetch("font", overrides.combat or settings.globalFont or "Poppins-SemiBold")
    if combatFontPath then
        DAMAGE_TEXT_FONT = combatFontPath
    end

    -- Interface/Names fonts
    local interfaceFontPath = LSM:Fetch("font", settings.globalFont or "Poppins-SemiBold")
    if interfaceFontPath then
        UNIT_NAME_FONT = interfaceFontPath
        NAMEPLATE_FONT = interfaceFontPath
        STANDARD_TEXT_FONT = interfaceFontPath
    end

    -- Ensure Combat Text CVars are enabled (Platynator usually does this)
    if GetCVar("floatingCombatTextCombatDamage") == "0" then
        SetCVar("floatingCombatTextCombatDamage", "1")
    end
    if GetCVar("floatingCombatTextCombatHealing") == "0" then
        SetCVar("floatingCombatTextCombatHealing", "1")
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
