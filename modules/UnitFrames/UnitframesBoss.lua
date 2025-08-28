local NoobTacoUI, E, L, V, P, G = unpack(select(2, ...))

-- CHANGELOG --------------------------------------------------------------------
--[[
    Version 1.5.9 - Boss unit frame improvements
        - Extracted boss unit frame configuration into separate module
        - Updated buff sizes to match global standard of 30
        - Optimized boss unit frame dimensions and spacing
]]
function NoobTacoUI:UnitframeBoss()
    -- Boss frames are only available in MoP Classic and Retail (not Classic, TBC, or Wrath)
    if E.Classic or E.TBC or E.Wrath then
        return
    end

        -- CUSTOM TEXTS
    -- Boss Unit Frame
    if not E.db.unitframe.units.boss.customTexts then
        E.db.unitframe.units.boss.customTexts = {}
    end
    if E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"] == nil then
        E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"] = {}
    end
    if E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"] == nil then
        E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"] = {}
    end

    E.db["unitframe"]["units"]["boss"]["buffs"]["maxDuration"] = 300
    E.db["unitframe"]["units"]["boss"]["buffs"]["sizeOverride"] = 20
    E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = 16
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["color"]["b"] = 0
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["color"]["g"] = 0.85882359743118
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["color"]["r"] = 1
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["colorInterrupted"]["b"] = 0.10196079313755
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["colorInterrupted"]["g"] = 0.10196079313755
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["colorInterrupted"]["r"] = 1
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["colorNoInterrupt"]["b"] = 0.50196081399918
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["colorNoInterrupt"]["g"] = 0.49803924560547
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["colorNoInterrupt"]["r"] = 0.49411767721176
    E.db["unitframe"]["units"]["boss"]["castbar"]["customColor"]["enable"] = true
    E.db["unitframe"]["units"]["boss"]["castbar"]["customTextFont"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["boss"]["castbar"]["height"] = 20
    E.db["unitframe"]["units"]["boss"]["castbar"]["iconAttachedTo"] = "Castbar"
    E.db["unitframe"]["units"]["boss"]["castbar"]["iconSize"] = 43
    E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 175
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["enable"] = true
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["font"] = "Poppins-Regular"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["fontOutline"] = "NONE"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["justifyH"] = "CENTER"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["size"] = 13
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["text_format"] = "[health:current:shortvalue]"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["xOffset"] = 0
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Health"]["yOffset"] = -10
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["enable"] = true
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["font"] = "Poppins-SemiBold"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["fontOutline"] = "NONE"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["justifyH"] = "CENTER"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["size"] = 13
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["text_format"] = "[name:medium]"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["xOffset"] = 0
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Boss-Name"]["yOffset"] = 5
    E.db["unitframe"]["units"]["boss"]["debuffs"]["maxDuration"] = 300
    E.db["unitframe"]["units"]["boss"]["debuffs"]["sizeOverride"] = 20
    E.db["unitframe"]["units"]["boss"]["debuffs"]["yOffset"] = -16
    E.db["unitframe"]["units"]["boss"]["health"]["position"] = "CENTER"
    E.db["unitframe"]["units"]["boss"]["health"]["text_format"] = ""
    E.db["unitframe"]["units"]["boss"]["health"]["xOffset"] = 0
    E.db["unitframe"]["units"]["boss"]["health"]["yOffset"] = -14
    E.db["unitframe"]["units"]["boss"]["height"] = 50
    E.db["unitframe"]["units"]["boss"]["infoPanel"]["height"] = 17
    E.db["unitframe"]["units"]["boss"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["boss"]["name"]["yOffset"] = 5
    E.db["unitframe"]["units"]["boss"]["power"]["enable"] = false
    E.db["unitframe"]["units"]["boss"]["spacing"] = 25
    E.db["unitframe"]["units"]["boss"]["width"] = 175
end
