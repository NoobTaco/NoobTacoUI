assert(LibStub, "LibDataBroker-1.1 requires LibStub")
assert(LibStub:GetLibrary("CallbackHandler-1.0", true), "LibDataBroker-1.1 requires CallbackHandler-1.0")

local lib, oldminor = LibStub:NewLibrary("LibDataBroker-1.1", 4)
if not lib then return end

-- Lua APIs
local pairs, next, type = pairs, next, type

lib.callbacks = lib.callbacks or LibStub("CallbackHandler-1.0"):New(lib)
lib.attributestorage, lib.namestorage, lib.proxystorage = lib.attributestorage or {}, lib.namestorage or {},
    lib.proxystorage or {}
local attributestorage, namestorage, proxystorage = lib.attributestorage, lib.namestorage, lib.proxystorage

if oldminor and oldminor < 2 then
  lib.domt = {
    __metatable = "access denied",
    __index = function(self, key) return attributestorage[self] and attributestorage[self][key] end,
  }
end

if oldminor and oldminor < 3 then
  lib.domt.__newindex = function(self, key, value)
    if not attributestorage[self] then attributestorage[self] = {} end
    if attributestorage[self][key] == value then return end
    attributestorage[self][key] = value
    local name = namestorage[self]
    if not name then return end
    lib.callbacks:Fire("LibDataBroker_AttributeChanged", name, key, value, self)
    lib.callbacks:Fire("LibDataBroker_AttributeChanged_" .. name, name, key, value, self)
    lib.callbacks:Fire("LibDataBroker_AttributeChanged_" .. name .. "_" .. key, name, key, value, self)
  end
end

if oldminor and oldminor < 4 then
  lib.domt.__tostring = function(self) return namestorage[self] end
end

local domt = lib.domt

function lib:NewDataObject(name, dataobj)
  if self.proxystorage[name] then return end

  if dataobj then
    assert(type(dataobj) == "table", "Invalid dataobj, must be nil or a table")
    self.attributestorage[dataobj] = {}
    for i, v in pairs(dataobj) do
      self.attributestorage[dataobj][i] = v
      dataobj[i] = nil
    end
  end
  dataobj = setmetatable(dataobj or {}, domt)
  self.proxystorage[name], self.namestorage[dataobj] = dataobj, name
  self.callbacks:Fire("LibDataBroker_DataObjectCreated", name, dataobj)
  return dataobj
end

function lib:DataObjectIterator()
  return pairs(self.proxystorage)
end

function lib:GetDataObjectByName(dataobjectname)
  return self.proxystorage[dataobjectname]
end

function lib:GetNameByDataObject(dataobject)
  return self.namestorage[dataobject]
end

local next = pairs(attributestorage)
function lib:Pairs(dataobject_or_name)
  local t = type(dataobject_or_name)
  assert(t == "string" or t == "table", "Usage: lib:Pairs(dataobject_or_name)")

  local dataobj = self.proxystorage[dataobject_or_name] or dataobject_or_name
  assert(attributestorage[dataobj], "Data object not found")

  return next, attributestorage[dataobj], nil
end

local ipairs_iter = ipairs(attributestorage)
function lib:Ipairs(dataobject_or_name)
  local t = type(dataobject_or_name)
  assert(t == "string" or t == "table", "Usage: lib:Ipairs(dataobject_or_name)")

  local dataobj = self.proxystorage[dataobject_or_name] or dataobject_or_name
  assert(attributestorage[dataobj], "Data object not found")

  return ipairs_iter, attributestorage[dataobj], 0
end
