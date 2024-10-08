local NoobTacoUI, E, L, V, P, G = unpack(select(2, ...))

-- CHANGELOG --------------------------------------------------------------------
--[[
    Version 1.5.0 - General improvements
        - Updated the font used for general UI to "Poppins-SemiBold"
        - Adjusted the colors for general UI
        - Increased the font size for general UI
]]
function NoobTacoUI:UnitframeRaid1()
    E.db["unitframe"]["units"]["raid1"]["buffIndicator"]["enable"] = true
    E.db["unitframe"]["units"]["raid1"]["buffIndicator"]["size"] = 10
    E.db["unitframe"]["units"]["raid1"]["buffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["anchorPoint"] = "TOP"
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["attachTo"] = "FRAME"
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["clickThrough"] = true
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["countFont"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["enable"] = true
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["numrows"] = 2
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["perrow"] = 3
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["sizeOverride"] = 18
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["xOffset"] = 0
    E.db["unitframe"]["units"]["raid1"]["debuffs"]["yOffset"] = -40
    E.db["unitframe"]["units"]["raid1"]["growthDirection"] = "RIGHT_UP"
    E.db["unitframe"]["units"]["raid1"]["healPrediction"]["enable"] = true
    E.db["unitframe"]["units"]["raid1"]["health"]["position"] = "CENTER"
    E.db["unitframe"]["units"]["raid1"]["health"]["text_format"] = "[health:current-percent]"
    E.db["unitframe"]["units"]["raid1"]["health"]["xOffset"] = 0
    E.db["unitframe"]["units"]["raid1"]["health"]["yOffset"] = -10
    E.db["unitframe"]["units"]["raid1"]["height"] = 45
    E.db["unitframe"]["units"]["raid1"]["infoPanel"]["enable"] = false
    E.db["unitframe"]["units"]["raid1"]["name"]["attachTextTo"] = "Frame"
    E.db["unitframe"]["units"]["raid1"]["name"]["position"] = "CENTER"
    E.db["unitframe"]["units"]["raid1"]["name"]["text_format"] = "[name:veryshort] [difficultycolor][smartlevel]"
    E.db["unitframe"]["units"]["raid1"]["name"]["yOffset"] = 10
    E.db["unitframe"]["units"]["raid1"]["numGroups"] = 5
    E.db["unitframe"]["units"]["raid1"]["power"]["height"] = 10
    E.db["unitframe"]["units"]["raid1"]["power"]["position"] = "RIGHT"
    E.db["unitframe"]["units"]["raid1"]["power"]["yOffset"] = 0
    E.db["unitframe"]["units"]["raid1"]["raidRoleIcons"]["yOffset"] = -2
    E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["size"] = 20
    E.db["unitframe"]["units"]["raid1"]["rdebuffs"]["yOffset"] = 5
    E.db["unitframe"]["units"]["raid1"]["readycheckIcon"]["position"] = "TOPRIGHT"
    E.db["unitframe"]["units"]["raid1"]["readycheckIcon"]["size"] = 30
    E.db["unitframe"]["units"]["raid1"]["readycheckIcon"]["yOffset"] = 0
    E.db["unitframe"]["units"]["raid1"]["resurrectIcon"]["attachTo"] = "BOTTOMRIGHT"
    E.db["unitframe"]["units"]["raid1"]["resurrectIcon"]["size"] = 40
    E.db["unitframe"]["units"]["raid1"]["roleIcon"]["combatHide"] = true
    E.db["unitframe"]["units"]["raid1"]["roleIcon"]["damager"] = false
    E.db["unitframe"]["units"]["raid1"]["roleIcon"]["size"] = 12
    E.db["unitframe"]["units"]["raid1"]["verticalSpacing"] = -1
    E.db["unitframe"]["units"]["raid1"]["verticalSpacing"] = 2
    E.db["unitframe"]["units"]["raid1"]["visibility"] = "[@raid6,noexists][@raid26,exists] hide;show"
    E.db["unitframe"]["units"]["raid1"]["width"] = 90
end
