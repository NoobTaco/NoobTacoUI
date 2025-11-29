-- Simple test to verify Collection Notifications config integration
-- This is just for testing purposes during development

print("Testing NoobTacoUI Collection Notifications Config Integration")

-- Test that the audio files are properly registered
local LSM = LibStub and LibStub("LibSharedMedia-3.0")
if LSM then
  local sounds = {
    "NT_InfussionOfLight",
    "NT_Chest",
    "NT_Mount",
    "NT_NPC",
    "NT_Group",
    "NT_Collection"
  }

  print("Available sounds:")
  for _, sound in ipairs(sounds) do
    local file = LSM:Fetch("sound", sound, true)
    if file then
      print("  ✓ " .. sound .. " -> " .. file)
    else
      print("  ✗ " .. sound .. " (not found)")
    end
  end
else
  print("LibSharedMedia-3.0 not available")
end

-- Test that the addon structure is available
if _G.NoobTacoUIAddon then
  print("✓ NoobTacoUIAddon global is available")

  if _G.NoobTacoUIAddon.CollectionNotifications then
    print("✓ CollectionNotifications module is loaded")

    local cn = _G.NoobTacoUIAddon.CollectionNotifications
    print("  Available functions:")
    for k, v in pairs(cn) do
      if type(v) == "function" then
        print("    - " .. k)
      end
    end
  else
    print("✗ CollectionNotifications module not loaded")
  end

  if _G.NoobTacoUIAddon.ShowConfigMenu then
    print("✓ ShowConfigMenu function is available")
  else
    print("✗ ShowConfigMenu function not available")
  end
else
  print("✗ NoobTacoUIAddon global not available")
end

print("Test complete.")
