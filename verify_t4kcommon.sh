#!/bin/bash

T4K_PATH="/mnt/c/Users/gajen/t4kcommon"
REQUIRED_FILES=(
    "src/t4k_common.h"
    "src/t4k_common.c"
    "src/t4k_alphasort.h"
    "src/linebreak/linebreak.h"
)

REQUIRED_DIRS=(
    "src"
    "src/linebreak"
)

echo "Checking t4kcommon directory structure..."

# Check if base directory exists
if [ ! -d "$T4K_PATH" ]; then
    echo "ERROR: t4kcommon directory not found at $T4K_PATH"
    exit 1
fi

# Check required directories
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ ! -d "$T4K_PATH/$dir" ]; then
        echo "ERROR: Required directory not found: $dir"
        exit 1
    else
        echo "✓ Found directory: $dir"
    fi
done

# Check required files
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$T4K_PATH/$file" ]; then
        echo "ERROR: Required file not found: $file"
        exit 1
    else
        echo "✓ Found file: $file"
    fi
done

# Create symbolic links if they don't exist in the build directory
BUILD_DIR="/mnt/c/Users/gajen/tuxmath/build_wsl"
mkdir -p "$BUILD_DIR"

echo "Creating symbolic links in build directory..."
for file in "${REQUIRED_FILES[@]}"; do
    filename=$(basename "$file")
    if [ ! -f "$BUILD_DIR/$filename" ]; then
        ln -sf "$T4K_PATH/$file" "$BUILD_DIR/$filename"
        echo "✓ Created link for: $filename"
    else
        echo "✓ Link already exists for: $filename"
    fi
done

echo "All required files and directories are present."
echo "Build directory is properly linked to t4kcommon files." 