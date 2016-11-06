wireless.packages:
  pkg.installed:
    - pkgs:
      - wpa_supplicant
      - wpa_actiond
      - dialog

{%- set wireless_interfaces =  salt['iwtools.list_interfaces']() %}
{%- for interface, data in wireless_interfaces.iteritems() %}
{%- if pillar['bootstrap'] is defined %}
/etc/systemd/system/multi-user.target.wants/netctl-auto@{{ interface }}.service:
  file.symlink:
    - target: /usr/lib/systemd/system/netctl-auto@.service
{%- else %}
netctl-auto@{{ interface }}.service:
  service.running:
    - enable: True
{%- endif %}
{%- endfor %}
