# Enhanced Configuration Menu System

## Overview

The NoobTacoUI-Media addon features a completely redesigned configuration interface built with Nord theme integration and modern UI design principles. This document outlines the architecture, components, and features of the enhanced menu system.

## Architecture

### Core Components

#### 1. Main Configuration Frame (`CreateEnhancedConfigFrame`)

- **Size**: 900x600 pixels for optimal content display
- **Styling**: Nord theme integration with gradient backgrounds
- **Behavior**: Movable, draggable, and clamped to screen
- **Frame Strata**: Dialog level for proper layering

#### 2. Enhanced Header (`CreateEnhancedHeader`)

- **Functionality**: Drag-to-move capability for the entire frame
- **Styling**: Gradient background using Nord2 theme
- **Typography**: Enhanced title styling with proper font hierarchy
- **Close Button**: Custom styled close button with Nord theme colors

#### 3. Sidebar Navigation (`CreateEnhancedSidebar`)

- **Width**: 200 pixels with proper padding
- **Category Buttons**: Custom styled with icons and Nord theme
- **Selection States**: Visual feedback for active/inactive states
- **Responsive**: Highlights and state changes for better UX

#### 4. Content Area (`CreateEnhancedContentArea`)

- **Dynamic Panels**: Content switches based on sidebar selection
- **Scrollable**: Custom Nord-themed scroll frames for long content
- **Responsive**: Adapts to different content types and lengths

### Performance Optimization

#### Lazy Loading Architecture

- **Deferred Initialization**: The main configuration frame and its sub-components are not created until the user first requests to open the menu.
- **Memory Efficiency**: Reduces initial memory footprint and addon load time.
- **On-Demand Creation**: UI elements are instantiated only when needed via `InitializeConfigFrame()`.

### Custom Nord-Themed Scroll Frame

#### Features

- **Thin Design**: 8px wide scrollbar (50% thinner than standard WoW scrollbars)
- **Nord Colors**:
  - Track: Nord0 (darkest gray)
  - Thumb: Nord2 (medium gray) with Nord8 (cyan) hover highlight
  - Buttons: Nord1 (dark gray)
- **Full Functionality**:
  - Mouse wheel scrolling
  - Click-and-drag thumb
  - Up/down button navigation
  - Auto-hide when content fits

#### Modular Design

The `CreateNordScrollFrame()` function is designed to be reusable throughout the addon:

```lua
local scrollFrame = CreateNordScrollFrame(parentFrame)
scrollFrame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)
scrollFrame:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0)
local content = scrollFrame.scrollChild
-- Add content to scrollChild
```

## Menu Sections

### 1. Audio Settings

- **Collection Notifications**: Toggle system for various collection types
- **Sound Selection**: Dropdown menus for each notification type
- **Test Functionality**: Preview buttons for all audio assets
- **Visual Organization**: Grouped settings with clear headers

### 2. General Settings

- **Future Expansion**: Placeholder for additional configuration options
- **Consistent Styling**: Maintains Nord theme and layout patterns
- **Extensible Design**: Easy to add new settings as features are developed

### 3. Game Settings (Pixel Perfect)

- **Resolution Scaling**: Support for 4K (2160p), 1440p, and 1080p UI scaling.
- **Scaling Modes**:
  - **Standard (1:1)**: Maps 1 UI pixel to 1 physical pixel (maximum workspace).
  - **High Visibility (2:1)**: Maps 1 UI pixel to a 2x2 grid of physical pixels (maximum readability).
- **Resolution Detection**: Automatically identifies physical screen size to guide user selection.
- **Smart Feedback**: "Print Current Scale" tool identifies current mode and resolution.
- **Safety Features**:
  - Warning text about CVar modification
  - Automatic reload prompt after changes
  - Ensures `useUiScale` is enabled

### 4. Addon Integrations

- **Profile Management**: Import optimized profiles for supported addons
- **Collapsible Sections**: Organized list of available addon integrations
- **Smart Detection**: Only shows profiles for loaded addons
- **Supported Addons**:
  - BetterBlizzFrames
  - Platynator
  - Cooldown Manager Tweaks
  - zBarButtonBG
  - XIV_Databar Continued
  - Sensei Class Resource Bar

