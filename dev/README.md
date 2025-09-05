# Development Files

This directory contains development-related files that are excluded from the packaged addon.

## Structure

- `docs/` - Development documentation files
- `scripts/` - Build scripts, test scripts, and development tools

## Usage

### Scripts

All scripts are designed to be run from anywhere and will automatically change to the project root directory.

- `scripts/Makefile` - Build automation (run with `make -f dev/scripts/Makefile`)
- `scripts/check-lua.sh` - Run Lua syntax and static analysis checks
- `scripts/test-version.sh` - Test version display in packaged addon

### Documentation

The `docs/` folder contains detailed documentation about:
- Configuration system implementation
- UI fixes and enhancements
- Development workflows
- Feature specifications

## Package Exclusion

The entire `dev/` directory is excluded from packaging via the `.pkgmeta` ignore list, keeping the distributed addon clean and minimal.
