Europe/London:
{% if pillar['bootstrap'] is defined %}
  file.symlink:
    - name: /etc/localtime
    - target: /usr/share/zoneinfo/Europe/London
{% else %}
  timezone.system
{% endif %}
