Here's a clear, well-structured documentation format you can add to your GitHub repository:

---

# Ansible Playbook Documentation: System Setup

This playbook prepares a Linux system with essential CLI tools and network utilities.

## Playbook Purpose
- Installs text-based web browser (elinks)
- Installs network diagnostic tools
- Runs with elevated privileges
- Targets local machine

## Corrected Playbook Code
```yaml
---
- name: System preparation playbook
  hosts: localhost
  become: yes
  tasks:
    - name: Install CLI web client
      apt:
        name: elinks
        state: latest
        update_cache: yes

    - name: Install network utilities
      apt:
        name: nmap # Corrected package name (original had typo)
        state: latest
```

## Key Components Breakdown

### 1. Play Declaration
```yaml
- name: System preparation playbook
  hosts: localhost
  become: yes
```
| Parameter     | Value         | Purpose                      |
|---------------|---------------|------------------------------|
| `name`        | Descriptive   | Playbook identification      |
| `hosts`       | localhost     | Targets current machine      |
| `become`      | yes           | Uses sudo privileges         |

### 2. Package Installation Tasks
```yaml
tasks:
  - name: Install CLI web client
    apt:
      name: elinks
      state: latest
      update_cache: yes
```
- **Module**: `apt` (Debian/Ubuntu package manager)
- **Parameters**:
  - `name`: Package to install
  - `state: latest`: Ensures newest version
  - `update_cache: yes`: Updates package list first

### 3. Network Utilities Setup
```yaml
  - name: Install network utilities
    apt:
      name: nmap
      state: latest
```
**Common Network Packages**:
- `nmap`: Network discovery/security auditing
- `netcat` (original typo: `nmpa-cat`): Network debugging tool
- `tcpdump`: Packet sniffing
- `iproute2`: Modern networking tools

## Usage Instructions

1. Save as `system_setup.yml`
2. Run playbook:
```bash
ansible-playbook system_setup.yml
```

## Expected Output
```text
PLAY [System preparation playbook] *******************************************

TASK [Gathering Facts] *******************************************************
ok: [localhost]

TASK [Install CLI web client] ************************************************
changed: [localhost]

TASK [Install network utilities] *********************************************
changed: [localhost]

PLAY RECAP *******************************************************************
localhost  : ok=3  changed=2  unreachable=0  failed=0  skipped=0  rescued=0  ignored=0
```

## Security Considerations
1. **Privilege Escalation**: `become: yes` requires sudo access
2. **Package Sources**: Ensure trusted repositories are configured
3. **Auditing**: Review installed packages regularly

## Best Practices
1. **Idempotency**: Check for existing installations first
```yaml
- name: Check if nmap exists
  stat:
    path: /usr/bin/nmap
  register: nmap_installed
```
2. **Variables**: Use variables for package names
```yaml
vars:
  network_tools:
    - nmap
    - netcat
    - tcpdump
```
3. **Tagging**: Add tags for selective execution
```yaml
- name: Install network utilities
  apt:
    name: "{{ item }}"
    state: latest
  loop: "{{ network_tools }}"
  tags: network-tools
```

## Troubleshooting
| Error | Solution |
|-------|----------|
| `FAILED! => Invalid package name` | Check package spelling in repositories |
| `Missing sudo privileges` | Run with `-K` to prompt for sudo password |
| `Package not found` | Update apt cache with `update_cache: yes` |

---

This documentation format provides both technical details and practical usage guidance. You can add it to:
- `docs/PLAYBOOKS.md`
- Repository Wiki
- Accompanying README section

**Important Notes**:
1. Original playbook contained these issues:
   - Indentation errors (space missing after `-` in task names)
   - Typo in package name (`nmpa-cat` → should be `nmap` or `ncat`)
2. Always validate playbook syntax with:
```bash
ansible-playbook --syntax-check system_setup.yml
```
