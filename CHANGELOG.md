# Changelog

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

### Changed

-   Updated Interface versions
-   Updated addon category

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
-   Cleaned up LUA files to be more efficient
-   Created a Classic build (NoobTacoUI to come later)

## [1.0.2] - 2020-10-23

### Changed

-   Setting up Automated Build

## [1.0.0] - 2020-10-23

### Changed

-   Initial Upload