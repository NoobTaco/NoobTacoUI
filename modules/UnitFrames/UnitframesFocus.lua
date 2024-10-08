local NoobTacoUI, E, L, V, P, G = unpack(select(2, ...))

-- CHANGELOG --------------------------------------------------------------------
--[[
    Version 1.5.0 - General improvements
        - Updated the font used for general UI to "Poppins-SemiBold"
        - Adjusted the colors for general UI
        - Increased the font size for general UI
]]
function NoobTacoUI:UnitframeFocus()
    E.db["unitframe"]["units"]["focus"]["aurabar"]["detachedWidth"] = 270
    E.db["unitframe"]["units"]["focus"]["aurabar"]["maxBars"] = 6
    E.db["unitframe"]["units"]["focus"]["buffs"]["anchorPoint"] = "TOPLEFT"
    E.db["unitframe"]["units"]["focus"]["buffs"]["countFont"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["focus"]["buffs"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["buffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["focus"]["buffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["focus"]["buffs"]["priority"] = "Blacklist,Personal,nonPersonal"
    E.db["unitframe"]["units"]["focus"]["buffs"]["yOffset"] = 20
    E.db["unitframe"]["units"]["focus"]["castbar"]["height"] = 30
    E.db["unitframe"]["units"]["focus"]["castbar"]["insideInfoPanel"] = false
    E.db["unitframe"]["units"]["focus"]["castbar"]["overlayOnFrame"] = "Power"
    E.db["unitframe"]["units"]["focus"]["castbar"]["width"] = 200
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["fontOutline"] = "NONE"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["size"] = 20
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["text_format"] = "[health:current-percent]"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["xOffset"] = 5
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetHealth"]["yOffset"] = 0
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["justifyH"] = "CENTER"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["size"] = 20
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["text_format"] = "[difficultycolor][smartlevel]"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["xOffset"] = 125
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetLevel"]["yOffset"] = -35
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["attachTextTo"] = "Frame"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["fontOutline"] = "NONE"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["size"] = 13
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["text_format"] =
        "[name:medium]  [shortclassification]"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["xOffset"] = 0
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetName"]["yOffset"] = 40
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["attachTextTo"] = "Power"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["fontOutline"] = "NONE"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["size"] = 13
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["text_format"] = "[power:current]"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["xOffset"] = 5
    E.db["unitframe"]["units"]["focus"]["customTexts"]["TargetPower"]["yOffset"] = 0
    E.db["unitframe"]["units"]["focus"]["debuffs"]["anchorPoint"] = "TOPLEFT"
    E.db["unitframe"]["units"]["focus"]["debuffs"]["attachTo"] = "BUFFS"
    E.db["unitframe"]["units"]["focus"]["debuffs"]["countFont"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["focus"]["debuffs"]["growthX"] = "RIGHT"
    E.db["unitframe"]["units"]["focus"]["debuffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["focus"]["debuffs"]["numrows"] = 2
    E.db["unitframe"]["units"]["focus"]["debuffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["focus"]["debuffs"]["priority"] =
        "Blacklist,Personal,RaidDebuffs,CCDebuffs,Friendly:Dispellable"
    E.db["unitframe"]["units"]["focus"]["debuffs"]["yOffset"] = 5
    E.db["unitframe"]["units"]["focus"]["disableMouseoverGlow"] = true
    E.db["unitframe"]["units"]["focus"]["disableTargetGlow"] = true
    E.db["unitframe"]["units"]["focus"]["healPrediction"]["absorbStyle"] = "NORMAL"
    E.db["unitframe"]["units"]["focus"]["health"]["attachTextTo"] = "InfoPanel"
    E.db["unitframe"]["units"]["focus"]["health"]["text_format"] = ""
    E.db["unitframe"]["units"]["focus"]["height"] = 60
    E.db["unitframe"]["units"]["focus"]["infoPanel"]["height"] = 20
    E.db["unitframe"]["units"]["focus"]["name"]["attachTextTo"] = "Frame"
    E.db["unitframe"]["units"]["focus"]["name"]["position"] = "BOTTOM"
    E.db["unitframe"]["units"]["focus"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["focus"]["name"]["xOffset"] = 5
    E.db["unitframe"]["units"]["focus"]["name"]["yOffset"] = -85
    E.db["unitframe"]["units"]["focus"]["orientation"] = "RIGHT"
    E.db["unitframe"]["units"]["focus"]["portrait"]["camDistanceScale"] = 1.04
    E.db["unitframe"]["units"]["focus"]["portrait"]["desaturation"] = 0
    E.db["unitframe"]["units"]["focus"]["portrait"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["portrait"]["overlay"] = false
    E.db["unitframe"]["units"]["focus"]["portrait"]["width"] = 55
    E.db["unitframe"]["units"]["focus"]["power"]["attachTextTo"] = "Power"
    E.db["unitframe"]["units"]["focus"]["power"]["height"] = 20
    E.db["unitframe"]["units"]["focus"]["power"]["xOffset"] = -208
    E.db["unitframe"]["units"]["focus"]["width"] = 200
end
