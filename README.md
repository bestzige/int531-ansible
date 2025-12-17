@ -1,28 +0,0 @@

# Proxmox VM Provisioning with Ansible

---

## Setup

1. **Generate SSH keys**:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
```

2. **Install Ansible and required collections**:

```bash
ansible-galaxy role install -r requirements.yml
```

3. **Run ansible playbook**:

```bash
ansible-playbook playbooks/site.yml -v
```

---

## Create Proxmox Template VM

Follow the detailed instructions in this Google Doc:
[How to Create Proxmox Template VM](https://docs.google.com/document/d/1VTU_fT-Q2j417OONdcVRyHn8XKupkVmZOhkHYJMysKs/edit?tab=t.0)

Related repository: [SRE-Ansible by Phasit Udompanish](https://github.com/PasitU/SRE-Ansible)

**Special thanks to [Phasit Udompanish](https://github.com/PasitU) for the original documentation.**