### 4. About Section

- **Logo Integration**: 64x64px logo display with proper positioning
- **Professional Layout**: Two-column design with logo and content
- **Comprehensive Information**:
  - Version and author information
  - Feature descriptions and benefits
  - Support and community resources
- **Scrollable Content**: Full content accessible via custom scroll frame

## UI Design Principles

### Nord Theme Integration

- **Color Palette**: Complete Nord color scheme implementation
- **Consistent Usage**:
  - Nord0-Nord3: Backgrounds and containers
  - Nord4-Nord6: Text and content
  - Nord7-Nord10: Accents and highlights
  - Nord11-Nord15: Status and feedback colors

### Typography Hierarchy

- **Headers**: `GameFontNormalLarge` in Nord8 (cyan)
- **Subheaders**: `GameFontNormal` in Nord13 (yellow) or Nord14 (green)
- **Body Text**: `GameFontNormal` in Nord4/Nord5 (light grays)
- **Consistent Spacing**: 8px, 12px, 16px, and 24px spacing units

### Interactive Elements

- **Hover States**: Subtle color transitions and highlights
- **Selection Feedback**: Clear visual indication of active states
- **Button Styling**: Consistent Nord-themed button appearance
- **Responsive Design**: Elements adapt to content and user interaction

## Technical Implementation

### Frame Management

- **Global Reference**: `EnhancedConfigFrame` for external access
- **Event Handling**: Proper show/hide behavior with other addons
- **Memory Efficiency**: Lazy loading of panels and content

### Settings Integration

- **Database**: Account-wide settings storage via `NoobTacoUIMediaDB`
- **Callback System**: Event-driven updates for settings changes
- **Persistence**: Automatic saving and loading of user preferences

### Extensibility

- **Modular Functions**: Each UI component is a separate, reusable function
- **Consistent Patterns**: New sections can follow established patterns
- **Asset Management**: Centralized asset references in `UIAssets.lua`

## Development Guidelines

### Adding New Sections

1. Create panel using `CreateEnhancedSettingsPanel()`
2. Add sidebar button using `CreateEnhancedCategoryButton()`
3. Implement content with consistent Nord styling
4. Use `CreateNordScrollFrame()` for scrollable content

### Color Usage

- Always use `addon.UIAssets.Colors.NordX` references
- Maintain contrast ratios for accessibility
- Test colors in different lighting conditions

### Spacing and Layout

- Use defined constants: `PADDING`, `INNER_PADDING`, `SECTION_SPACING`
- Maintain consistent margins and alignment
- Consider different screen resolutions and UI scales

## Future Enhancements

### Planned Features

- **Settings Export/Import**: Save and share configuration presets
- **Theme Customization**: Allow users to modify Nord color values
- **Advanced Audio Options**: Volume controls and custom sound uploads
- **Plugin Architecture**: Support for third-party extensions

### Technical Improvements

- **Performance Optimization**: Lazy loading and efficient rendering
- **Accessibility**: Keyboard navigation and screen reader support
- **Localization**: Multi-language support for all UI text
- **Mobile/Controller**: Support for alternative input methods

## Testing and Quality Assurance

### Manual Testing Checklist

- [ ] All panels load correctly
- [ ] Scrolling works smoothly in About section
- [ ] Audio preview buttons function properly
- [ ] Settings persist across login/logout
- [ ] UI scales properly at different resolutions
- [ ] High Visibility (2:1) modes maintain sharpness
- [ ] Resolution detection accurately identifies monitor size
- [ ] Nord theme colors display correctly

### Automated Testing

- Lua syntax validation via LuaCheck
- Frame reference validation
- Settings database integrity checks
- Asset reference verification

## Conclusion

The enhanced configuration menu system provides a solid foundation for NoobTacoUI-Media's user interface needs. The modular, Nord-themed design ensures consistency, maintainability, and extensibility for future development while providing users with a professional and intuitive configuration experience.
