# Changelog

## [v1.2.0] - 2025-09-06

### ✨ New Features

#### Enhanced Configuration Interface
- **Professional Nord-Themed Menu System**: Complete redesign with modern aesthetics
- **Custom Scrollbars**: Sleek, thin scrollbars perfectly integrated with Nord color scheme
- **Modular UI Components**: Reusable functions for consistent styling across all panels
- **Professional Typography**: Sophisticated Poppins font hierarchy for enhanced readability

#### Collection Notifications System
- **Smart Detection**: Automatically detects new pets, mounts, toys, and transmog items
- **Customizable Audio**: Choose from curated sound effects for each collection type
- **Real-time Preview**: Test any audio file before applying with integrated play buttons
- **Granular Control**: Enable/disable notifications for specific collection types
- **Account-Wide Settings**: Persistent configuration across all characters

#### Interface Integration
- **Interactive Minimap Button**: Custom button with NoobTacoUI-Media logo and drag-and-drop positioning
- **WoW Addon Compartment**: Full support for modern addon drawer system with context menus
- **General Settings Panel**: Centralized interface customization options
- **Multiple Access Methods**: Configuration via slash commands, minimap, or addon compartment

### 🛠️ Technical Improvements

#### Enhanced Architecture
- **Nord Theme Integration**: Complete color palette and styling system
- **Event-Driven Updates**: Efficient callback system for real-time setting changes
- **Cross-Version Compatibility**: Support from Classic Era through Retail with feature gating
- **Memory Optimization**: Efficient initialization and proper cleanup

#### Database Enhancements
- **Unified Storage**: New `NoobTacoUIMediaDB` structure with automatic migration
- **Helper Functions**: Streamlined database operations with validation
- **Default Value Management**: Comprehensive fallback system for all settings

### 🎵 Audio System Enhancements
- **LibSharedMedia Integration**: Access to all available sounds from any addon
- **Professional Sound Effects**: High-quality audio designed for collection notifications
- **Sound Validation**: Graceful fallback for missing audio files
- **Preview System**: Immediate sound testing functionality

### 🔧 Development Improvements
- **Documentation Cleanup**: Streamlined documentation focusing on essential information
- **Build Optimization**: Proper exclusion of development files from releases
- **Code Quality**: Comprehensive Lua validation with standard addon patterns
- **Modular Design**: Enhanced maintainability and extensibility

### 📋 Commands Reference
- **`/ntm config`** - Open main configuration window
- **`/ntm settings`** - Alternative configuration command
- **`/ntm version`** - Display addon version
- **`/ntmcollection`** - Collection notification commands
- **`/ntminimap`** - Minimap button controls
- **`/ntdebug`** - Developer debugging tools

### 🎯 User Experience
- **Intuitive Navigation**: Clear sidebar organization with enhanced category buttons
- **Visual Feedback**: Comprehensive hover states and selection indicators
- **Professional Interface**: Consistent with modern WoW UI design patterns
- **Accessibility**: Proper contrast ratios and readable text sizes

### 🔄 Migration & Compatibility
- **Automatic Migration**: Seamless upgrade from previous versions
- **Backward Compatibility**: Full compatibility with existing SharedMedia integrations
- **Multi-Version Support**: Tested across Classic Era, Classic, and Retail

## [1.0.9] - 2025-09-03

### Added

-   **New Feature:** Version command system with slash commands
    -   `/ntm version` - Display current addon version
    -   `/ntm ver` - Short version command
    -   `/ntm v` - Shortest version command
    -   `/ntm` - Show help with available commands
-   Enhanced README.md with detailed font descriptions and weight variants
-   Installation and compatibility sections in documentation
-   Comprehensive media documentation
-   **New Audio:** NT_InfussionOfLight sound effect
-   **New Status Bar Textures:** Complete Nord theme collection (32 textures total)
    -   16 solid Nord-colored textures (NT_Nord00 through NT_Nord15)
    -   16 gradient Nord-colored textures (NT_Nord00_Gradient through NT_Nord15_Gradient)

### Changed

-   Updated Interface versions to support 11506, 40402, 50407, 110205
-   Updated addon description from "Font's and Elite Frames" to "Fonts, Audio, and Textures for World of Warcraft"
-   Completely restructured README.md for better clarity and accuracy
-   Simplified project structure by removing unused modules
-   **BREAKING:** Replaced old NT_Bar01-04 textures with new Nord theme collection
-   Improved texture naming with zero-padded numbers for better in-game sorting
-   Enhanced luacheck configuration to support WoW slash command globals

### Fixed

-   Fixed statusbar texture paths to point to correct addon directory (NoobTacoUI-Media)
-   Cleaned up duplicate LSM null checks in SharedMedia.lua

### Removed

-   **BREAKING:** Removed SimpleRareElite module and all elite frame functionality
-   Removed elite texture files (elite.tga, rare.tga, rareelite.tga, worldboss.tga)
-   Removed unitframes module directory and related XML files
-   Removed elite frame images and references from documentation
-   **BREAKING:** Removed old NT_Bar01-04 status bar textures (replaced with Nord theme)

## [1.0.8] - 2025-03-17

### Updated

-   Changed game version
-   Updated category

## [1.0.7] - 2024-08-26

### Added

-   Font: Poppins

## [1.0.6] - 2024-08-25

### Added

-   4 sound files for SilverDragon or Rare Scanner

## [1.0.5] - 2024-08-10

### Changed

-   Updated game versions

### Added

-   Fonts: Dosis, Exo2, Mukta

## [1.0.4] - 2020-10-26

### Changed

-   Cleaned up LUA code

## [1.0.3] - 2020-10-23

### Changed

-   Updated SharedMedia Lib to a more current version

## [1.0.2] - 2020-10-23

### Changed

-   Setting up Automated Build

## [1.0.1] - 2020-10-23

### Changed

-   Setting up Automated Build

## [1.0.0] - 2020-10-23

### Initial Release

-   Core media addon functionality
-   Font integration with LibSharedMedia-3.0
-   Basic status bar textures
-   Audio file support