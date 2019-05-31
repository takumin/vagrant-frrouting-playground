# vagrant-frrouting-playground

FRRouting Playground

# Local Configuration

Create `config/${vagrant-hostname}.yaml` under this repository path.

Example:

```yaml:config/${vagrant-hostname}.yaml
---
#
# Network Configuration
#
network:
- ip: '10.10.10.2'
- ip: '10.10.10.3'

#
# FRRouting Configuration
#
frrouting:
  enabled:
    bgpd: true
```
