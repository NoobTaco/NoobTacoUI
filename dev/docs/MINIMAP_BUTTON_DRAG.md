# Minimap Button Drag Functionality

## Overview
Added drag-and-drop functionality to the NoobTacoUI-Media minimap button to allow users to reposition it around the minimap when it conflicts with other addon buttons.

## Features Implemented

### 1. Drag Functionality
- **Left-click and drag** to reposition the button around the minimap
- **Position persistence** - button remembers its position across sessions
- **Smooth positioning** - button snaps to calculated circular position around minimap
- **Visual feedback** - tooltip updates during drag operation

### 2. Position Storage
- **Database field**: `NoobTacoUIMediaDB.GeneralSettings.minimapButtonAngle`
- **Default value**: 225 degrees (bottom-left area)
- **Range**: 0-360 degrees around minimap center
- **Auto-migration**: Existing databases get the default angle added automatically

### 3. Enhanced Tooltips
- **Standard tooltip**: Shows click actions and drag instruction
- **Drag tooltip**: Shows repositioning instructions while dragging
- **Instruction text**: "Drag to reposition" hint in normal tooltip

### 4. Slash Command Integration
- **`/ntminimap reset`** - Resets button position to default (225° - bottom-left)
- **Enhanced help** - Updated help text shows all available options
- **Position feedback** - Commands show current angle when positioning

## Technical Implementation

### Key Functions

#### Position Management
```lua
PositionMinimapButton(angle) -- Positions button at specified angle
GetAngleFromPosition()       -- Calculates angle from current position
```

#### Database Integration
- Angle stored in degrees (0-360)
- Default initialization in database setup
- Persistent across addon reloads/game sessions

#### Drag Event Handling
- `OnDragStart` - Begins drag operation, updates tooltip
- `OnDragStop` - Saves new position, calculates angle, snaps to position
- `OnClick` - Prevented during drag operations to avoid conflicts

### Position Calculation
- **Radius**: Fixed at 80 pixels from minimap center
- **Angle conversion**: Degrees to radians for trigonometric calculations
- **Coordinate mapping**: `x = radius * cos(angle)`, `y = radius * sin(angle)`
- **Normalization**: Angles normalized to 0-360° range

## User Experience

### Usage Instructions
1. **Reposition**: Left-click and drag the minimap button to desired location
2. **Release**: Drop the button - it will snap to the nearest circular position
3. **Reset**: Use `/ntminimap reset` to return to default position
4. **Feedback**: Console messages confirm position changes with angle values

### Visual Feedback
- **Hover state**: Button background brightens on hover
- **Drag state**: Tooltip shows drag instructions
- **Position snap**: Button repositions smoothly to calculated angle
- **Persistence**: Position maintained across all game sessions

### Conflict Resolution
- **Classic Era**: Addresses minimap button overlap issues
- **Flexible positioning**: 360° positioning around minimap circumference
- **Non-intrusive**: Maintains all existing button functionality

## Testing

### Manual Testing
```bash
# Test basic functionality
/ntminimap show     # Create/show button
/ntminimap reset    # Reset to default position
/ntminimap refresh  # Recreate button at saved position
```

### Drag Testing
1. Drag button to different positions around minimap
2. Reload UI (`/reload`) - verify position persistence
3. Test click functionality after dragging
4. Verify tooltip updates during drag operations

### Edge Cases
- **No minimap**: Function handles missing Minimap frame gracefully
- **Invalid angles**: Normalization prevents invalid coordinate calculations
- **Multiple drags**: Position updates correctly on subsequent drags
- **Rapid clicks**: Click prevention during drag operations

## Integration Notes

### Database Migration
- Existing installations automatically receive `minimapButtonAngle = 225`
- No user action required for migration
- Backward compatible with existing settings

### Performance
- **Minimal overhead**: Position calculations only during drag operations
- **Efficient storage**: Single angle value instead of x/y coordinates
- **Event-driven**: No continuous monitoring or updating

### Compatibility
- **Classic Era**: Primary target for conflict resolution
- **Retail**: Full functionality maintained
- **Other addons**: No interference with existing minimap button systems

## Future Enhancements

### Potential Improvements
- **Snap zones**: Predefined positions (N, NE, E, SE, S, SW, W, NW)
- **Visual preview**: Show button outline during drag
- **Collision detection**: Avoid overlapping with other minimap buttons
- **Animation**: Smooth movement animations for position changes

### Configuration Options
- **Radius adjustment**: Allow users to set distance from minimap center
- **Snap sensitivity**: Configure how precisely button positions
- **Reset confirmation**: Optional confirmation dialog for position reset

This implementation provides a robust solution for minimap button positioning conflicts while maintaining the addon's existing functionality and Nord-themed visual design.
