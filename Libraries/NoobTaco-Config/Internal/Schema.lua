local Lib = LibStub("NoobTaco-Config-1.0")
local Schema = Lib.Schema

local VALID_TYPES = {
  ["group"] = true,
  ["checkbox"] = true,
  ["slider"] = true,
  ["colorpicker"] = true,
  ["dropdown"] = true,
  ["button"] = true,
  ["header"] = true,
  ["alert"] = true, -- New alert type
  ["row"] = true,   -- Layout helper
  ["description"] = true,
  ["editbox"] = true,
  ["callout"] = true, -- Complex alert with button
}

function Schema:Validate(definition)
  if type(definition) ~= "table" then
    return false, "Schema definition must be a table."
  end

  if definition.type and not VALID_TYPES[definition.type] then
    return false, "Invalid schema type: " .. tostring(definition.type)
  end

  -- Required ID check for interactive types
  local interactiveTypes = {
    ["checkbox"] = true,
    ["slider"] = true,
    ["dropdown"] = true,
    ["editbox"] = true,
    ["colorpicker"] = true,
    ["media"] = true,
  }

  if definition.type and interactiveTypes[definition.type] and not definition.id then
    return false, string.format("Type '%s' requires an 'id' field.", definition.type)
  end

  -- Recursive check for children
  if definition.children then
    for i, child in ipairs(definition.children) do
      local isValid, err = self:Validate(child)
      if not isValid then
        return false, string.format("Child index %d error: %s", i, err)
      end
    end
  end

  return true
end

function Schema:NewNode(itemType, id, label)
  return {
    type = itemType,
    id = id,
    label = label
  }
end
