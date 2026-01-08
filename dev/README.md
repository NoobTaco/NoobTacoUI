# Development Files

This directory contains development-related files that are excluded from the packaged addon.

## Structure

- `docs/` - Core technical documentation
- `scripts/` - Build scripts, test scripts, and development tools

## Documentation

The `docs/` folder contains essential technical documentation:

- `ENHANCED_MENU_SYSTEM.md` - Complete guide to the configuration interface
- `COLLECTION_NOTIFICATIONS_CONFIG.md` - Collection notification system
- `SOUND_DROPDOWN_IMPLEMENTATION.md` - Audio system implementation
- `CLASSIC_ERA_SUPPORT.md` - Classic Era compatibility details
- `RELEASE_NOTES_v1.2.0.md` - Version 1.2.0 changelog

## Development Scripts

All scripts are designed to be run from anywhere and will automatically change to the project root directory.

- `scripts/Makefile` - Build automation (run with `make -f dev/scripts/Makefile`)
- `scripts/check-lua.sh` - Run Lua syntax and static analysis checks
- `scripts/test-version.sh` - Test version display in packaged addon
- `scripts/Convert-MidnightProfile.ps1` - PowerShell tool to convert Midnight (12.0+) Edit Mode profiles to Retail format
- `scripts/convert-midnight-profile.sh` - Bash script for converting profiles (WSL/Linux compatible)

## Quick Development Commands

Using the helper script:

```bash
./dev-helper.sh test      # Run addon tests
./dev-helper.sh check-lua # Run Lua checks
./dev-helper.sh build     # Build package
./dev-helper.sh libs      # Update libraries
```

## Development Guidelines

### UI Development

- Use `CreateNordScrollFrame()` for all scrollable content
- Follow Nord color palette defined in `UIAssets.lua`
- Maintain consistent spacing and typography patterns

### Code Standards

- All code must pass luacheck validation
- Follow WoW addon best practices for event handling
- Use account-wide settings for user preferences
- Implement consistent spacing with defined constants
- Ensure responsive design for different UI scales

### Code Standards

- Run `./dev-helper.sh check-lua` before commits
- Document new UI components in `dev/docs/`
- Use modular, reusable function design
- Maintain consistent naming conventions

## Package Exclusion

The entire `dev/` directory is excluded from packaging via the `.pkgmeta` ignore list, keeping the distributed addon clean and minimal.
