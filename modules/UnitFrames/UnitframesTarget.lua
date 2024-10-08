local NoobTacoUI, E, L, V, P, G = unpack(select(2, ...))

-- CHANGELOG --------------------------------------------------------------------
--[[
    Version 1.5.0 - General improvements
        - Updated the font used for general UI to "Poppins-SemiBold"
        - Adjusted the colors for general UI
        - Increased the font size for general UI
]]
function NoobTacoUI:UnitframeTarget()
    E.db["unitframe"]["units"]["target"]["buffs"]["anchorPoint"] = "TOPLEFT"
    E.db["unitframe"]["units"]["target"]["buffs"]["attachTo"] = "FRAME"
    E.db["unitframe"]["units"]["target"]["buffs"]["countFont"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["target"]["buffs"]["growthX"] = "RIGHT"
    E.db["unitframe"]["units"]["target"]["buffs"]["yOffset"] = 20
    E.db["unitframe"]["units"]["target"]["castbar"]["height"] = 30
    E.db["unitframe"]["units"]["target"]["castbar"]["overlayOnFrame"] = "Power"
    E.db["unitframe"]["units"]["target"]["castbar"]["width"] = 200
    -- Updated 8-19-24
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["fontOutline"] = "NONE"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["size"] = 15
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["text_format"] =
        "[health:current-percent:shortvalue]"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["xOffset"] = 5
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetHealth"]["yOffset"] = -10
    --
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["justifyH"] = "CENTER"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["size"] = 20
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["text_format"] = "[difficultycolor][smartlevel]"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["xOffset"] = 125
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetLevel"]["yOffset"] = -35
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["attachTextTo"] = "Frame"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["fontOutline"] = "NONE"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["size"] = 13
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["text_format"] =
        "[name:medium]  [shortclassification]"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["xOffset"] = 0
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetName"]["yOffset"] = 40
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["attachTextTo"] = "Power"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["fontOutline"] = "NONE"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["size"] = 13
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["text_format"] = "[power:current]"
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["xOffset"] = 5
    E.db["unitframe"]["units"]["target"]["customTexts"]["TargetPower"]["yOffset"] = 0
    E.db["unitframe"]["units"]["target"]["debuffs"]["anchorPoint"] = "TOPLEFT"
    E.db["unitframe"]["units"]["target"]["debuffs"]["attachTo"] = "BUFFS"
    E.db["unitframe"]["units"]["target"]["debuffs"]["countFont"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["target"]["debuffs"]["growthX"] = "RIGHT"
    E.db["unitframe"]["units"]["target"]["debuffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["target"]["debuffs"]["numrows"] = 3
    E.db["unitframe"]["units"]["target"]["debuffs"]["perrow"] = 6
    E.db["unitframe"]["units"]["target"]["debuffs"]["sizeOverride"] = 32
    E.db["unitframe"]["units"]["target"]["debuffs"]["yOffset"] = 5
    E.db["unitframe"]["units"]["target"]["fader"]["casting"] = true
    E.db["unitframe"]["units"]["target"]["fader"]["combat"] = true
    E.db["unitframe"]["units"]["target"]["fader"]["enable"] = false
    E.db["unitframe"]["units"]["target"]["fader"]["health"] = true
    E.db["unitframe"]["units"]["target"]["fader"]["hover"] = true
    E.db["unitframe"]["units"]["target"]["fader"]["playertarget"] = true
    E.db["unitframe"]["units"]["target"]["fader"]["power"] = true
    E.db["unitframe"]["units"]["target"]["fader"]["range"] = false
    E.db["unitframe"]["units"]["target"]["fader"]["vehicle"] = true
    E.db["unitframe"]["units"]["target"]["health"]["text_format"] = ""
    E.db["unitframe"]["units"]["target"]["height"] = 60
    E.db["unitframe"]["units"]["target"]["name"]["attachTextTo"] = "Frame"
    E.db["unitframe"]["units"]["target"]["name"]["position"] = "BOTTOM"
    E.db["unitframe"]["units"]["target"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["target"]["name"]["xOffset"] = 5
    E.db["unitframe"]["units"]["target"]["name"]["yOffset"] = -85
    E.db["unitframe"]["units"]["target"]["portrait"]["camDistanceScale"] = 1.04
    E.db["unitframe"]["units"]["target"]["portrait"]["desaturation"] = 0
    E.db["unitframe"]["units"]["target"]["portrait"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["portrait"]["overlay"] = false
    E.db["unitframe"]["units"]["target"]["portrait"]["width"] = 55
    E.db["unitframe"]["units"]["target"]["power"]["attachTextTo"] = "Power"
    E.db["unitframe"]["units"]["target"]["power"]["detachFromFrame"] = false
    E.db["unitframe"]["units"]["target"]["power"]["height"] = 20
    E.db["unitframe"]["units"]["target"]["power"]["text_format"] = ""
    E.db["unitframe"]["units"]["target"]["power"]["xOffset"] = -208
    E.db["unitframe"]["units"]["target"]["pvpIcon"]["anchorPoint"] = "BOTTOMRIGHT"
    E.db["unitframe"]["units"]["target"]["pvpIcon"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["pvpIcon"]["scale"] = 1.3
    E.db["unitframe"]["units"]["target"]["pvpIcon"]["xOffset"] = 77
    E.db["unitframe"]["units"]["target"]["pvpIcon"]["yOffset"] = 4
    E.db["unitframe"]["units"]["target"]["width"] = 200
end
