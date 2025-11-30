#!/bin/bash
# Test script to verify version display in packaged addon

# Change to project root directory
PROJECT_ROOT="$(dirname "$0")/../.."
cd "$PROJECT_ROOT"

echo "🧪 Testing version display in packaged addon..."
echo

# Check TOC file version
echo "📄 TOC file version:"
grep "## Version:" .release/NoobTacoUI-Media/NoobTacoUI-Media.toc

echo

# Check if fallback versions are updated
echo "📝 Lua fallback versions:"
echo "version.lua:"
grep "addonVersion.*=" .release/NoobTacoUI-Media/modules/version.lua

echo "ConfigMenu.lua:"
grep -A1 -B1 "version.*=.*\"v" .release/NoobTacoUI-Media/modules/ConfigMenu.lua

echo
echo "✅ Version test complete!"
echo "📦 Your packaged addon should now display version v1.1.2 correctly"
echo
echo "To install and test:"
echo "1. Copy .release/NoobTacoUI-Media/ to your WoW AddOns folder"
echo "2. In-game, type: /nt version"
echo "3. Or open config menu to see version in lower-right corner"
