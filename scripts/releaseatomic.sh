#!/bin/bash
# releaseatomic.sh - Atomic release deployment script for Atlas satellite launches
# This script handles the atomic deployment of satellite releases

set -e  # Exit on error
set -u  # Exit on undefined variable

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Script configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
RELEASE_DIR="${PROJECT_ROOT}/releases"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Display banner
display_banner() {
    cat << "EOF"
    _  _____ _       _    ___  
   / \|_   _| | __ _| |  / _ \ 
  / _ \ | | | |/ _` | | | | | |
 / ___ \| | | | (_| | | | |_| |
/_/   \_\_| |_|\__,_|_|  \___/ 
                                
Release Atomic Deployment System
EOF
    echo ""
}

# Validate environment
validate_environment() {
    log_info "Validating environment..."
    
    if [ ! -d "${PROJECT_ROOT}" ]; then
        log_error "Project root not found: ${PROJECT_ROOT}"
        exit 1
    fi
    
    log_success "Environment validated"
}

# Create release directory
prepare_release() {
    log_info "Preparing release structure..."
    
    mkdir -p "${RELEASE_DIR}"
    mkdir -p "${RELEASE_DIR}/${TIMESTAMP}"
    
    log_success "Release directory created: ${RELEASE_DIR}/${TIMESTAMP}"
}

# Package artifacts
package_artifacts() {
    log_info "Packaging satellite artifacts..."
    
    local release_path="${RELEASE_DIR}/${TIMESTAMP}"
    
    # Copy templates
    if [ -d "${PROJECT_ROOT}/templates" ]; then
        cp -r "${PROJECT_ROOT}/templates" "${release_path}/"
        log_info "Templates packaged"
    fi
    
    # Copy cycles
    if [ -d "${PROJECT_ROOT}/cycles" ]; then
        cp -r "${PROJECT_ROOT}/cycles" "${release_path}/"
        log_info "Cycles packaged"
    fi
    
    # Copy scrolls
    if [ -d "${PROJECT_ROOT}/scrolls" ]; then
        cp -r "${PROJECT_ROOT}/scrolls" "${release_path}/"
        log_info "Scrolls packaged"
    fi
    
    # Copy guides
    if [ -d "${PROJECT_ROOT}/guides" ]; then
        cp -r "${PROJECT_ROOT}/guides" "${release_path}/"
        log_info "Guides packaged"
    fi
    
    log_success "Artifacts packaged successfully"
}

# Create release manifest
create_manifest() {
    log_info "Creating release manifest..."
    
    local manifest_file="${RELEASE_DIR}/${TIMESTAMP}/MANIFEST.txt"
    
    cat > "${manifest_file}" << EOF
Atlas Satellite Release Manifest
================================
Release ID: ${TIMESTAMP}
Release Date: $(date)
Project Root: ${PROJECT_ROOT}

Contents:
EOF
    
    find "${RELEASE_DIR}/${TIMESTAMP}" -type f | while read -r file; do
        echo "  - ${file#${RELEASE_DIR}/${TIMESTAMP}/}" >> "${manifest_file}"
    done
    
    log_success "Manifest created: ${manifest_file}"
}

# Verify release integrity
verify_release() {
    log_info "Verifying release integrity..."
    
    local release_path="${RELEASE_DIR}/${TIMESTAMP}"
    local file_count=$(find "${release_path}" -type f | wc -l)
    
    if [ "${file_count}" -lt 1 ]; then
        log_error "Release verification failed: No files found"
        exit 1
    fi
    
    log_success "Release verified: ${file_count} files packaged"
}

# Tag release
tag_release() {
    log_info "Tagging release..."
    
    local tag_file="${RELEASE_DIR}/LATEST"
    echo "${TIMESTAMP}" > "${tag_file}"
    
    log_success "Release tagged as LATEST: ${TIMESTAMP}"
}

# Main execution
main() {
    display_banner
    
    log_info "Starting atomic release deployment..."
    log_info "Release timestamp: ${TIMESTAMP}"
    
    validate_environment
    prepare_release
    package_artifacts
    create_manifest
    verify_release
    tag_release
    
    echo ""
    log_success "==================================="
    log_success "Atomic release completed successfully!"
    log_success "Release ID: ${TIMESTAMP}"
    log_success "Location: ${RELEASE_DIR}/${TIMESTAMP}"
    log_success "==================================="
}

# Run main function
main "$@"
