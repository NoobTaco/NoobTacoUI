# Development Files

This directory contains development-related files that are excluded from the packaged addon.

## Structure

- `docs/` - Development documentation files
- `scripts/` - Build scripts, test scripts, and development tools

## Recent Development Highlights

### Enhanced Configuration Menu System
The addon now features a completely redesigned configuration interface:
- **Nord Theme Integration**: Professional design with consistent color scheme
- **Custom Scroll Frames**: Thin, sleek scrollbars that match the theme
- **Modular UI Components**: Reusable functions for consistent styling
- **Collection Notifications**: Advanced notification system with audio customization

See `docs/ENHANCED_MENU_SYSTEM.md` for complete technical documentation.

## Usage

### Scripts

All scripts are designed to be run from anywhere and will automatically change to the project root directory.

- `scripts/Makefile` - Build automation (run with `make -f dev/scripts/Makefile`)
- `scripts/check-lua.sh` - Run Lua syntax and static analysis checks
- `scripts/test-version.sh` - Test version display in packaged addon

### Documentation

The `docs/` folder contains detailed documentation about:

#### Core Systems
- `ENHANCED_MENU_SYSTEM.md` - Complete guide to the new configuration interface
- `COLLECTION_NOTIFICATIONS_CONFIG.md` - Collection notification system
- `SOUND_DROPDOWN_IMPLEMENTATION.md` - Audio system implementation

#### Development Process
- Configuration system implementation details
- UI fixes and enhancements documentation
- Development workflows and best practices
- Feature specifications and technical requirements

## Development Guidelines

### UI Development
- Use `CreateNordScrollFrame()` for all scrollable content
- Follow Nord color palette defined in `UIAssets.lua`
- Implement consistent spacing with defined constants
- Ensure responsive design for different UI scales

### Code Standards
- Run `./dev-helper.sh check-lua` before commits
- Document new UI components in `dev/docs/`
- Use modular, reusable function design
- Maintain consistent naming conventions

## Package Exclusion

The entire `dev/` directory is excluded from packaging via the `.pkgmeta` ignore list, keeping the distributed addon clean and minimal.
