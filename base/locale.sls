us_locale:
  locale.present:
    - name: en_US.UTF-8 UTF-8

uk_locale:
  locale.present:
    - name: en_GB.UTF-8 UTF-8

default_locale:
  file.managed:
    - name: /etc/locale.conf
    - contents: 'LANG=en_GB.UTF-8'

uk_keyboard:
{% if pillar['bootstrap'] is defined %}
  file.managed:
    - name: /etc/vconsole.conf
    - contents: 'KEYMAP=uk'
{% else %}
  keyboard.system:
    - name: uk
{% endif %}
