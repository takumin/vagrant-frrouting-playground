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
- addr: '10.0.0.2'
  mask: '255.255.255.0'
  name: 'vagrant-frr1'
- addr: '10.0.1.2'
  mask: '255.255.255.0'
  name: 'vagrant-frr2'

#
# FRRouting Configuration
#
frrouting:
  enabled:
    zebra: true
    bgpd: true
    bfdd: true
  options:
    zebra: ['-A', '127.0.0.1', '-s', '90000000', '-M', 'fpm']
    bgpd: ['-A', '127.0.0.1', '-l', '127.0.0.1', '-p', '179']
    bfdd: ['-A', '127.0.0.1']
  config:
    frr: |-
      log syslog informational
```
