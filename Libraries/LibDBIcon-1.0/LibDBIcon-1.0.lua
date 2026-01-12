--[[
Name: LibDBIcon-1.0
Revision: $Rev: 33 $
Author(s): Rabbit (rabbit.magtheridon@gmail.com)
Description: Allows addons to easily create a lightweight minimap icon as an alternative to heavy LDB displays.
Dependencies: LibDataBroker-1.1
License: GPL v2 or later
]]

local MAJOR, MINOR = "LibDBIcon-1.0", 33
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

lib.objects = lib.objects or {}
local objects = lib.objects
local ldb = LibStub("LibDataBroker-1.1")

local next, pairs = next, pairs
local CreateFrame = CreateFrame

-- ----------------------------------------------------------------------
-- Default settings
-- ----------------------------------------------------------------------

local defaultCoords = { 0, 1, 0, 1 }
local defaultMinimap = {
  hide = false,
  minimapPos = 220,
  radius = 80,
  lock = false,
}

-- ----------------------------------------------------------------------
-- Internal functions
-- ----------------------------------------------------------------------

local function getAnchors(frame)
  local x, y = frame:GetCenter()
  if not x or not y then return "CENTER" end
  local hhalf = (x > UIParent:GetWidth() * 2 / 3) and "RIGHT" or (x < UIParent:GetWidth() / 3) and "LEFT" or ""
  local vhalf = (y > UIParent:GetHeight() / 2) and "TOP" or "BOTTOM"
  return vhalf .. hhalf, frame, (vhalf == "TOP" and "BOTTOM" or "TOP") .. hhalf
end

local function onDragStart(self)
  self:LockHighlight()
  self.isDragging = true
  self:SetScript("OnUpdate", self.OnUpdate)
end

local function onDragStop(self)
  self:SetScript("OnUpdate", nil)
  self.isDragging = false
  self:UnlockHighlight()
end

local function updatePosition(button, position)
  local angle = math.rad(position or 225)
  local x, y, q = math.cos(angle), math.sin(angle), 1
  if x < 0 then q = q + 1 end
  if y > 0 then q = q + 2 end
  local minimapShape = GetMinimapShape and GetMinimapShape() or "ROUND"
  local quadTable = minimapShape == "ROUND" and { x, y } or minimapShape == "SQUARE" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or minimapShape == "CORNER-TOPRIGHT" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or minimapShape == "CORNER-TOPLEFT" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or minimapShape == "CORNER-BOTTOMRIGHT" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or minimapShape == "CORNER-BOTTOMLEFT" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or minimapShape == "SIDE-LEFT" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or minimapShape == "SIDE-RIGHT" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or minimapShape == "SIDE-TOP" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or minimapShape == "SIDE-BOTTOM" and {
    { x,  y },
    { -x, y },
    { -x, -y },
    { x,  -y },
  } or { x, y }

  if minimapShape == "ROUND" then
    button:SetPoint("CENTER", Minimap, "CENTER", x * 80, y * 80)
  else
    local diagRadius = 103.13708498985 -- math.sqrt(2*(80^2)) - 10
    x = math.max(-80, math.min(x * diagRadius, 80))
    y = math.max(-80, math.min(y * diagRadius, 80))
    button:SetPoint("CENTER", Minimap, "CENTER", x, y)
  end
end

local function onUpdate(self)
  local mx, my = Minimap:GetCenter()
  local px, py = GetCursorPosition()
  local scale = Minimap:GetEffectiveScale()
  px, py = px / scale, py / scale
  local pos = math.deg(math.atan2(py - my, px - mx)) % 360
  self.db.minimapPos = pos
  updatePosition(self, pos)
end

local function onEnter(self)
  if self.isDragging then return end
  local obj = self.dataObject
  if obj.OnTooltipShow then
    GameTooltip:SetOwner(self, "ANCHOR_NONE")
    GameTooltip:SetPoint(getAnchors(self))
    obj.OnTooltipShow(GameTooltip)
    GameTooltip:Show()
  elseif obj.OnEnter then
    obj.OnEnter(self)
  end
end

local function onLeave(self)
  GameTooltip:Hide()
  local obj = self.dataObject
  if obj.OnLeave then
    obj.OnLeave(self)
  end
end

local function onClick(self, button)
  local obj = self.dataObject
  if obj.OnClick then
    obj.OnClick(self, button)
  end
