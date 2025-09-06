# General Settings Implementation Guide

## Overview
This document outlines the complete implementation of the General Settings panel for NoobTacoUI-Media, including minimap button integration and WoW addon compartment support.

## Features Implemented

### 1. General Settings Panel
- **Location**: Main configuration menu sidebar
- **Design**: Nord-themed panel matching Audio Collection menu style
- **Layout**: Container-based with proper spacing and scrollable content
- **Integration**: Seamlessly integrated with existing enhanced menu system

### 2. Minimap Button Integration
- **Visual Design**: Custom button with NoobTacoUI-Media logo
- **Styling**: Nord theme colors with proper border and highlight effects
- **Functionality**: 
  - Left-click: Opens main configuration menu
  - Real-time show/hide toggle
  - Immediate feedback without requiring UI reload
- **Database**: Persistent setting stored in `NoobTacoUIMediaDB.GeneralSettings.showMinimapButton`

### 3. Addon Compartment Integration
- **WoW Integration**: Modern addon drawer support via TOC file registration
- **Functions**: Global handlers for click, enter, and leave events
- **Behavior**: 
  - When enabled: Full functionality (left-click config, right-click toggle notifications)
  - When disabled: Shows informative message, tooltip indicates disabled state
- **Database**: Persistent setting stored in `NoobTacoUIMediaDB.GeneralSettings.enableAddonCompartment`

## Technical Implementation

### Database Structure
```lua
NoobTacoUIMediaDB = {
  GeneralSettings = {
    showMinimapButton = true,        -- Default: enabled
    enableAddonCompartment = true    -- Default: enabled
  }
}
```

### Key Functions

#### Minimap Button Management
- `CreateMinimapButton()`: Creates and styles the minimap button
- `UpdateMinimapButtonVisibility()`: Handles real-time show/hide
- `InitializeGeneralSettings()`: Sets up initial state on addon load

#### Addon Compartment Handlers
- `NoobTacoUIMedia_OnAddonCompartmentClick()`: Global click handler
- `NoobTacoUIMedia_OnAddonCompartmentEnter()`: Global hover enter handler  
- `NoobTacoUIMedia_OnAddonCompartmentLeave()`: Global hover leave handler

#### Settings Management
- `GetGeneralSetting(key)`: Local helper for retrieving settings (scoped to panel)
- `SetGeneralSetting(key, value)`: Local helper for saving settings (scoped to panel)
- Direct database access in global functions for early-load compatibility

### UI Components

#### Checkbox Controls
- **Design**: Nord-themed checkboxes with consistent styling
- **Labels**: Clear, descriptive text with proper color coding
- **Feedback**: Immediate visual and chat feedback on changes
- **Persistence**: Settings saved immediately on change

#### Help Text Section
- **Content**: Detailed explanations of each feature
- **Formatting**: Multi-line text with proper spacing and color coding
- **Information**: Clear indication of which changes are immediate vs. requiring reload

## File Structure

### Modified Files
- `modules/ConfigMenu.lua`: Main implementation (+500 lines)
- `NoobTacoUI-Media.toc`: Added AddonCompartment function declarations

### Dependencies
- `Media/UIAssets.lua`: Nord theme colors and styling
- `Libraries/LibSharedMedia-3.0/`: Not directly used but present for compatibility

## User Experience

### Immediate Feedback
- **Minimap Button**: Shows/hides immediately with status message
- **Addon Compartment**: Immediate enable/disable with informative messages
- **Settings Persistence**: All changes saved automatically

### Clear Communication
- **Status Messages**: Color-coded feedback for all actions
- **Help Text**: Comprehensive explanations of functionality
- **Tooltips**: Context-appropriate information in addon compartment

### Error Handling
- **Database Safety**: Proper nil checking and default values
- **Early Load Issues**: Direct database access for global functions
- **WoW API Limitations**: Clear messaging about compartment removal limitations

## Technical Challenges Resolved

### 1. Function Scope Issues
**Problem**: AddonCompartment functions called before config framework loads
**Solution**: Use direct `NoobTacoUIMediaDB` access instead of helper functions

### 2. Real-time UI Updates
**Problem**: Some changes traditionally required UI reload
**Solution**: Immediate minimap button updates, clear messaging for compartment limitations

### 3. Styling Consistency
**Problem**: Maintaining Nord theme across all new components
**Solution**: Consistent use of `addon.UIAssets.Colors` and established patterns

### 4. Database Integration
**Problem**: Multiple settings storage approaches in codebase
**Solution**: Unified approach using `NoobTacoUIMediaDB.GeneralSettings` structure

## Testing Guidelines

### Manual Testing Checklist
- [ ] General Settings panel loads without errors
- [ ] Minimap button toggle works immediately
- [ ] Addon compartment toggle saves setting correctly
- [ ] Settings persist across /reload and relog
- [ ] Disabled compartment shows informative messages
- [ ] All UI elements follow Nord theme
- [ ] Help text displays correctly with proper formatting
- [ ] No Lua errors in chat or saved variables

### Cross-Version Compatibility
- **Retail (11.x)**: Full functionality including addon compartment
- **Classic Era (1.15.x)**: Minimap button only (no addon compartment)
- **Classic TBC/Wrath**: Minimap button only (no addon compartment)

## Future Enhancements

### Potential Additions
- Additional interface customization options
- Minimap button position customization
- More granular notification controls
- Integration with other NoobTacoUI addons

### Maintenance Notes
- Monitor WoW API changes affecting addon compartment
- Consider adding more interface options as requested
- Maintain compatibility with LibSharedMedia updates

## Code Quality

### Standards Applied
- **Nord Theme Consistency**: All colors use `addon.UIAssets.Colors` references
- **Error Handling**: Comprehensive nil checking and safe defaults
- **Documentation**: Inline comments explaining complex logic
- **Modularity**: Reusable patterns for future expansion

### Performance Considerations
- **Lazy Loading**: Settings panel created only when accessed
- **Efficient Updates**: Targeted refresh functions
- **Memory Management**: Proper frame cleanup and reference handling

## Conclusion

The General Settings implementation provides a solid foundation for interface customization while maintaining the high-quality user experience established by the existing codebase. The modular design allows for easy expansion and the comprehensive error handling ensures reliable operation across different WoW versions and usage scenarios.

All features work as intended with appropriate fallbacks for limitations in the WoW API, particularly regarding addon compartment dynamic management.
