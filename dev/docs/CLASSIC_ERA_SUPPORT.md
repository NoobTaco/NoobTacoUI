# Classic Era Support Implementation

## Overview
Added version detection and UI adaptations to properly support Classic Era (1.x) where collection notifications are not available.

## Changes Made

### 1. Version Detection Functions
Added comprehensive version detection at the top of `ConfigMenu.lua`:

```lua
-- Version detection for feature availability
local function GetWoWVersion()
local function IsClassicEra()
local function IsWrath()
local function IsRetail()
local function AreCollectionsAvailable()
```

### 2. Database Initialization Changes
- **Collections Database**: Only initialized if `AreCollectionsAvailable()` returns true
- **Version Message**: Console message indicates when collections are not available
- **Graceful Handling**: No errors or attempts to access collection APIs in Classic Era

### 3. UI Interface Adaptations

#### Audio Settings Panel
- **Conditional Display**: Audio Settings sidebar button only shown in retail (collections available)
- **Dynamic Positioning**: General Settings button positions below About when Audio is hidden
- **Clean Interface**: No orphaned UI elements or broken references

#### Minimap Button Changes
- **Tooltip Updates**: Right-click collection toggle only shown when available
- **Click Behavior**: Right-click shows appropriate message in Classic Era
- **Feature Detection**: Graceful degradation without functionality loss

#### Addon Compartment Integration
- **Tooltip Adaptation**: Collection toggle instruction only shown when available
- **Click Handling**: Appropriate messages for unsupported versions
- **Consistent Behavior**: Same logic as minimap button

### 4. Enhanced User Communication

#### About Panel
- **Version Notice**: Displays compatibility information for current version
- **Clear Messaging**: Explains which features require retail WoW
- **Color Coding**: Uses Nord orange (`D08770`) for version notes

#### General Settings Panel
- **Feature Availability**: Description includes version-specific notes
- **Context Awareness**: Users understand what features are available
- **Support Information**: Clear indication of retail requirements

#### Console Messages
- **Feature Requests**: Commands show appropriate version messages
- **User Feedback**: Clear explanations when features aren't available
- **Helpful Guidance**: Indicates what's needed for full functionality

### 5. Slash Command Updates

#### `/ntcc` Command
- **Version Check**: Prevents execution in unsupported versions
- **Clear Messaging**: Explains retail requirement
- **No Errors**: Graceful handling instead of broken functionality

#### `/ntminimap` Command
- **Maintained Functionality**: All positioning features work across versions
- **Consistent Behavior**: No version-specific restrictions needed

## Version Support Matrix

| Feature | Classic Era | Wrath | Retail |
|---------|------------|-------|--------|
| Media Assets | ✅ Full | ✅ Full | ✅ Full |
| Minimap Button | ✅ Full | ✅ Full | ✅ Full |
| Drag Positioning | ✅ Full | ✅ Full | ✅ Full |
| General Settings | ✅ Full | ✅ Full | ✅ Full |
| Collection Notifications | ❌ N/A | ❌ N/A | ✅ Full |
| Audio Settings Panel | ❌ Hidden | ❌ Hidden | ✅ Shown |

## Technical Implementation

### Feature Detection Logic
```lua
local function AreCollectionsAvailable()
  -- Collections (pets, mounts, toys, transmog) were added in later expansions
  -- Classic Era (1.x): No collections
  -- Wrath (3.x): Limited collections (mounts and pets exist but no collection UI)
  -- Retail (10.x+): Full collections support
  return IsRetail()
end
```

### Conditional UI Creation
```lua
-- Audio settings button (only show if collections are available)
local audioButton
if AreCollectionsAvailable() then
  audioButton = CreateEnhancedCategoryButton(sidebar, "Audio Settings", addon.UIAssets.Icons.Audio)
  -- ... audio button creation and positioning
end

-- Dynamic positioning for other elements
if AreCollectionsAvailable() then
  generalButton:SetPoint("TOPLEFT", audioButton, "BOTTOMLEFT", 0, -4)
else
  generalButton:SetPoint("TOPLEFT", aboutButton, "BOTTOMLEFT", 0, -4)
end
```

### Version-Aware Messaging
```lua
if not AreCollectionsAvailable() then
  print("|cFF16C3F2NoobTacoUI-Media|r: Collection Notifications not available in " .. 
        (IsClassicEra() and "Classic Era" or "this version"))
end
```

## User Experience

### Classic Era Users See:
- **Clean Interface**: No broken or non-functional elements
- **Appropriate Messaging**: Clear explanations for missing features
- **Full Core Functionality**: All media assets and positioning work perfectly
- **Consistent Design**: Same Nord-themed appearance across all versions

### Retail Users See:
- **Complete Feature Set**: All functionality including collection notifications
- **Full Audio Panel**: Complete configuration interface
- **Enhanced Tooltips**: Full right-click functionality documented

## Benefits

### For Classic Era Players
- **No Confusion**: Clear understanding of available features
- **No Errors**: Smooth operation without broken functionality
- **Full Media Access**: Complete font, texture, and audio library
- **Professional Experience**: Well-integrated interface adaptation

### For Developers
- **Maintainable Code**: Single codebase supports all versions
- **Clear Separation**: Feature availability logic centralized
- **Future-Proof**: Easy to add new version-specific features
- **Debugging**: Clear version context in all user interactions

### For Addon Ecosystem
- **Version Compatibility**: Proper Classic Era support
- **No Dependencies**: Works independently across all versions
- **Resource Sharing**: Media assets available everywhere
- **Standard Compliance**: Follows WoW addon best practices

This implementation ensures NoobTacoUI-Media provides excellent user experience across all World of Warcraft versions while maintaining code clarity and avoiding feature confusion.
