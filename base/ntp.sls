ntp:
  pkg.installed: []
{% if pillar['bootstrap'] is defined %}
  file.symlink:
    - name: /etc/systemd/system/multi-user.target.wants/ntpd.service
    - target: /usr/lib/systemd/system/ntpd.service
{% else %}
  service.running:
    - name: ntpd
    - enable: True
    - require:
      - pkg: ntp
{% endif %}
