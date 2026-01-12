#!/bin/bash
# NoobTaco-Config Sync Utility
# This script copies the library files into NoobTacoUI for local development.

# --- Configuration ---
# Update this path to point to your NoobTacoUI repository
TARGET_DIR="/mnt/e/Development/Active/NoobTacoUI/Libraries/NoobTaco-Config"

# --- Logic ---
echo "--- NoobTaco-Config Sync ---"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory not found: $TARGET_DIR"
    echo "Creating directory..."
    mkdir -p "$TARGET_DIR"
fi

echo "Syncing Internal, Themes, and Media to $TARGET_DIR..."

# Sync Internal
rsync -av --delete Internal/ "$TARGET_DIR/Internal/"

# Sync Themes
rsync -av --delete Themes/ "$TARGET_DIR/Themes/"

# Sync Media
rsync -av --delete Media/ "$TARGET_DIR/Media/"

# Sync Root Lua Files
cp NoobTaco-Config.lua "$TARGET_DIR/"
cp LICENSE "$TARGET_DIR/"

echo "Sync Complete!"
