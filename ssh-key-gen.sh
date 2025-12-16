#!/bin/bash
KEY_DIR="./ssh-keys"

mkdir -p "$KEY_DIR"

KEY_PATH="$KEY_DIR/id_ansible"

if [ -f "$KEY_PATH" ]; then
    echo "SSH key already exists at $KEY_PATH"
else
    echo "Generating new SSH key pair at $KEY_PATH..."
    ssh-keygen -t ed25519 -f "$KEY_PATH" -N "" -C "ansible@$(hostname)"
    echo "SSH key generated successfully!"
fi

echo "Your public key is:"
cat "${KEY_PATH}.pub"