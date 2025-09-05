# Collection Notifications Configuration

This document describes the Collection Notifications configuration system that has been integrated into the NoobTacoUI-Media config menu.

## Features Implemented

### 1. Section Header
- Clear "Collection Notifications" heading in the config menu
- Located under the Audio category

### 2. Global Enable Toggle
- Master switch to enable/disable all collection notifications
- When disabled, no collection events will trigger notifications
- Automatically registers/unregisters event handlers

### 3. Individual Collection Type Toggles
- **New Pet Notifications**: Triggers when you collect a new pet species (not duplicates)
- **New Mount Notifications**: Triggers when you learn a new mount
- **New Toy Notifications**: Triggers when you add a toy to your collection  
- **Transmog Notifications**: Triggers when you unlock new transmog appearances
- **Show Chat Messages**: Controls whether notifications also appear as chat messages

### 4. Audio File Selection
Each collection type has its own sound dropdown with the following options:
- **Infusion of Light**: Magical, uplifting sound
- **Chest**: Classic treasure chest opening sound
- **Mount**: Mount-specific notification sound
- **NPC**: NPC interaction sound
- **Group**: Group/social interaction sound
- **Collection**: General collection sound

### 5. Test Functionality
- Each sound dropdown has a "Test" button to preview the selected audio
- Allows immediate feedback when choosing sounds
- Uses the actual notification system for authentic preview

### 6. Preview Section
- Detailed description of what the Collection Notifications module does
- Explains each notification type and when they trigger
- Provides guidance on customization options

## Slash Commands

### Config Menu Access
- `/ntconfig` or `/ntc` - Opens the main configuration menu
- `/ntcollectionconfig` or `/ntcc` - Opens config menu directly to Collection Notifications

### Collection Notification Testing (from CollectionNotifications.lua)
- `/ntmcollection test` - Test all notification sounds in sequence
- `/ntmcollection testpet` - Test pet notification only
- `/ntmcollection testmount` - Test mount notification only  
- `/ntmcollection testtoy` - Test toy notification only
- `/ntmcollection testtransmog` - Test transmog notification only
- `/ntmcollection status` - Show current settings

## Technical Implementation

### Settings Storage
All settings are stored in `NoobTacoDB.CollectionNotifications` with the following structure:
```lua
{
  enabled = true,           -- Master enable/disable
  newPet = true,           -- Pet notifications
  newMount = true,         -- Mount notifications  
  newToy = true,           -- Toy notifications
  newTransmog = true,      -- Transmog notifications
  showMessages = true,     -- Chat message display
  soundPet = "NT_InfussionOfLight",     -- Pet sound
  soundMount = "NT_Mount",              -- Mount sound
  soundToy = "NT_Chest",               -- Toy sound
  soundTransmog = "NT_Chest",          -- Transmog sound
}
```

### Event Handling
The system uses WoW's built-in collection events:
- `NEW_PET_ADDED` - Filters for first-time species collection
- `NEW_MOUNT_ADDED` - All new mounts 
- `NEW_TOY_ADDED` - All new toys
- `TRANSMOG_COLLECTION_SOURCE_ADDED` - New transmog appearances

### Config Menu Integration
- Located under Audio category (category ID 2)
- Custom dropdown implementation for modern WoW compatibility
- Real-time setting synchronization between config and notification system
- Dynamic UI element cleanup when switching categories

## Usage Instructions

1. **Open the config menu**:
   - Type `/ntconfig` in chat
   - Or use `/ntcc` to go directly to Collection Notifications

2. **Navigate to Collection Notifications**:
   - Click "Audio" in the left panel
   - Click "Collection Notifications" button

3. **Configure notifications**:
   - Use the master toggle to enable/disable all notifications
   - Toggle individual collection types as desired
   - Select preferred sounds for each type using dropdowns
   - Use "Test" buttons to preview sounds
   - Enable/disable chat messages as preferred

4. **Test your setup**:
   - Use the test buttons in the config
   - Or use `/ntmcollection test` to test all sounds
   - Collect items in-game to verify notifications work

## Default Configuration

The system starts with sensible defaults:
- All notification types enabled
- Chat messages enabled
- Pet sounds use "Infusion of Light" (magical theme)
- Mount sounds use "Mount" (mount-specific)
- Toy and Transmog sounds use "Chest" (treasure theme)

## Audio Files Available

The following audio files are registered and available:
- `NT_InfussionOfLight` - Magical, ethereal sound
- `NT_Chest` - Treasure chest opening
- `NT_Mount` - Mount-related sound
- `NT_NPC` - NPC interaction sound
- `NT_Group` - Social/group sound
- `NT_Collection` - General collection sound

All files are located in `Media/Audio/` and are properly registered with LibSharedMedia-3.0.
