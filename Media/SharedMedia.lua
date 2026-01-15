local addonName, addon = ...
local LSM = LibStub("LibSharedMedia-3.0")

if LSM == nil then
    return
end

local fontPath = "Interface\\AddOns\\" .. addonName .. "\\Media\\Fonts\\"

-- Montserrat
LSM:Register("font", "Montserrat-Black", fontPath .. "Montserrat-Black.ttf")
LSM:Register("font", "Montserrat-Bold", fontPath .. "Montserrat-Bold.ttf")
LSM:Register("font", "Montserrat-Medium", fontPath .. "Montserrat-Medium.ttf")
LSM:Register("font", "Montserrat-Regular", fontPath .. "Montserrat-Regular.ttf")
LSM:Register("font", "Montserrat-SemiBold", fontPath .. "Montserrat-SemiBold.ttf")

-- Aliases with spaces
LSM:Register("font", "Montserrat Black", fontPath .. "Montserrat-Black.ttf")
LSM:Register("font", "Montserrat Bold", fontPath .. "Montserrat-Bold.ttf")
LSM:Register("font", "Montserrat Medium", fontPath .. "Montserrat-Medium.ttf")
LSM:Register("font", "Montserrat Regular", fontPath .. "Montserrat-Regular.ttf")
LSM:Register("font", "Montserrat SemiBold", fontPath .. "Montserrat-SemiBold.ttf")

-- Roboto
LSM:Register("font", "Roboto-Black", fontPath .. "Roboto-Black.ttf")
LSM:Register("font", "Roboto-Bold", fontPath .. "Roboto-Bold.ttf")
LSM:Register("font", "Roboto-Medium", fontPath .. "Roboto-Medium.ttf")
LSM:Register("font", "Roboto-Regular", fontPath .. "Roboto-Regular.ttf")

-- Aliases with spaces
LSM:Register("font", "Roboto Black", fontPath .. "Roboto-Black.ttf")
LSM:Register("font", "Roboto Bold", fontPath .. "Roboto-Bold.ttf")
LSM:Register("font", "Roboto Medium", fontPath .. "Roboto-Medium.ttf")
LSM:Register("font", "Roboto Regular", fontPath .. "Roboto-Regular.ttf")

-- Lato
LSM:Register("font", "Lato-Black", fontPath .. "Lato-Black.ttf")
LSM:Register("font", "Lato-Bold", fontPath .. "Lato-Bold.ttf")
LSM:Register("font", "Lato-Regular", fontPath .. "Lato-Regular.ttf")

-- Dosis
LSM:Register("font", "Dosis-Bold", fontPath .. "Dosis-Bold.ttf")
LSM:Register("font", "Dosis-ExtraBold", fontPath .. "Dosis-ExtraBold.ttf")
LSM:Register("font", "Dosis-ExtraLight", fontPath .. "Dosis-ExtraLight.ttf")
LSM:Register("font", "Dosis-Light", fontPath .. "Dosis-Light.ttf")
LSM:Register("font", "Dosis-Medium", fontPath .. "Dosis-Medium.ttf")
LSM:Register("font", "Dosis-Regular", fontPath .. "Dosis-Regular.ttf")
LSM:Register("font", "Dosis-SemiBold", fontPath .. "Dosis-SemiBold.ttf")

-- Exo2
LSM:Register("font", "Exo2-Black", fontPath .. "Exo2-Black.ttf")
LSM:Register("font", "Exo2-Bold", fontPath .. "Exo2-Bold.ttf")
LSM:Register("font", "Exo2-ExtraBold", fontPath .. "Exo2-ExtraBold.ttf")
LSM:Register("font", "Exo2-Medium", fontPath .. "Exo2-Medium.ttf")
LSM:Register("font", "Exo2-Regular", fontPath .. "Exo2-Regular.ttf")
LSM:Register("font", "Exo2-SemiBold", fontPath .. "Exo2-SemiBold.ttf")

-- Mukta
LSM:Register("font", "Mukta-Bold", fontPath .. "Mukta-Bold.ttf")
LSM:Register("font", "Mukta-ExtraBold", fontPath .. "Mukta-ExtraBold.ttf")
LSM:Register("font", "Mukta-ExtraLight", fontPath .. "Mukta-ExtraLight.ttf")
LSM:Register("font", "Mukta-Light", fontPath .. "Mukta-Light.ttf")
LSM:Register("font", "Mukta-Medium", fontPath .. "Mukta-Medium.ttf")
LSM:Register("font", "Mukta-Regular", fontPath .. "Mukta-Regular.ttf")
LSM:Register("font", "Mukta-SemiBold", fontPath .. "Mukta-SemiBold.ttf")

-- Poppins
LSM:Register("font", "Poppins-Black", fontPath .. "Poppins-Black.ttf")
LSM:Register("font", "Poppins-Bold", fontPath .. "Poppins-Bold.ttf")
LSM:Register("font", "Poppins-ExtraBold", fontPath .. "Poppins-ExtraBold.ttf")
LSM:Register("font", "Poppins-ExtraLight", fontPath .. "Poppins-ExtraLight.ttf")
LSM:Register("font", "Poppins-Italic", fontPath .. "Poppins-Italic.ttf")
LSM:Register("font", "Poppins-Medium", fontPath .. "Poppins-Medium.ttf")
LSM:Register("font", "Poppins-Regular", fontPath .. "Poppins-Regular.ttf")
LSM:Register("font", "Poppins-SemiBold", fontPath .. "Poppins-SemiBold.ttf")
LSM:Register("font", "Poppins-Thin", fontPath .. "Poppins-Thin.ttf")

