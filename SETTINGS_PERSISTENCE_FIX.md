# Collection Notifications Settings Persistence Fix

## Problem Identified

The audio settings for Collection Notifications were not persisting between sessions because:

1. **Module Load Order Issue**: ConfigMenu.lua was loading before CollectionNotifications.lua, causing the config menu to try to access CollectionNotifications functions before they were available.

2. **Function Availability**: The config menu was using local helper functions instead of the CollectionNotifications module's proper GetSetting/SetSetting functions.

3. **Initialization Race Condition**: Both modules were trying to initialize the same settings table with potential conflicts.

## Fixes Applied

### 1. Fixed Module Load Order (`load_modules.xml`)
```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/">
	<Script file="version.lua"/>
	<Script file="CollectionNotifications.lua"/>  <!-- Now loads first -->
	<Script file="ConfigMenu.lua"/>                <!-- Now loads second -->
</Ui>
```

### 2. Updated Config Menu to Use Module Functions
Changed the config menu helper functions to properly use the CollectionNotifications module:

```lua
local function GetCollectionSetting(key)
  if addon.CollectionNotifications and addon.CollectionNotifications.GetSetting then
    return addon.CollectionNotifications.GetSetting(key)
  else
    -- Fallback for edge cases
    return NoobTacoDB.CollectionNotifications[key]
  end
end

local function SetCollectionSetting(key, value)
  if addon.CollectionNotifications and addon.CollectionNotifications.SetSetting then
    addon.CollectionNotifications.SetSetting(key, value)
  else
    -- Fallback for edge cases
    NoobTacoDB.CollectionNotifications[key] = value
  end
end
```

### 3. Enhanced Database Initialization
Added better initialization with logging and safety checks:

- More robust ADDON_LOADED event handling
- Added PLAYER_LOGOUT event for extra safety
- Better default value handling
- Debug logging to track initialization

### 4. Added Debug Command
Added `/ntdebug` command to troubleshoot settings issues:
- Shows if NoobTacoDB exists
- Displays current settings values
- Checks if modules are properly loaded

## Testing Steps

1. **Login Test**: 
   - Change some sound settings
   - Logout completely
   - Login and verify settings are preserved

2. **Character Test**:
   - Change settings on one character
   - Switch characters
   - Verify settings are account-wide (same on all characters)

3. **Debug Test**:
   - Use `/ntdebug` to check current state
   - Use `/ntmcollection status` to verify module integration

## Expected Behavior After Fix

✅ **Settings Persist**: Audio dropdown selections save between sessions
✅ **Account-Wide**: Settings shared across all characters
✅ **Proper Integration**: Config menu uses CollectionNotifications module functions
✅ **No Overwrites**: Modules don't conflict during initialization
✅ **Debug Visibility**: Can troubleshoot issues with `/ntdebug`

## Commands for Testing

- `/ntconfig` - Open config menu
- `/ntcc` - Direct to Collection Notifications
- `/ntdebug` - Debug current settings state
- `/ntmcollection status` - Check module status
- `/ntmcollection test` - Test all sounds

The settings should now properly persist across sessions and characters!
