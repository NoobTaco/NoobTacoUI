#!/bin/bash
# Release script for NoobTacoUI-Media
# This script creates a properly versioned package ready for distribution

set -e

echo "🚀 NoobTacoUI-Media Release Builder"
echo "=================================="

# Get current version from git
CURRENT_VERSION=$(git describe --tags --always)
echo "📌 Current version: $CURRENT_VERSION"

# Check if we're on a clean working directory
if [[ $(git status --porcelain) ]]; then
    echo "⚠️  Warning: You have uncommitted changes"
    echo "   Consider committing your changes before creating a release"
    echo
fi

# Build the package
echo "📦 Building package..."
make package

# Verify version replacement worked
PACKAGED_VERSION=$(grep "## Version:" .release/NoobTacoUI-Media/NoobTacoUI-Media.toc | cut -d' ' -f3)
echo "✅ Packaged version: $PACKAGED_VERSION"

if [[ "$PACKAGED_VERSION" == "$CURRENT_VERSION" ]]; then
    echo "✅ Version replacement successful!"
else
    echo "❌ Version mismatch! Expected: $CURRENT_VERSION, Got: $PACKAGED_VERSION"
    exit 1
fi

# Create ZIP file for manual distribution
cd .release
zip -r "NoobTacoUI-Media-$CURRENT_VERSION.zip" NoobTacoUI-Media/
cd ..

echo
echo "🎉 Release build complete!"
echo "📁 Package location: .release/NoobTacoUI-Media/"
echo "📦 ZIP file: .release/NoobTacoUI-Media-$CURRENT_VERSION.zip"
echo
echo "To test the addon:"
echo "1. Copy .release/NoobTacoUI-Media/ to your WoW AddOns folder"
echo "2. In-game, type: /ntm version"
echo "3. Version should display as: $CURRENT_VERSION"