-- Aliases with spaces for backward compatibility
LSM:Register("font", "Poppins Black", fontPath .. "Poppins-Black.ttf")
LSM:Register("font", "Poppins Bold", fontPath .. "Poppins-Bold.ttf")
LSM:Register("font", "Poppins ExtraBold", fontPath .. "Poppins-ExtraBold.ttf")
LSM:Register("font", "Poppins ExtraLight", fontPath .. "Poppins-ExtraLight.ttf")
LSM:Register("font", "Poppins Italic", fontPath .. "Poppins-Italic.ttf")
LSM:Register("font", "Poppins Medium", fontPath .. "Poppins-Medium.ttf")
LSM:Register("font", "Poppins Regular", fontPath .. "Poppins-Regular.ttf")
LSM:Register("font", "Poppins SemiBold", fontPath .. "Poppins-SemiBold.ttf")
LSM:Register("font", "Poppins Thin", fontPath .. "Poppins-Thin.ttf")

-- Audio
local audioPath = "Interface\\AddOns\\" .. addonName .. "\\Media\\Audio\\"
LSM:Register("sound", "NT_NPC", audioPath .. "nt_sd_npc.ogg")

-- Status Bar Textures - NoobTaco Theme
local texturePath = "Interface\\AddOns\\" .. addonName .. "\\Media\\Textures\\"
LSM:Register("statusbar", "NT_Nord00", texturePath .. "NT_nord0.tga")
LSM:Register("statusbar", "NT_Nord00_Gradient", texturePath .. "NT_nord0_grd.tga")
LSM:Register("statusbar", "NT_Nord01", texturePath .. "NT_nord1.tga")
LSM:Register("statusbar", "NT_Nord01_Gradient", texturePath .. "NT_nord1_grd.tga")
LSM:Register("statusbar", "NT_Nord02", texturePath .. "NT_nord2.tga")
LSM:Register("statusbar", "NT_Nord02_Gradient", texturePath .. "NT_nord2_grd.tga")
LSM:Register("statusbar", "NT_Nord03", texturePath .. "NT_nord3.tga")
LSM:Register("statusbar", "NT_Nord03_Gradient", texturePath .. "NT_nord3_grd.tga")
LSM:Register("statusbar", "NT_Nord04", texturePath .. "NT_nord4.tga")
LSM:Register("statusbar", "NT_Nord04_Gradient", texturePath .. "NT_nord4_grd.tga")
LSM:Register("statusbar", "NT_Nord05", texturePath .. "NT_nord5.tga")
LSM:Register("statusbar", "NT_Nord05_Gradient", texturePath .. "NT_nord5_grd.tga")
LSM:Register("statusbar", "NT_Nord06", texturePath .. "NT_nord6.tga")
LSM:Register("statusbar", "NT_Nord06_Gradient", texturePath .. "NT_nord6_grd.tga")
LSM:Register("statusbar", "NT_Nord07", texturePath .. "NT_nord7.tga")
LSM:Register("statusbar", "NT_Nord07_Gradient", texturePath .. "NT_nord7_grd.tga")
LSM:Register("statusbar", "NT_Nord08", texturePath .. "NT_nord8.tga")
LSM:Register("statusbar", "NT_Nord08_Gradient", texturePath .. "NT_nord8_grd.tga")
LSM:Register("statusbar", "NT_Nord09", texturePath .. "NT_nord9.tga")
LSM:Register("statusbar", "NT_Nord09_Gradient", texturePath .. "NT_nord9_grd.tga")
LSM:Register("statusbar", "NT_Nord10", texturePath .. "NT_nord10.tga")
LSM:Register("statusbar", "NT_Nord10_Gradient", texturePath .. "NT_nord10_grd.tga")
LSM:Register("statusbar", "NT_Nord11", texturePath .. "NT_nord11.tga")
LSM:Register("statusbar", "NT_Nord11_Gradient", texturePath .. "NT_nord11_grd.tga")
LSM:Register("statusbar", "NT_Nord12", texturePath .. "NT_nord12.tga")
LSM:Register("statusbar", "NT_Nord12_Gradient", texturePath .. "NT_nord12_grd.tga")
LSM:Register("statusbar", "NT_Nord13", texturePath .. "NT_nord13.tga")
LSM:Register("statusbar", "NT_Nord13_Gradient", texturePath .. "NT_nord13_grd.tga")
LSM:Register("statusbar", "NT_Nord14", texturePath .. "NT_nord14.tga")
LSM:Register("statusbar", "NT_Nord14_Gradient", texturePath .. "NT_nord14_grd.tga")
LSM:Register("statusbar", "NT_Nord15", texturePath .. "NT_nord15.tga")
LSM:Register("statusbar", "NT_Nord15_Gradient", texturePath .. "NT_nord15_grd.tga")
