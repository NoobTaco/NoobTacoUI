--[[
    NoobTaco-Config
    Root entry point for the configuration library.
]]

local MAJOR, MINOR = "NoobTaco-Config-1.0", 4
local Lib, _ = LibStub:NewLibrary(MAJOR, MINOR)

if not Lib then
    _G.NOOBTACO_CONFIG_SHOULD_LOAD = false
    return
end

_G.NOOBTACO_CONFIG_SHOULD_LOAD = true

-- Initialize internal module references on the library object
Lib.Schema = Lib.Schema or {}
Lib.State = Lib.State or {}
Lib.Layout = Lib.Layout or {}
Lib.Renderer = Lib.Renderer or {}
Lib.Theme = Lib.Theme or {}

-- Media Path Helper (Dynamic detection for Standalone vs Embedded)
local addonName, _ = ...
local mediaPath = "Interface\\AddOns\\NoobTaco-Config\\Media"

-- If we are embedded (addonName will be NoobTacoUI or similar)
if addonName and addonName ~= "NoobTaco-Config" then
    mediaPath = "Interface\\AddOns\\" .. addonName .. "\\Libraries\\NoobTaco-Config\\Media"
end

Lib.Media = mediaPath

-- Public API
function Lib:Register(_, _, dbTable)
    self.State:Initialize(dbTable)
    -- Registration logic...
end
