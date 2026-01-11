# NoobTacoUI

## [Unreleased]
- **Branding**: Re-branded the NoobTaco suite with the official "NoobTaco Tech Brand Identity". Added split-color prominence: **NoobTaco** (Burnt Sienna) paired with **UI** or **GotOne** (Cloud White). (Issue #35)
- **Theme System**: Removed the theme switcher UI from the configuration menu. The addon now exclusively uses the "NoobTaco" theme for a consistent visual identity. (Issue #36)
- **Config UI**: Rearranged sidebar menu items for a more logical onboarding flow: **About** -> **Addon Integration** -> **Game Settings** -> **General**. The configuration menu now defaults to the **About** page on first open. (Issue #34)
- **Module Split**: The Collection Notifications module and associated sound files have been officially moved to the standalone addon **[NoobTaco-GotOne](https://www.curseforge.com/wow/addons/noobtaco-gotone)**.
- **Fix**: Resolved issue where opening the `NoobTacoUI` category via the Blizzard Options menu would show an empty page. It now correctly defaults to the "About" page.
- **Fix**: Resolved issue where the `NoobTacoUI` category was not appearing in the Blizzard Options menu until the config window was opened manually.
- **UI Refinement**: Removed redundant audio notification description from the `About` page.
- **UI Refinement**: Streamlined "Addon Integration" section by simplifying addon descriptions and instructions (Issue #33).
- **New Feature**: Added a "DOWNLOAD ADDON" button for uninstalled addons, providing direct access to download links.
- **Code Cleanup**: Removed the redundant legacy configuration menu (`ConfigMenu.lua`) as the new library-based system is now fully operational.
- **Code Cleanup**: Removed unused metadata and redundant headers from addon profile definitions.
- **Library Update**: Updated `NoobTaco-Config` embedded library to v1.0.3 to ensure compatibility and prevent version conflicts.
- **Fix**: Resolved issue where addon messages would append a '1' to the end (Issue #32).
- **Fix**: Resolved Lua syntax error in `Media/UIAssets.lua` caused by redundant code at the end of the file.


- **Themed Chat & Tooltips**: Centralized chat printing via `addon:Print` and updated Minimap/Compartment tooltips to use the `NoobTaco-Config` theme system for dynamic token resolution.
- **Theme Migration**: Successfully transitioned the default UI color theme from "Nord" to "NoobTaco" across the entire addon suite and documentation.
- **Improved Settings Persistence**: Implemented `NoobTaco-Config:Commit()` in all General section toggles and sliders to ensure settings are saved immediately.
- **Nested Path Support**: Synchronized embedded library with standalone fixes for nested database pathing.
- **Dependency Management**: Migrated `LibSharedMedia-3.0` to external dependency management via `.pkgmeta`, ensuring easier updates and cleaner repository structure.
- **Notification Migration**: Removed Collection Notifications module and associated sound files. This feature has been moved to the standalone addon **NoobTaco-GotOne**.

### 🎯 Major Features Added

#### New Configuration System (Stage 1) 🆕

- **New Library Integration**: Integrated `NoobTaco-Config` library for robust, modular configuration menus.
- **General Settings**: Completed the "General Settings" section using the new library:
    - **Minimap Button Toggle**: Interactive toggle for showing/hiding the minimap button.
    - **Minimap Button Angle**: New slider to adjust the position of the minimap button.
    - **Addon Compartment Toggle**: Control for the Blizzard Addon Drawer integration.
- **Blizzard Settings Integration**: The configuration menu now integrates directly into the Blizzard Interface Options panel (Retail/Midnight).
- **About Page**: Implemented the "About" page using the new schema-based system, featuring the addon logo, version, description, and links.
- **Slash Commands**: Updated `/ntconfig` and related commands to open the new configuration panel.

## [v1.4.3](https://github.com/NoobTaco/NoobTacoUI/tree/v1.4.3) (2026-01-07)

[Full Changelog](https://github.com/NoobTaco/NoobTacoUI/compare/v1.4.2...v1.4.3)

### 🎯 Major Features Added

#### Enhanced UI Scaling 🆕

- **High Visibility Modes**: Added specialized 2:1 integer scaling for 4K, 1440p, and 1080p, significantly improving accessibility for visually impaired users on high-DPI monitors.
- **Resolution Detection**: The configuration menu now automatically detects and displays the physical screen resolution.
- **Smart Diagnostic**: Updated "Print Current Scale" tool to recognize and name all standard and accessibility scaling modes.

- **Addon Integration UI Overhaul**:
  - **Guided Flow**: Reorganized the panel into a clear, step-by-step process: **Step 1 (Manual Edit Mode)** -> **Step 2 (Automated Apply All)** -> **Individual Addon Management**.
  - **Visual Prominence**: Implemented high-contrast "Gold" theme for the mandatory Edit Mode setup and a matching "Green" theme for automated application.
  - **Alphabetical Addon List**: All supported addons are now listed alphabetically with clear status badges (**[NEW]**, **[UPDATE]**, **[NOT LOADED]**).
  - **Robust Layout**: Restructured the panel using relative anchoring to prevent window stacking issues and ensure perfect alignment across all resolutions.
  - **Improved Instructions**: Refined the manual setup steps with clear naming recommendations ("NoobTacoUI").
- **XIV_Databar Continued Automatic Application**: Added one-click "Apply Profile" button with robust folder detection (supports Continued/Main variants) and crash-prevention for the Talent Module during import.
- **Config Menu UI Refactor**:
  - **Unified Design**: Completely redesigned all configuration sub-menus (About, General, audio, Game Settings, Instructions) to match the modern "Nord" aesthetic of the Addon Integration panel.
  - **Anchored Layouts**: Implemented robust, anchored container layouts for every panel to prevent text overlap and ensure perfect alignment across all resolutions.
  - **Dynamic Sizing**: Added dynamic vertical resizing for all containers (About, Help Text, Warnings) to gracefully handle content changes without clipping.
  - **Improved Navigation**: Reordered configuration categories (About → Addon Integration → Audio → Game Settings → General → Instructions) for a more logical user flow.
  - **Visual Hierarchy**: Standardized typography, padding, borders, and background colors (`Nord1`/`Nord3`) across the entire addon for a cohesive professional feel.
  - **Game Settings Warning**: Added a specialized "Red" (Nord11) themed warning box for critical CVar settings to clearly communicate caution.
  - **Audio Settings Polish**: Updated the "Play Sample" icon to match the WoW Cooldowns musical note style (on Midnight 12.0+) with smart fallback to the classic "Next Page" icon for Retail compatibility. Also increased checkbox sizes for better clickability.
- **BetterBlizzFrames Profile Update**: Updated the BetterBlizzFrames profile string to the latest version for improved layout and styling.
- **Edit Mode Profile Update**: Ported the "Midnight" Edit Mode profile layout to Retail (v10.x), ensuring users get the same visual experience across versions without compatibility issues.
- **Developer Tools**: Added `Convert-MidnightProfile.ps1` and `convert-midnight-profile.sh` scripts to automate the conversion of Midnight Edit Mode profiles to Retail format.

### � Bug Fixes

- **Edit Mode**: Hidden the Edit Mode profile setup block on non-retail (Classic) clients to prevent confusion.
- **Audio Settings**: Implemented icon fallback for "Play Sample" button in audio menu (Classic uses generic icon).
- **Addon Integration**: Resolved "Apply All" button overlap issues in the management panel.

### �🔧 Technical Improvements

- **Helper Commands**: Added `/rl` and `/reloadui` as shortcuts for the default `/reload` command for faster UI reloading.
- **Environment Cleanup**: Removed redundant Windows metadata files (`Zone.Identifier`) to improve cross-platform compatibility.
- **CVar Safety**: Enhanced `uiScale` management to automatically ensure `useUiScale` is enabled.

### 📦 Updates

- **TOC Update**: Bumped interface version to support WoW 12.0.1 (120001).

## [v1.4.2](https://github.com/NoobTaco/NoobTacoUI-Media/tree/v1.4.2) (2025-12-02)

[Full Changelog](https://github.com/NoobTaco/NoobTacoUI-Media/compare/v1.4.1...v1.4.2)

### 📦 Updates

- **TOC Update**: Bumped interface version to support WoW 11.0.7 (110207).
- **Version Bump**: Updated addon version to v1.4.2.

## [v1.4.1](https://github.com/NoobTaco/NoobTacoUI-Media/tree/v1.4.1) (2025-11-30)

[Full Changelog](https://github.com/NoobTaco/NoobTacoUI-Media/compare/v1.4.0...v1.4.1)

### 🎯 Major Features Added

#### Addon Integration System 🆕

- **XIV_Databar Continued Profile**: One-click import of optimized XIV_Databar Continued profile
- **Sensei Class Resource Bar Profile**: One-click import of optimized Sensei Class Resource Bar profile
- **Enhanced Detection**: Improved detection for XIV_Databar Continued to support multiple folder naming conventions

### 🔧 Technical Improvements

#### Minimap Button Refactor

- **LibDBIcon Integration**: Replaced custom minimap button implementation with standard `LibDBIcon-1.0`.
- **Improved Compatibility**: Solved issues with button bar addons (like MinimapButtonButton) showing errors on hover.
- **Standard Behavior**: Button now behaves consistently with other addons (drag, position, visibility).

## [v1.4.0](https://github.com/NoobTaco/NoobTacoUI-Media/tree/v1.4.0) (2025-11-29)

[Full Changelog](https://github.com/NoobTaco/NoobTacoUI-Media/compare/v1.3.3...v1.4.0)

### 🎯 Major Features Added

#### Game Settings & Pixel Perfect 🆕

- **Pixel Perfect Scaling**: One-click resolution scaling for 4K, 1440p, and 1080p
- **Smart Detection**: "Print Current Scale" button identifies if current scale matches standard resolutions
- **Safety First**: Built-in warnings and reload prompts to ensure settings are applied correctly
- **CVar Management**: Direct control over `uiScale` and `useUiScale` CVars

#### Addon Integration System 🆕

- **Default WoW UI Edit Mode**: One-click import of optimized Edit Mode layout
- **Cooldown Manager Tweaks Profile**: One-click import of optimized Cooldown Manager Tweaks profile
- **zBarButtonBG Profile**: One-click import of optimized zBarButtonBG profile

### 🔧 Technical Improvements

#### Performance Optimization

- **Lazy Loading**: Configuration menu UI elements are now created only when first accessed, reducing initial memory usage and load time.
- **Efficient Initialization**: Streamlined startup process for faster addon loading.

## [v1.3.3](https://github.com/NoobTaco/NoobTacoUI-Media/tree/v1.3.3) (2025-11-20)

[Full Changelog](https://github.com/NoobTaco/NoobTacoUI-Media/compare/v1.2.0...v1.3.3)

### 🎯 Major Features Added

#### Addon Integration System 🆕

- **BetterBlizzFrames Profiles**: One-click import of optimized BetterBlizzFrames profiles
- **User-Friendly Dialog**: Scrollable popup with selectable text for easy profile copying
- **Profile Management**: Clean interface for addon configuration sharing
- **Extensible Framework**: Foundation for future addon integrations

#### Midnight Beta Compatibility 🌙

- **Interface Update**: Full compatibility with WoW Midnight Beta (Interface: 120000)
- **Future-Proof**: Ready for upcoming WoW expansion features
- **API Compliance**: Updated for latest WoW API standards

### 🔧 Technical Improvements

#### Enhanced Configuration Interface

- **Scrollable Profile Dialog**: Custom Nord-themed scrollable dialog for long profile strings
- **Improved Copy Mechanism**: User-friendly text selection instead of clipboard tricks
- **Better Error Handling**: Graceful fallbacks for missing addon dependencies

#### Database Architecture

- **AddonProfiles Module**: New dedicated module for managing addon profile data
- **Profile String Storage**: Secure storage of optimized addon configurations
- **Version Detection**: Smart detection of addon availability and compatibility

### 🎨 User Experience

#### Audio System Refinements

- **Smart Cooldowns**: Added 4-second cooldown to collection notifications to prevent audio spam when unlocking sets
- **Spam Prevention**: Ensures only one notification plays at a time during mass collection events

#### Professional Profile Management

- **Visual Feedback**: Clear success messages and instructions for profile import
- **Accessibility**: Proper text selection and copying for all users
- **Nord Theme Integration**: Consistent styling with existing configuration interface
- **Collapsible Interface**: New accordion layout for addon profiles to save space and improve organization
- **Optimized Navigation**: Reordered sidebar menu for better workflow

#### Future-Ready Framework

- **Modular Design**: Easy addition of new addon integrations
- **Profile Validation**: Automatic validation of profile data integrity
- **User Guidance**: Step-by-step instructions for profile import processes

### 📚 Documentation Updates

#### Enhanced User Documentation

- **Addon Integration Section**: New section explaining addon integration features
- **Midnight Beta Badge**: Added compatibility indicators throughout documentation
- **Profile Import Guide**: Step-by-step instructions for using addon integrations

#### Technical Documentation

- **Implementation Details**: Comprehensive technical guide for addon integrations
- **API Documentation**: Clear documentation of profile management functions
- **Future Expansion**: Guidelines for adding new addon integrations

### 🚀 What's Next

This release introduces the foundation for addon integration with BetterBlizzFrames as the first implementation. Future enhancements may include:

- **Additional Addon Profiles**: More optimized profiles for popular addons
- **Profile Sharing**: Community profile sharing and import features
- **Advanced Profile Management**: Profile versioning and conflict resolution
- **Integration with Other NoobTacoUI Components**: Unified configuration across the suite

### 💻 For Developers

#### New Module Architecture

- **AddonProfiles.lua**: Dedicated module for addon profile management
- **Profile Data Structure**: Standardized format for addon configuration data
- **Integration APIs**: Clean APIs for adding new addon integrations

#### Quality Assurance

- **Syntax Validation**: All code passes Lua syntax checks
- **Cross-Version Testing**: Tested across multiple WoW versions
- **Performance Monitoring**: Efficient profile loading and management

## [v1.2.0](https://github.com/NoobTaco/NoobTacoUI-Media/tree/v1.2.0) (2025-09-06)

[Full Changelog](https://github.com/NoobTaco/NoobTacoUI-Media/compare/v1.1.3...v1.2.0) [Previous Releases](https://github.com/NoobTaco/NoobTacoUI-Media/releases)

- fix: Resolve CI build issues by updating luacheck configuration
  - Add common WoW addon warning patterns to ignore list (shadowing, empty branches)
  - Exclude .release directory from luacheck analysis
  - Add all required global variables (SavedVariables, slash commands, addon compartment functions)
  - Fix variable shadowing issue in ConfigMenu.lua (rename frame to waitFrame)
  - All luacheck tests now pass with 0 warnings/0 errors  
        This resolves the CI build failures and allows the pull request to be merged.
- docs: Clean up documentation and prepare for v1.2.0 release
  - Remove development-specific documentation files that are no longer needed
  - Update README.md to be more user-focused with cleaner structure
  - Simplify dev/README.md to focus on essential development information
  - Update version to v1.2.0 in modules/version.lua
  - Enhance .pkgmeta to properly exclude dev directory from releases
  - Add .release/ to .gitignore to prevent accidental commits  
        This cleanup prepares the project for the v1.2.0 release with:
  - Enhanced Configuration Interface with Nord theme
  - Collection Notifications system
  - Minimap button and addon compartment integration
  - General Settings panel
  - Account-wide persistent settings  
        Ready for pull request and release.
- Fix Audio Settings dropdown and play button arrows
  - Replace Unicode arrows (▼ ▶) with texture-based approach for cross-version compatibility
  - Dropdown arrows now use Interface\Buttons\Arrow-Down-Up texture
  - Play buttons now use Interface\Buttons\UI-SpellbookIcon-NextPage-Up texture
  - Fixes arrow display issues on retail where Unicode was showing as boxes
  - Maintains Nord theme color integration with SetVertexColor()
  - Preserves all hover effects, enable/disable states, and functionality
  - Adds version detection system for future fallback scenarios
  - Ensures consistent arrow appearance across all WoW versions  
        Resolves: Arrow display issues in Audio Settings menu
- feat: implement sophisticated Poppins typography hierarchy with Nord-appropriate weights
  - Replace single-weight system with Nord-appropriate Poppins weight hierarchy
  - Add typography hierarchy: header-primary (Bold), header-secondary (SemiBold),  
        label-emphasis (SemiBold), label-standard (Medium), body-text (Regular),  
        small-text (Regular), icon-text (Medium)
  - Update UIAssets.lua with comprehensive font system and fallback support
  - Convert all ConfigMenu.lua font applications to new typography types
  - Enhance visual hierarchy across About, Audio, and General settings panels
  - Improve readability with appropriate font weights for Nord color palette
  - Maintain cross-version compatibility (Classic Era through Retail)
  - Add comprehensive documentation for typography implementation  
        This creates a sophisticated font system that enhances UX while staying  
        true to Nord design principles and modern interface typography standards.
- feat: Complete enhanced UX feature set  
     🎮 Minimap Button Drag & Drop
  - Added full drag-and-drop repositioning around minimap
  - Position persistence with angle storage (default: 225° bottom-left)
  - Enhanced tooltips with drag instructions
  - /ntminimap reset command for position reset  
        🎯 Version Compatibility System
  - Comprehensive expansion detection (Classic Era through Retail)
  - Smart feature gating based on expansion capabilities
  - MoP+ support for collection notifications
  - Clean UI adaptation for unsupported features  
        🔇 Chat Spam Reduction
  - Silent startup and initialization
  - Messages only on explicit user actions
  - Smart message control with showMessages parameter
  - Preserved debug and manual command feedback  
        ⌨️ ESC Key Handler
  - Standard WoW UI behavior for config menu closure
  - Proper keyboard focus management
  - Smart key propagation without gameplay interference
  - Professional UX matching Blizzard standards  
        ✅ Enhanced Feature Matrix:
  - Full functionality: MoP (5.x) through Retail
  - Core features: All expansions including Classic Era
  - Graceful degradation with clear user communication
  - Consistent Nord-themed interface across all versions  
        All features syntax-validated (0 errors, 32 warnings - all standard addon patterns)
- Remove janky CHANGELOG.md and associated automation
  - Removed problematic CHANGELOG.md file with duplicated/malformed entries
  - Removed auto-changelog workflow that was creating the malformed entries
  - Removed changelog-config.json as it's no longer needed
  - Updated release workflow to generate changelog from git history when needed
  - Updated CI workflow to remove CHANGELOG.md from paths-ignore
  - Updated .pkgmeta to remove CHANGELOG.md references
  - Packaging now relies on GitHub release notes and generated changelog
- docs: Add comprehensive testing summary for General Settings v1.2.0
  - Complete testing checklist for all WoW versions
  - Known behaviors and limitations documented
  - Success criteria and testing procedures
  - Ready for multi-version testing phase
- docs: Complete General Settings v1.2.0 implementation documentation
  - Add comprehensive implementation guide (GENERAL_SETTINGS_IMPLEMENTATION.md)
  - Add detailed release notes (RELEASE_NOTES_v1.2.0.md)
  - Document technical architecture and user experience
  - Include testing guidelines and cross-version compatibility notes
  - Ready for testing on other WoW versions
- Style: Clean up whitespace and line formatting in AddonCompartment functions
- Fix: Resolve nil function error in AddonCompartment functions
  - Replace GetGeneralSetting/GetDBValue calls with direct database access
  - AddonCompartment functions are called before config framework loads
  - Use NoobTacoUIMediaDB.GeneralSettings.enableAddonCompartment directly
  - Maintain proper default value handling (true when not set)
  - Fixes runtime error when clicking addon compartment entry
- Fix: Improve real-time UI updates for general settings
  - Add user notification for addon compartment toggle requiring /reload
  - Update help text to clarify which changes take effect immediately
  - Clean up duplicate feedback messages
  - Enhance user experience with clear guidance
- feat: Add General Settings panel with minimap button and addon compartment integration

  ## New Features

- General Settings Panel
  - Added new General Settings section to enhanced configuration menu
  - Scrollable content area with Nord theme consistency
  - Toggle controls for interface options with real-time feedback
  - Settings persistence across login/logout sessions
- Minimap Button Integration
  - Custom minimap button with NoobTacoUI-Media logo
  - Proper WoW minimap button styling and border alignment
  - Interactive tooltips with usage instructions
  - Click functionality:
    - Left-click: Opens configuration menu
    - Right-click: Toggles collection notifications
  - Configurable visibility through General Settings panel
  - Positioned at optimal location around minimap
- Addon Compartment Support
  - Full integration with WoW's new addon drawer system
  - Single, properly registered entry in addon compartment
  - Context menu with configuration and notification options
  - Tooltip support with detailed functionality descriptions
  - TOC file integration with AddonCompartmentFunc entries
- Database Enhancements
  - Extended GeneralSettings table in NoobTacoUIMediaDB
  - Helper functions for general settings management
  - Automatic initialization with sensible defaults:
    - showMinimapButton: true
    - enableAddonCompartment: true
  - Callback system for real-time UI updates
- Developer Tools
  - Enhanced debug command (/ntdebug) with general settings status
  - Minimap button control command (/ntminimap show|hide|toggle|refresh)
  - Comprehensive status reporting for troubleshooting
- Technical Improvements
  - Proper initialization timing with multiple event triggers
  - Graceful fallbacks for missing features (older WoW clients)
  - Memory-efficient button creation with availability checks
  - Nord theme integration throughout all new UI elements

    ## Implementation Details

  - Follows established enhanced menu system patterns
  - Maintains consistent spacing and color schemes
  - Reusable UI components with modular design
  - Professional typography hierarchy and visual feedback
  - Cross-platform compatibility with proper interface detection  
        All new features integrate seamlessly with the existing Nord-themed  
        configuration system while providing users with multiple interface  
        access methods and full customization control.
- Reorganize configuration menu sidebar order
  - Move About section to first position (top of sidebar)
  - Reposition Audio Settings to second position
  - Move General Settings to third position
  - Update default panel selection to show About section on config open
  - Consolidate About button code to match new position
  - Update ShowConfigMenu function to default to About panel
  - Maintain all existing functionality and refresh logic  
        Menu now opens with professional About section showing logo and  
        comprehensive addon information, providing better user onboarding  
        while keeping settings easily accessible in logical order.
- Update documentation for enhanced menu system  
     Front-facing changes:
  - Add 'New in Latest Release' section highlighting enhanced configuration interface
  - Update feature descriptions for collection notifications and audio system
  - Enhance development section with new UI framework details
  - Reorganize audio files section with better categorization  
        Development documentation:
  - Create comprehensive ENHANCED_MENU_SYSTEM.md technical guide
  - Document Nord theme integration and custom scroll frame architecture
  - Add UI development guidelines and component usage examples
  - Update dev/README.md with recent development highlights and guidelines  
        Documentation now reflects:
  - Professional configuration interface with Nord theme
  - Modular UI component system with reusable functions
  - Custom scroll frame implementation details
  - Collection notification system features
  - Development best practices and code standards
- Enhance About section with logo and custom Nord-themed scrollbar
  - Add logo reference to UIAssets.lua for proper asset management
  - Create professional About panel layout with logo, enhanced content structure
  - Add comprehensive feature descriptions and support information
  - Implement custom Nord-themed scroll frame (CreateNordScrollFrame)
    - Modular and reusable design for use throughout config menu
    - 8px thin scrollbar (50% thinner than standard)
    - Darker Nord color scheme (Nord0/Nord1/Nord2) for better integration
    - Mouse wheel, click, and drag functionality
    - Auto-hide when content fits in container
  - Improve content organization with proper sections and typography hierarchy
  - Use consistent Nord color palette for professional appearance
- feat: Modernize Audio Configuration UI with Nord theme integration  
     ✨ New Features:
  - Modern card-based layout with subtle row backgrounds and hover effects
  - Per-row disable functionality for individual collection types
  - Enhanced visual hierarchy with improved typography and spacing
  - Right-aligned controls with left-justified labels for clean separation  
        🎨 UI/UX Improvements:
  - Added Nord theme background container with subtle borders and transparency
  - Improved disabled text color (Nord4) for better readability
  - Enhanced checkbox interactions with immediate visual feedback
  - Consistent alignment of dropdowns and test buttons across all rows
  - Added hover states for better interactivity  
        🏗️ Technical Enhancements:
  - Row-based element organization for better maintainability
  - Individual row state management with proper enable/disable logic
  - Master toggle integration respecting both global and individual settings
  - Improved positioning system using absolute coordinates for perfect alignment  
        🎵 Audio Assets:
  - Added new collection-specific sound files (toy and transmog collections)  
        The configuration interface now follows modern UI design patterns with proper  
        visual hierarchy, consistent spacing, and intuitive user interactions while  
        maintaining full backward compatibility with existing settings.
- CollectionNotifications: set new collection sound defaults (pet/mount/toy/transmog) and migrate legacy defaults
- SharedMedia: register new collection notification sound files (pet, mount collection, toy collection, transmog)
- Collection Notifications: persist checkbox states and refresh UI on open; switch SavedVariables to NoobTacoUIMediaDB with migration; normalize booleans; add live sync callbacks; refresh checkbox/dropdown UI when Audio panel shows
- docs(license): clarify wording to GPL-3.0-or-later in README
- chore(org): move dev docs/scripts into dev/ and exclude from packaging; add dev-helper.sh\n\nchore(license): switch from MIT to GPL-3.0-or-later, include LICENSE in package, update README and TOC metadata\n\nchore(build): update Makefile and scripts paths under dev/scripts/
- feat: Implement sound dropdown selection for Collection Notifications  
     🎵 Add customizable sound selection for each notification type

  ## New Features

  - **Sound Dropdowns**: Choose custom sounds for Pet, Mount, Toy, and Transmog notifications
  - **Test Buttons**: Preview selected sounds immediately with play buttons (▶)
  - **LibSharedMedia Integration**: Access all available sounds from any addon
  - **Account-Wide Settings**: Sound preferences persist across all characters

    ## UI Components Added

  - CreateSoundDropdown(): Nord-themed dropdown with LibSharedMedia integration
  - CreateSoundTestButton(): Play button for immediate sound testing
  - Enhanced config menu with improved spacing and visual hierarchy

    ## Technical Improvements

  - Fixed module load order: CollectionNotifications → ConfigMenu
  - Added Enable/Disable methods to custom UI components
  - Implemented settings refresh system for proper persistence
  - Enhanced debug commands (/ntdebug, /ntrefresh)

    ## User Experience

  - **Immediate Feedback**: Settings save automatically on selection
  - **Visual Consistency**: Nord theme throughout all new components
  - **Accessibility**: Proper enable/disable states with visual feedback
  - **Sound Validation**: Graceful fallback for missing sounds

    ## Default Sound Mapping

  - Pets: NT_InfussionOfLight (magical theme)
  - Mounts: NT_Mount (mount-specific sound)
  - Toys & Transmog: NT_Chest (treasure theme)

    ## Commands

  - /ntconfig - Main configuration menu
  - /ntcc - Direct to Collection Notifications
  - /ntmcollection test - Test all notification sounds  
        Resolves settings persistence issues and provides comprehensive sound customization capabilities.
- feat: Enhanced config UI with WoW texture icons and improved UX
  - Moved collection notification options from popup to main config panel
  - Added WoW texture icons for menu categories (bell, gear, book)
  - Created texture-based close button matching WoW UI style
  - Made config window draggable only via title bar for professional behavior
  - Removed popup dialog in favor of integrated right-pane settings
  - Added CreateTextureIconButton and CreateTextureIcon utility functions
  - Enhanced category buttons to support both texture and text icons
  - Improved hover states and Nord color theming throughout
  - Better visual consistency with WoW's native UI elements
- feat: implement Nord-themed config menu with enhanced UX
  - Replace ConfigMenu.lua with modern Nord-themed implementation
  - Add UIAssets.lua for centralized color and asset management
  - Integrate Collection Notifications with enhanced popup
  - Add database helper functions and callback registry
  - Implement enhanced category navigation and settings panels
  - Support multiple slash commands (/ntconfig, /ntuiconfig, /ntmedia, /ntcc)
  - Clean up and remove unused Plumber integration files
  - Add comprehensive documentation for final implementation  
        The config menu now features professional Nord theming with:
  - Sidebar navigation with category buttons
  - Enhanced typography and consistent spacing
  - Proper hover effects and visual feedback
  - Modular panel system for easy expansion
  - Collection Notifications integration with detailed popup settings
- feat: Complete Plumber-style config menu with cog wheel settings
  - Redesigned config menu using Plumber's ControlCenter design patterns
  - Implemented golden ratio layout (0.618) with proper left/right panel split
  - Added CategoryButtonMixin with expand/collapse functionality
  - Created Collection Notifications configuration with:
    - Global enable checkbox in left panel navigation
    - Cog wheel settings button for detailed popup configuration
    - Enable/disable state management with visual feedback
    - Individual collection type toggles (Pet, Mount, Toy, Transmog)
    - Audio selection dropdown with test button functionality
  - Streamlined to Audio category only as requested
  - Added proper hover effects, tooltips, and professional styling
  - Follows modern WoW addon UI patterns with clean, intuitive design
- refactor: Clean up debug code and optimize codebase
  - Remove extensive debug print statements from CollectionNotifications.lua
  - Reduce CollectionNotifications.lua from 614 to 304 lines (50% reduction)
  - Remove verbose debug slash commands and analysis functions
  - Clean up unused variables and redundant code
  - Remove debug print statements from ConfigMenu.lua
  - Remove commented debug code from version.lua
  - Fix function signatures to remove unused parameters
  - Add missing showMessages setting to defaultSettings
  - Preserve all core functionality while improving performance
  - Maintain essential test commands for troubleshooting
- Fix transmog collection notifications
  - Fixed transmog notifications not triggering by switching from TRANSMOG_COLLECTION_UPDATED to TRANSMOG_COLLECTION_SOURCE_ADDED event
  - Resolved item transfer interference issues between bags/bank
  - Updated event handler to properly receive sourceID parameter
  - Simplified notification logic based on All the Things addon approach
  - Added comprehensive debug logging for troubleshooting
  - Updated deprecated GetItemInfo() calls to use C_Item.GetItemNameByID()
  - Removed complex counting logic in favor of direct event-based detection  
        The transmog notifications now work reliably without interfering with normal inventory operations.
- fix: Fix transmog notification API errors  
     Fixed transmog collection notification issues:  
     API Fixes:
  - Removed non-existent C_TransmogCollection.GetAppearanceInfoByID function call
  - Simplified transmog notification to use available WoW APIs only
  - Enhanced debugging to show all event parameters with types
  - Updated OnTransmogCollected to handle variable argument count using ...
  - Added comprehensive parameter logging to diagnose transmog events  
        Testing Command Fixes:
  - Replaced broken transmog analysis with API availability checker
  - Added C_TransmogCollection function availability testing
  - Switched from appearance ID testing to item ID testing with known items
  - Added C_TransmogSets availability checking
  - More robust error handling for missing APIs  
        Event Handling:
  - Enhanced parameter detection for unknown transmog event structure
  - Added fallback parameter handling for sourceID/appearanceID
  - Improved debug logging to help identify correct transmog event parameters
  - Fixed syntax errors from duplicate end statements  
        Now ready to test transmog notifications and see what parameters  
        the TRANSMOG_COLLECTION_UPDATED event actually provides! 🎨🔧
- feat: Enhance transmog collection notifications  
     Enhanced transmog notifications with comprehensive API usage:  
     Transmog notification improvements:
  - Enhanced OnTransmogCollected function with full transmog API integration
  - Added C_TransmogCollection.GetAppearanceInfoByID for appearance data
  - Added C_TransmogCollection.GetSourceInfo for source details
  - Added item name and slot type detection using GetItemInfo and invType
  - Enhanced debug logging with detailed transmog information
  - Improved chat messages with item names and slot types  
        New transmog testing commands:
  - Added '/ntmcollection testtransmog' for testing transmog notifications
  - Added '/ntmcollection transmog' for transmog collection analysis
  - Transmog analysis includes sample appearance scanning, collection stats, and set information
  - Updated help text to include new transmog commands  
        Features:
  - Detailed transmog appearance tracking with item names and slot types
  - Sample transmog collection analysis with appearance IDs
  - Enhanced notification messages showing collected item details
  - Comprehensive debug logging for transmog events  
        Ready for testing transmog notifications! 🎨✨
- feat: Remove achievement and title notifications
  - Removed achievement and title notification functionality from CollectionNotifications.lua
  - Achievement notifications: OnAchievementEarned function and ACHIEVEMENT_EARNED event handling
  - Title notifications: OnTitleEarned function (titles are handled via achievements anyway)
  - Updated defaultSettings to remove newAchievement, newTitle, soundAchievement, soundTitle
  - Updated slash commands to remove testachievement and achievements commands
  - Updated ConfigMenu.lua to remove achievement and title checkboxes
  - Updated module description to reflect changes  
        Reason: Default WoW achievement and title toasts already work well and provide  
        better visual feedback than our custom audio notifications. This simplifies  
        the addon and reduces redundancy while focusing on areas where WoW doesn't  
        provide good default notifications (pets, mounts, toys, transmog).
- feat: Add enhanced mount and toy collection notifications  
     Mount notifications:
  - Enhanced API usage with full C_MountJournal.GetMountInfoByID data
  - Added comprehensive mount analysis command
  - Fixed mount count discrepancy explanation (1422 vs 395)
  - Added /ntmcollection testmount and /ntmcollection mounts commands  
        Toy notifications:
  - Enhanced API usage with C_ToyBox.GetToyInfo and PlayerHasToy
  - Added toy collection status checking
  - Added /ntmcollection testtoy and /ntmcollection toys commands
  - Sample toy analysis with usability status  
        Both mount and toy notifications working correctly! ✅
- fix: Pet collection notifications working correctly
  - Fix pet event handler to use proper WoW API (C_PetJournal.GetPetInfoByPetID)
  - Add duplicate prevention using C_PetJournal.GetNumCollectedInfo
  - Remove memory-leaking seenSpecies table, use WoW's collection data instead
  - Only notify for first-time species collections (numCollected <= 1)
  - Add comprehensive debug logging for troubleshooting
  - Handle both direct pet info lookup and fallback via species ID  
        Pet notifications now working: ✅ New species = notification, ❌ Duplicates = no notification
- feat: Add collection notifications for WoW collections
  - Add CollectionNotifications.lua module for audio notifications
  - Support notifications for pets, mounts, toys, achievements, transmog, and titles
  - Add configuration UI in ConfigMenu.lua with toggles for each type
  - Add new slash commands /ntmcollection for testing and status
  - Register new audio alias NT_Collection for collection sounds
  - Update luacheck configuration for new globals
  - Load new module in load_modules.xml  
        Resolves issue #11 - Audio notification for collecting items into WoW collection
- Remove redundant CHANGELOG.md copy from test artifacts  
     The .changelog file (copied as changelog.txt) already contains the relevant  
     changelog content used by the BigWigs packager. Including the full CHANGELOG.md  
     was redundant for test artifacts.
- 📝 Auto-update changelog
- Clean up: remove temporary build files and downloaded packager script
- 📝 Auto-update changelog
- Fix artifact packaging: exclude shell scripts and properly handle BigWigs packager behavior
  - Update .pkgmeta to ignore shell scripts (release.sh, test-version.sh, \*.sh)
  - Fix workflow to understand BigWigs packager doesn't include changelog in zip
  - Include processed changelog and source changelog as separate artifact files
  - Clean up test output to be more informative
- Investigate packager changelog structure - examine zip contents and extract actual changelog files
- Fix artifact filtering - only include zip and changelog
  - Use find to copy only .zip files from .release directory
  - Copy .changelog as changelog.txt for better visibility
  - Avoid copying shell scripts and other unwanted files
  - More targeted file selection for cleaner artifacts
- NEW APPROACH: Copy artifacts immediately after packaging
  - Add step to copy files from .release and .changelog to ./artifacts/ immediately after packaging
  - This preserves files before any potential cleanup by the packager action
  - Upload from ./artifacts/ instead of trying to access .release directly
  - Should finally solve the 'No files were found' issue
- Debug artifact upload issue and revert to directory upload
  - Add current working directory and file listing to debug output
  - Change back to uploading entire .release/ directory instead of glob pattern
  - The files exist but glob pattern may not be working correctly
  - This will help identify if it's a path or pattern matching issue
- Fix artifact upload YAML syntax
  - Split single artifact upload into two separate uploads
  - Upload zip files as 'NoobTacoUI-Media-Test-Package'
  - Upload changelog as 'NoobTacoUI-Media-Changelog'
  - Fixes YAML parsing issue with multi-line path syntax
- Fix workflow artifact upload issue
  - Add debugging to show .release directory contents before upload
  - Change artifact path to be more specific (.release/\*.zip instead of .release/)
  - Include .changelog file in artifact upload
  - This should resolve the 'No files were found' warning during artifact upload
- Fix artifact upload path - upload entire release directory
  - Change from .release/\*.zip to .release/ to avoid path parsing issues
  - upload-artifact@v4 seems to have issues with wildcard patterns
  - This will upload the entire release directory including the zip file
- Add back artifact upload for test packages
  - Upload only the zip file using simple path pattern
  - Removes if-no-files-found error condition that was causing issues
  - Test packages will be available for download from Actions tab
- Simplify test workflow - remove artifact upload for now
  - Remove problematic upload-artifact step that was failing
  - Keep debug output to verify packaging and changelog work
  - Focus on testing core functionality rather than artifact storage
  - User can verify via workflow logs that everything works properly
- fix(workflows): Use multi-line path specification for artifact upload
- fix(workflows): Upload entire .release directory as artifact
- debug: Add debug step to check release directory contents
- fix(workflows): Simplify packager args for test builds
- fix(workflows): Use correct flag for creating test packages
- fix: update packager args to prevent upload and create zip
- NoobTaco/issue17 (#22)
  - feat: add 'All' option to WoW version dropdown in bug report template
  - feat(workflows): Improve release process and cleanup
  - Removed redundant build.yml workflow.
  - Updated release.yml to correctly extract the latest changelog entry for release notes.
  - Added a manual 'workflow_dispatch' trigger to release.yml to allow for safe testing on any branch.
- Merge pull request #21 from NoobTaco/copilot/fix-20  
     [WIP] ✨ Set up Copilot instructions
- Initial plan
- 📝 Auto-update changelog
