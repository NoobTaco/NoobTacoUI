#!/bin/bash

# Update LibSharedMedia-3.0 script for NoobTacoUI-Media
# Based on ElvUI's approach using BigWigsMods packager
# Usage: ./update-libs.sh

set -e

PACKAGER_URL="https://raw.githubusercontent.com/BigWigsMods/packager/master/release.sh"
LIB_DIR="Libraries/LibSharedMedia-3.0"
TEMP_DIR="$(mktemp -d)"

echo "🔄 Updating LibSharedMedia-3.0 using BigWigsMods packager..."

# Create a temporary .pkgmeta file for the packager
cat > "$TEMP_DIR/.pkgmeta" << 'EOF'
package-as: NoobTacoUI-Media

externals:
    Libraries/LibSharedMedia-3.0:
        url: https://github.com/Stanzilla/LibSharedMedia-3.0.git
        tag: latest

enable-nolib-creation: no
ignore:
    - "*.md"
    - ".git*"
EOF

# Create minimal addon structure in temp dir
mkdir -p "$TEMP_DIR/Libraries"
cp "$TEMP_DIR/.pkgmeta" .

echo "📥 Running BigWigsMods packager..."
curl -s "$PACKAGER_URL" | bash -s -- -c -d -z -m "$TEMP_DIR/.pkgmeta"

# Check if the update was successful
if [ -d ".release/NoobTacoUI-Media/Libraries/LibSharedMedia-3.0" ]; then
    echo "📦 Installing updated library..."
    
    # Remove old library if it exists
    if [ -d "$LIB_DIR" ]; then
        echo "🗑️  Removing old version..."
        rm -rf "$LIB_DIR"
    fi
    
    # Copy the new version
    cp -r ".release/NoobTacoUI-Media/Libraries/LibSharedMedia-3.0" "Libraries/"
    
    # Cleanup
    rm -rf ".release"
    rm -f "$TEMP_DIR/.pkgmeta"
    rmdir "$TEMP_DIR" 2>/dev/null || true
    
    echo "✅ LibSharedMedia-3.0 updated successfully!"
    echo "📋 Library updated to latest release version"
    echo "🔧 Don't forget to test your addon and commit the changes"
else
    echo "❌ Failed to download library update"
    rm -rf ".release" "$TEMP_DIR"
    exit 1
fi
