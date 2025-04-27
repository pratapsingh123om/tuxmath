#!/bin/bash

# Set paths
TUXMATH_DIR="/mnt/c/Users/gajen/tuxmath"
T4K_DIR="/mnt/c/Users/gajen/t4kcommon"
BUILD_DIR="${TUXMATH_DIR}/build_wsl"
ERROR_DIR="${TUXMATH_DIR}/error_logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create error directory if it doesn't exist
mkdir -p "${ERROR_DIR}"

# Function to log errors
log_error() {
    local error_type=$1
    local error_content=$2
    local error_file="${ERROR_DIR}/${error_type}_${TIMESTAMP}.log"
    echo "=== Error occurred at $(date) ===" > "${error_file}"
    echo "${error_content}" >> "${error_file}"
    echo "Error logged to: ${error_file}"
}

echo "=== Starting TuxMath Build Process ==="
echo "Build directory: ${BUILD_DIR}"
echo "Error logs will be saved to: ${ERROR_DIR}"

# Clean and create build directory
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"

# Setup t4k_common files
echo "=== Setting up t4k_common files ==="
T4K_FILES=(
    "src/t4k_common.h"
    "src/t4k_main.c"
    "src/t4k_alphasort.h"
    "src/linebreak/uniwidth/width.c"
    "src/t4k_audio.c"
    "src/t4k_convert_utf.c"
    "src/t4k_linewrap.c"
    "src/t4k_loaders.c"
    "src/t4k_menu.c"
    "src/t4k_pixels.c"
    "src/t4k_replacements.c"
    "src/t4k_sdl.c"
    "src/t4k_throttle.c"
)

for file in "${T4K_FILES[@]}"; do
    src_file="${T4K_DIR}/${file}"
    dest_file="${BUILD_DIR}/$(basename ${file})"
    if [ -f "${src_file}" ]; then
        cp "${src_file}" "${dest_file}"
        echo "✓ Copied: $(basename ${file})"
    else
        log_error "t4k_setup" "Missing t4k_common file: ${file}"
        echo "❌ Missing t4k_common file: ${file}"
        exit 1
    fi
done

cd "${BUILD_DIR}" || {
    log_error "directory_access" "Failed to access build directory"
    exit 1
}

# Run CMake configuration
echo "=== Running CMake Configuration ==="
CMAKE_OUTPUT=$(cmake .. -DCMAKE_BUILD_TYPE=Debug 2>&1)
CMAKE_RESULT=$?

if [ $CMAKE_RESULT -ne 0 ]; then
    log_error "cmake_configuration" "CMake configuration failed:\n${CMAKE_OUTPUT}"
    echo "❌ CMake configuration failed. See error log for details."
    exit 1
fi
echo "✓ CMake configuration successful"

# Run make with detailed error capture
echo "=== Running Make ==="
MAKE_OUTPUT=$(make VERBOSE=1 2>&1)
MAKE_RESULT=$?

if [ $MAKE_RESULT -ne 0 ]; then
    # Extract different types of errors
    COMPILER_ERRORS=$(echo "${MAKE_OUTPUT}" | grep -A 2 "error:" || true)
    LINKER_ERRORS=$(echo "${MAKE_OUTPUT}" | grep -A 2 "undefined reference" || true)
    MISSING_FILES=$(echo "${MAKE_OUTPUT}" | grep -A 2 "No such file" || true)
    CMAKE_ERRORS=$(echo "${MAKE_OUTPUT}" | grep -A 2 "CMake Error" || true)
    DEPRECATED_WARNINGS=$(echo "${MAKE_OUTPUT}" | grep -A 2 "Deprecation Warning" || true)

    # Log different types of errors separately
    if [ ! -z "${COMPILER_ERRORS}" ]; then
        log_error "compiler" "${COMPILER_ERRORS}"
    fi
    if [ ! -z "${LINKER_ERRORS}" ]; then
        log_error "linker" "${LINKER_ERRORS}"
    fi
    if [ ! -z "${MISSING_FILES}" ]; then
        log_error "missing_files" "${MISSING_FILES}"
    fi
    if [ ! -z "${CMAKE_ERRORS}" ]; then
        log_error "cmake_errors" "${CMAKE_ERRORS}"
    fi
    if [ ! -z "${DEPRECATED_WARNINGS}" ]; then
        log_error "deprecated" "${DEPRECATED_WARNINGS}"
    fi
    
    # Log complete output
    log_error "full_build" "${MAKE_OUTPUT}"
    
    echo "❌ Build failed. Error logs have been created in ${ERROR_DIR}"
    echo "The following error logs were generated:"
    ls -l "${ERROR_DIR}/*_${TIMESTAMP}.log"
    exit 1
fi

echo "✓ Build completed successfully"

# If we get here, build was successful
echo "=== Build Summary ==="
echo "✓ CMake configuration: Success"
echo "✓ T4K Common files: All present"
echo "✓ Make build: Success"
echo "Build completed successfully! 🎉" 