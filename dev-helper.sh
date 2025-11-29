#!/bin/bash
# Convenience script to run development tasks

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV_SCRIPTS_DIR="$SCRIPT_DIR/dev/scripts"

case "$1" in
    "test")
        echo "🧪 Running tests..."
        cd "$DEV_SCRIPTS_DIR" && make test
        ;;
    "check-lua")
        echo "🔍 Running Lua checks..."
        "$DEV_SCRIPTS_DIR/check-lua.sh"
        ;;
    "build")
        echo "📦 Building package..."
        cd "$DEV_SCRIPTS_DIR" && make package
        ;;
    "libs")
        echo "📥 Updating libraries..."
        cd "$DEV_SCRIPTS_DIR" && make libs
        ;;
    "clean")
        echo "🧹 Cleaning up..."
        cd "$DEV_SCRIPTS_DIR" && make clean
        ;;
    *)
        echo "NoobTacoUI Development Helper"
        echo ""
        echo "Usage: $0 <command>"
        echo ""
        echo "Commands:"
        echo "  test      - Run addon structure tests"
        echo "  check-lua - Run Lua syntax and static analysis"
        echo "  build     - Build addon package"
        echo "  libs      - Update external libraries"
        echo "  clean     - Clean up build artifacts"
        echo ""
        echo "For more options, see dev/scripts/Makefile"
        ;;
esac
