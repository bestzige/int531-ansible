#!/bin/bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "🚀 Start provisioning"

# Generate SSH key
bash "${PROJECT_ROOT}/bash/ssh-key-gen.sh"

# Install required collections (Ensured commands are on separate lines for shell)
ansible-galaxy collection install community.proxmox
ansible-galaxy collection install community.docker

# Run playbook
ansible-playbook "${PROJECT_ROOT}/playbook.yml"