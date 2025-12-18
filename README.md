# Proxmox VM Provisioning with Ansible

## Setup

1. **Generate SSH keys**

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
```

2. **Install Ansible and required collections / roles**

```bash
ansible-galaxy collection install -r requirements.yml
```

3. **Configure inventory and SSH access**

Ensure SSH key-based access works to all hosts:

```bash
ssh -i ~/.ssh/id_rsa <username>@<host-ip>
```

Verify Ansible connectivity:

```bash
ansible all -m ping
```

4. **Run Ansible playbook**

```bash
ansible-playbook playbooks/site.yml -v
```

---

## Create Proxmox Template VM

Follow the detailed instructions in this Google Doc:
[How to Create Proxmox Template VM](https://docs.google.com/document/d/1VTU_fT-Q2j417OONdcVRyHn8XKupkVmZOhkHYJMysKs/edit?tab=t.0)

Related repository: [SRE-Ansible by Phasit Udompanish](https://github.com/PasitU/SRE-Ansible)

**Special thanks to [Phasit Udompanish](https://github.com/PasitU) for the original documentation.**

---

## Prometheus & Node Exporter Setup

This project deploys **Prometheus** and **Node Exporter** using **Ansible**.

### Prometheus Host

- Prometheus runs on the `prometheus-main` host
- Target configuration is generated automatically by Ansible
- Targets file location:

  ```text
  /etc/prometheus/targets/node_exporter.json
  ```

#### Prometheus scrape configuration

Prometheus is configured to discover Node Exporter targets dynamically using **file-based service discovery**:

```yaml
- job_name: node_exporter
  file_sd_configs:
    - files:
        - /etc/prometheus/targets/*.json
      refresh_interval: 5s
```

### Node Exporter

- Installed on all provisioned VMs
- Exposes metrics on port **9100**
- Runs as a systemd service

### Reload Prometheus Configuration

Prometheus is reloaded automatically via an Ansible handler.

Manual reload (if needed):

```bash
curl -X POST http://localhost:9090/-/reload
```

> ⚠️ Prometheus must be started with:
>
> ```
> --web.enable-lifecycle
> ```

---

## Verification

### Check Node Exporter on a VM

```bash
curl http://localhost:9100/metrics
```

### Check Prometheus Targets

Open in a browser:

```text
http://<prometheus-ip>:9090/targets
```

All Node Exporter targets should show **UP**.

---

## Notes

- SSH key authentication is required

- Passwordless sudo is recommended for Ansible:

  ```bash
  sudo visudo
  dev ALL=(ALL) NOPASSWD:ALL
  ansible ALL=(ALL) NOPASSWD:ALL
  ubuntu ALL=(ALL) NOPASSWD:ALL
  sysadmin ALL=(ALL) NOPASSWD:ALL
  ```

- The Prometheus reload endpoint has no authentication — secure it in production

---
