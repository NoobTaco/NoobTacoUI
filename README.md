# NoobTacoUI-Media

![CI Status](https://github.com/NoobTaco/NoobTacoUI-Media/workflows/CI/badge.svg) ![Release Status](https://github.com/NoobTaco/NoobTacoUI-Media/workflows/Release/badge.svg)

This is a media addon that provides high-quality fonts, audio files, and status bar textures for World of Warcraft addons. All media is registered with LibSharedMedia-3.0 and will automatically appear in any compatible addon's media selection lists.

## ✨ New in Latest Release

### Enhanced Configuration Interface
- **Professional Menu System**: Completely redesigned configuration interface with modern Nord theme
- **Custom Scrollbars**: Sleek, thin scrollbars that perfectly match the Nord color scheme
- **Collection Notifications**: Advanced notification system for mounts, pets, toys, and transmog with customizable audio alerts
- **Logo Integration**: Branded About section with comprehensive feature information
- **Modular Design**: Reusable UI components for consistent styling across all panels

### Improved User Experience
- **Visual Feedback**: Enhanced hover states and selection indicators
- **Organized Layout**: Professional typography hierarchy and spacing
- **Responsive Design**: Content adapts to different screen sizes and UI scales
- **Easy Navigation**: Intuitive sidebar navigation with clear section organization

# Features

## Configuration Menu

Access the enhanced configuration interface with:
- **`/ntm config`** - Open the main configuration window
- **`/ntm settings`** - Alternative command for configuration

### Collection Notifications
- **Smart Detection**: Automatically detects new mounts, pets, toys, and transmog items
- **Custom Audio**: Choose from curated sound effects for each collection type
- **Visual Messages**: Optional chat messages with collection notifications
- **Granular Control**: Enable/disable notifications for specific collection types

### Audio Settings
- **Preview System**: Test any audio file before applying
- **Quality Sounds**: Professional sound effects designed for collection notifications
- **Easy Selection**: Dropdown menus with all available audio assets

## Slash Commands

Easy-to-use in-game commands for addon information:

-   **`/ntm version`** - Display current addon version
-   **`/ntm ver`** - Short version command  
-   **`/ntm v`** - Shortest version command
-   **`/ntm`** - Show help with available commands

## Google Fonts

A carefully curated collection of Google Fonts optimized for World of Warcraft. These fonts are registered with SharedMedia and will show up in any addon's font list.

-   **Montserrat** - Modern geometric sans-serif (5 weights: Black, Bold, Medium, Regular, SemiBold)
-   **Roboto** - Clean, natural reading rhythm (4 weights: Black, Bold, Medium, Regular)
-   **Lato** - Humanist sans-serif (3 weights: Black, Bold, Regular)
-   **Dosis** - Rounded sans-serif (7 weights: Bold, ExtraBold, ExtraLight, Light, Medium, Regular, SemiBold)
-   **Exo2** - Contemporary geometric (6 weights: Black, Bold, ExtraBold, Medium, Regular, SemiBold)
-   **Mukta** - Minimalist Devanagari (7 weights: Bold, ExtraBold, ExtraLight, Light, Medium, Regular, SemiBold)
-   **Poppins** - Geometric sans-serif (9 weights: Black, Bold, ExtraBold, ExtraLight, Italic, Medium, Regular, SemiBold, Thin)

## Audio Files

Enhanced collection of high-quality sound effects designed for collection notifications and rare mob scanning addons:

### Collection Notification Sounds
-   **NT_InfussionOfLight** - Magical discovery sound for special collections
-   **NT_Mount** - Mount-related sound effect for new mount acquisitions
-   **NT_Chest** - Treasure discovery sound for toys and general items
-   **NT_Transmog** - Appearance-related sound for transmog notifications

### General Audio Assets
-   **NT_Group** - Group/party NPC encounter sound
-   **NT_NPC** - General NPC/rare mob sound

All audio files are:
- **High Quality**: Professional sound design optimized for game audio
- **Notification Ready**: Perfect for collection and achievement systems
- **SharedMedia Compatible**: Automatically available in any addon's audio selection

## Status Bar Textures

Complete Nord theme collection with 32 high-quality status bar textures for health bars, mana bars, and other UI elements:

### Solid Nord Textures
16 solid-colored textures based on the popular Nord color palette (NT_Nord00 through NT_Nord15)

### Gradient Nord Textures
16 matching gradient versions for enhanced visual depth (NT_Nord00_Gradient through NT_Nord15_Gradient)

All textures feature:
-   Clean, modern aesthetic inspired by the Nord color scheme
-   Optimized for readability and visual appeal
-   Consistent naming with zero-padded numbers for perfect sorting

# Download and Support

## Download from your favorite addon hosts

-   [GitHub](https://github.com/NoobTaco/NoobTacoUI-Media)
-   [Curse/Overwolf](https://www.curseforge.com/wow/addons/noobtacoui-media)
-   [WoW Interface](https://www.wowinterface.com/downloads/info25745-NoobTacoUI-Media.html)
-   [Wago](https://addons.wago.io/addons/noobtacoui-media)

Feel free to use any of the supported download managers.

## Support my addon development

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/G2G01GM9G)
[![sponsormeongithub](https://user-images.githubusercontent.com/1172935/97088810-463e0e00-15e8-11eb-8078-f18da01c6e9e.png)](https://github.com/sponsors/NoobTaco)

# Installation

Simply install the addon through your preferred addon manager or manually extract to your `Interface/AddOns` folder. All media will be automatically registered and available in compatible addons immediately.

# Compatibility

This addon works with any World of Warcraft addon that uses LibSharedMedia-3.0 for media management, including:

-   ElvUI
-   WeakAuras
-   Details!
-   Bartender4
-   And many more...

# Development

For developers working on this addon, all development files are organized in the `dev/` directory:

- **Development documentation**: `dev/docs/`
  - `ENHANCED_MENU_SYSTEM.md` - Complete guide to the new configuration interface
  - `COLLECTION_NOTIFICATIONS_CONFIG.md` - Collection notification system documentation
  - `SOUND_DROPDOWN_IMPLEMENTATION.md` - Audio system implementation details
  - Additional technical documentation for various features
- **Build scripts and tools**: `dev/scripts/`

## Quick Development Commands

Using the helper script:
```bash
./dev-helper.sh test      # Run addon tests
./dev-helper.sh check-lua # Run Lua checks
./dev-helper.sh build     # Build package
./dev-helper.sh libs      # Update libraries
```

## Key Development Features

### Enhanced UI Framework
- **Nord Theme Integration**: Complete color palette and styling system
- **Modular Components**: Reusable UI elements for consistent design
- **Custom Scroll Frames**: Professional scrollbars with Nord styling
- **Responsive Layout**: Adapts to different screen sizes and UI scales

### Configuration System
- **Account-Wide Settings**: Persistent configuration across characters
- **Event-Driven Updates**: Efficient callback system for setting changes
- **Extensible Architecture**: Easy to add new configuration options
- **Professional Interface**: Modern design patterns and user experience

See `dev/README.md` and the documentation in `dev/docs/` for detailed development information.

# License

Code in this repository is licensed under GPL-3.0-or-later. See `LICENSE` for details.

Note: Media files (fonts, audio, textures) are included under their respective upstream licenses. Ensure any redistribution complies with each asset's license terms.
