#!/bin/bash
set -euo pipefail

# Determine project root to ensure files are placed correctly regardless of CWD
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# Assuming the script is inside a 'bash' folder one level down from the project root
PROJECT_ROOT="$(dirname "${SCRIPT_DIR}")"

ROLE_DIR="${PROJECT_ROOT}/roles/proxmox"
KEY_DIR="${ROLE_DIR}/files"
KEY_NAME="ansible_ed25519"

PRIVATE_KEY="${KEY_DIR}/${KEY_NAME}"
PUBLIC_KEY="${PRIVATE_KEY}.pub"

echo "🔐 SSH key generation"

mkdir -p "${KEY_DIR}"

if [ -f "${PRIVATE_KEY}" ]; then
  echo "✅ SSH key already exists"
  exit 0
fi

ssh-keygen -t ed25519 -f "${PRIVATE_KEY}" -N "" -C "ansible@proxmox"
chmod 600 "${PRIVATE_KEY}"
chmod 644 "${PUBLIC_KEY}"

echo "🎉 SSH key generated"