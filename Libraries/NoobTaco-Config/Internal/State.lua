local Lib = LibStub("NoobTaco-Config-1.0")
local ConfigState = Lib.State

ConfigState.ActiveDB = nil
ConfigState.TempConfig = {}
ConfigState.IsDirty = false
ConfigState.OnDirtyChanged = nil -- Callback function

-- Helper to get path from key
local function GetPath(key)
  local path = {}
  for part in string.gmatch(key, "[^.]+") do
    table.insert(path, part)
  end
  return path
end

-- Helper to resolve deep value from table
local function GetDeepValue(tbl, key)
  if not tbl then return nil end
  if not string.find(key, "%.") then return tbl[key] end

  local current = tbl
  local path = GetPath(key)
  for i = 1, #path do
    if type(current) ~= "table" then return nil end
    current = current[path[i]]
  end
  return current
end

-- Helper to set deep value in table
local function SetDeepValue(tbl, key, value)
  if not tbl then return end
  if not string.find(key, "%.") then
    tbl[key] = value
    return
  end

  local current = tbl
  local path = GetPath(key)
  for i = 1, #path - 1 do
    local part = path[i]
    if type(current[part]) ~= "table" then
      current[part] = {}
    end
    current = current[part]
  end
  current[path[#path]] = value
end

function ConfigState:Initialize(dbTable)
  self.ActiveDB = dbTable
  self.TempConfig = {}
  self.IsDirty = false

  -- Deep copy ActiveDB to TempConfig is simplified here.
  -- We just copy top-level keys. Nested paths will still be handled via dot notation.
  self:Revert()
end

function ConfigState:SetValue(key, value)
  if not self.ActiveDB then return end

  self.TempConfig[key] = value
  self:CheckDirtyState()
end

function ConfigState:GetValue(key)
  if self.TempConfig and self.TempConfig[key] ~= nil then
    return self.TempConfig[key]
  end
  return GetDeepValue(self.ActiveDB, key)
end

function ConfigState:CheckDirtyState()
  local wasDirty = self.IsDirty
  self.IsDirty = false

  for k, v in pairs(self.TempConfig) do
    if GetDeepValue(self.ActiveDB, k) ~= v then
      self.IsDirty = true
      break
    end
  end

  if self.IsDirty ~= wasDirty and self.OnDirtyChanged then
    self.OnDirtyChanged(self.IsDirty)
  end
end

function ConfigState:Commit()
  if not self.ActiveDB then return end

  for k, v in pairs(self.TempConfig) do
    SetDeepValue(self.ActiveDB, k, v)
  end

  self.IsDirty = false
  if self.OnDirtyChanged then self.OnDirtyChanged(false) end

  -- Trigger global update event if needed
  if Lib.OnConfigChanged then
    Lib.OnConfigChanged()
  end
end

function ConfigState:Revert()
  if not self.ActiveDB then return end

  -- Wipe Temp
  wipe(self.TempConfig)

  -- We don't need to copy everything because GetValue handles fallback to ActiveDB
  self.IsDirty = false
  if self.OnDirtyChanged then self.OnDirtyChanged(false) end
end