end

local function onMouseDown(self)
  self.isMouseDown = true
  self.icon:UpdateCoord()
end

local function onMouseUp(self)
  self.isMouseDown = false
  self.icon:UpdateCoord()
end

local function updateCoord(self)
  local coords = self:GetParent().dataObject.iconCoords or defaultCoords
  local deltaX, deltaY = 0, 0
  if self:GetParent().isMouseDown then
    deltaX = (coords[2] - coords[1]) * 0.05
    deltaY = (coords[4] - coords[3]) * 0.05
  end
  self:SetTexCoord(coords[1] + deltaX, coords[2] - deltaX, coords[3] + deltaY, coords[4] - deltaY)
end

local function createButton(name, object, db)
  local button = CreateFrame("Button", "LibDBIcon10_" .. name, Minimap)
  button.dataObject = object
  button.db = db
  button:SetFrameStrata("MEDIUM")
  button:SetSize(31, 31)
  button:SetFrameLevel(8)
  button:RegisterForClicks("anyUp")
  button:RegisterForDrag("LeftButton")
  button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight")
  local overlay = button:CreateTexture(nil, "OVERLAY")
  overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
  overlay:SetSize(53, 53)
  overlay:SetPoint("TOPLEFT")
  local background = button:CreateTexture(nil, "BACKGROUND")
  background:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
  background:SetSize(20, 20)
  background:SetPoint("CENTER")
  local icon = button:CreateTexture(nil, "ARTWORK")
  icon:SetSize(17, 17)
  icon:SetPoint("CENTER")
  icon.UpdateCoord = updateCoord
  button.icon = icon

  button:SetScript("OnEnter", onEnter)
  button:SetScript("OnLeave", onLeave)
  button:SetScript("OnClick", onClick)
  if not db.lock then
    button:SetScript("OnDragStart", onDragStart)
    button:SetScript("OnDragStop", onDragStop)
  end
  button:SetScript("OnMouseDown", onMouseDown)
  button:SetScript("OnMouseUp", onMouseUp)
  button.OnUpdate = onUpdate

  lib.objects[name] = button

  if db.hide then button:Hide() else button:Show() end
  updatePosition(button, db.minimapPos)

  -- Update icon immediately
  if object.icon then
    icon:SetTexture(object.icon)
    icon:UpdateCoord()
  end

  -- Check for LDB changes
  ldb.RegisterCallback(lib, "LibDataBroker_AttributeChanged_" .. name .. "_icon", function(event, name, key, value)
    icon:SetTexture(value)
    icon:UpdateCoord()
  end)
  ldb.RegisterCallback(lib, "LibDataBroker_AttributeChanged_" .. name .. "_iconCoords", function(event, name, key, value)
    icon:UpdateCoord()
  end)
end

-- ----------------------------------------------------------------------
-- Public functions
-- ----------------------------------------------------------------------

function lib:Register(name, object, db)
  if not object then
    error("Usage: LibDBIcon:Register(name, object, db)", 2)
  end
  if not db then
    error("Usage: LibDBIcon:Register(name, object, db)", 2)
  end

  -- Set defaults
  for k, v in pairs(defaultMinimap) do
    if db[k] == nil then
      db[k] = v
    end
  end

  createButton(name, object, db)
end

function lib:Show(name)
  if not lib.objects[name] then return end
  lib.objects[name]:Show()
  lib.objects[name].db.hide = nil
end

function lib:Hide(name)
  if not lib.objects[name] then return end
  lib.objects[name]:Hide()
  lib.objects[name].db.hide = true
end

function lib:Refresh(name, db)
  if not lib.objects[name] then return end
  local button = lib.objects[name]
  if db then
    button.db = db
    for k, v in pairs(defaultMinimap) do
      if db[k] == nil then
        db[k] = v
      end
    end
  end
  updatePosition(button, button.db.minimapPos)
  if button.db.hide then button:Hide() else button:Show() end
  if button.db.lock then
    button:SetScript("OnDragStart", nil)
    button:SetScript("OnDragStop", nil)
  else
    button:SetScript("OnDragStart", onDragStart)
    button:SetScript("OnDragStop", onDragStop)
  end
end

function lib:IsRegistered(name)
  return lib.objects[name] ~= nil
end

function lib:GetMinimapButton(name)
  return lib.objects[name]
end
