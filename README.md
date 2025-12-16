# Proxmox VM Provisioning with Ansible

---

## Setup

1. **Generate SSH keys**:

```bash
bash bash/ssh-key-gen.sh
```

2. **Configure Variables** in `group_vars/all.yml`:

---

## Create Proxmox Template VM

Follow the detailed instructions in this Google Doc:
[How to Create Proxmox Template VM](https://docs.google.com/document/d/1VTU_fT-Q2j417OONdcVRyHn8XKupkVmZOhkHYJMysKs/edit?tab=t.0)

Related repository: [SRE-Ansible by Phasit Udompanish](https://github.com/PasitU/SRE-Ansible)

**Special thanks to [Phasit Udompanish](https://github.com/PasitU) for the original documentation.**

---

## Provision VMs

Run the main script:

```bash
bash start.sh
```
# int531-ansible
