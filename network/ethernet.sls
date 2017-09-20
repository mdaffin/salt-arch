ethernet.packages:
  pkg.installed:
    - pkgs:
      - ifplugd

{%- set ethernet_interfaces =  salt.network.interfaces() %}
{%- for interface, data in ethernet_interfaces.iteritems() %}
{%- if interface.startswith('enp') or interface.startswith('eth')  %}
/etc/netctl/{{interface}}-dhcp:
  file.managed:
      - content: |
          Description='A basic dhcp ethernet connection'
          Interface={{interface}}
          Connection=ethernet
          IP=dhcp
{%- if pillar['bootstrap'] is defined %}
/etc/systemd/system/multi-user.target.wants/netctl-ifplugd@{{ interface }}.service:
  file.symlink:
    - target: /usr/lib/systemd/system/netctl-ifplugd@.service
{%- else %}
netctl-ifplugd@{{ interface }}.service:
  service.running:
    - enable: True
{%- endif %}
{%- endif %}
{%- endfor %}
