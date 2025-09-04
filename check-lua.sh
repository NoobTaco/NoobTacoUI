#!/bin/bash

# NoobTacoUI-Media Lua Check Script
# This script runs comprehensive Lua checks on the project

echo "🔍 Running Lua checks for NoobTacoUI-Media..."
echo

# Check if luacheck is available
if ! command -v "$HOME/.luarocks/bin/luacheck" &> /dev/null; then
    echo "❌ luacheck not found. Please install it with: luarocks install --local luacheck"
    exit 1
fi

# Check if lua is available
if ! command -v lua &> /dev/null; then
    echo "❌ lua not found. Please install lua"
    exit 1
fi

echo "📋 1. Running syntax check with luac..."
find . -name "*.lua" -not -path "./Libraries/*" -exec luac -p {} \; 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Syntax check passed"
else
    echo "❌ Syntax errors found"
    exit 1
fi

echo
echo "📋 2. Running static analysis with luacheck..."
$HOME/.luarocks/bin/luacheck .
if [ $? -eq 0 ]; then
    echo "✅ Static analysis passed"
else
    echo "❌ Static analysis found issues"
    exit 1
fi

echo
echo "🎉 All Lua checks passed!"
