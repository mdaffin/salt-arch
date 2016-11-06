xorg:
  pkg.installed:
    - pkgs:
      - xorg-server
      - xorg-server-utils
      - xf86-input-synaptics
      - xf86-input-libinput

gpus:
  pkg.installed:
    - pkgs:
{% for gpu in grains['gpus'] %}
{% if gpu.vendor == 'intel' %}
      - xf86-video-intel
{% elif gpu.vendor == 'nvidia' %}
      - xf86-video-nouveau
      - nvidia
{% else %}
      - xf86-video-vesa
{% endif %}
{% endfor %}

uk_keyboard_xorg:
  file.managed:
    - name: /etc/X11/xorg.conf.d/00-keyboard.conf
    - contents: |
        Section "InputClass"
                Identifier "system-keyboard"
                MatchIsKeyboard "on"
                Option "XkbLayout" "gb"
        EndSection
    - require:
      - xorg
