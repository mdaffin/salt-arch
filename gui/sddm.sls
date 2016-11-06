sddm:
  pkg.installed: []
{% if pillar['bootstrap'] is defined %}
  file.symlink:
    - name: /etc/systemd/system/multi-user.target.wants/sddm.service
    - target: /usr/lib/systemd/system/sddm.service
{% else %}
  service.running:
    - enable: True
{% endif %}
    - require:
      - pkg: sddm
