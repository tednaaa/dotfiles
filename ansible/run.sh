#!/bin/bash

# Arch Linux Setup Automation Script
# Convenience wrapper for Ansible playbooks

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if ansible is installed
check_ansible() {
    if ! command -v ansible-playbook &> /dev/null; then
        print_error "Ansible is not installed!"
        print_info "Please install ansible first: sudo pacman -S ansible"
        exit 1
    fi
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  full        Run complete Arch Linux setup (KDE, development tools, Rust, symm)"
    echo "  rust        Install Rust (via rustup) and symm only"
    echo "  dotfiles    Set up dotfiles management only"
    echo "  check       Check Ansible installation and configuration"
    echo "  help        Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 full        # Complete system setup"
    echo "  $0 rust        # Just install Rust and symm"
    echo "  $0 dotfiles    # Just set up dotfiles"
    echo ""
}

# Function to run playbook with error handling
run_playbook() {
    local playbook="$1"
    local description="$2"

    print_info "Starting: $description"
    print_info "Running playbook: $playbook"

    if ansible-playbook "$playbook" --ask-become-pass; then
        print_success "$description completed successfully!"
        return 0
    else
        print_error "$description failed!"
        return 1
    fi
}

# Function to check system requirements
check_requirements() {
    print_info "Checking system requirements..."

    # Check if running on Arch Linux
    if [[ ! -f /etc/arch-release ]]; then
        print_warning "This script is designed for Arch Linux"
        read -p "Continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi

    # Check if user has sudo access
    if ! sudo -n true 2>/dev/null; then
        print_info "You will need sudo access for system package installation"
    fi

    # Check ansible version
    local ansible_version=$(ansible-playbook --version | head -n1)
    print_info "Found: $ansible_version"
}

# Main execution
main() {
    case "${1:-}" in
        "full")
            check_ansible
            check_requirements
            print_info "Running complete Arch Linux setup..."
            print_warning "This will install KDE, development tools, Rust, and configure dotfiles"
            read -p "Continue? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                run_playbook "site.yml" "Complete Arch Linux setup"
                print_success "Setup complete! Please reboot to start using SDDM."
            fi
            ;;
        "rust")
            check_ansible
            print_info "Installing Rust (via rustup) and symm..."
            run_playbook "rust-setup.yml" "Rust and symm installation"
            ;;
        "dotfiles")
            check_ansible
            print_info "Setting up dotfiles management..."
            if [[ ! -d "$HOME/dotfiles" ]]; then
                print_warning "Dotfiles directory not found at $HOME/dotfiles"
                print_info "Please clone your dotfiles repository first:"
                print_info "git clone <your-dotfiles-repo> ~/dotfiles"
                read -p "Continue anyway? (y/N): " -n 1 -r
                echo
                if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                    exit 1
                fi
            fi
            run_playbook "dotfiles.yml" "Dotfiles setup"
            ;;
        "check")
            check_ansible
            check_requirements
            print_info "Configuration files:"
            ls -la *.yml *.cfg *.ini 2>/dev/null || true
            print_success "System check complete!"
            ;;
        "help"|"--help"|"-h")
            show_usage
            ;;
        "")
            print_error "No option provided!"
            echo ""
            show_usage
            exit 1
            ;;
        *)
            print_error "Unknown option: $1"
            echo ""
            show_usage
            exit 1
            ;;
    esac
}

main "$@"
