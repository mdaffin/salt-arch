{%- for user in pillar.get('users', {}) %}
    {% set user_info = salt['user.info'](user.name) %}
    {%- if user_info.home is defined %}
    {%- set homedir = user_info %}
    {%- else %}
    {%- set homedir = "/home/" + user.name %}
    {%- endif %}

    {%- if user.files is defined %}
    {%- for file in user.files %}
"{{ user.name }}-{{ file.name }}":
  file.managed:
    - name: {{ homedir }}/{{ file.name }}
    - source: {{ file.source }}
    {%- if file.source_hash is defined %}
    - source_hash: {{ file.source_hash }}
    {%- else %}
    - skip_verify: True
    {%- endif %}
    - template: jinja
    - context: {{ user }}
    - makedirs: True
    - user: {{ user.name }}
    - group: {{ user.name }}
    - require:
      - {{ user.name }}
      {%- if file.cmd is defined %}
  cmd.run:
    - name: '{{ file.cmd }}'
    - runas: {{ user.name }}
    - onchanges:
      - file: "{{ user.name }}-{{ file.name }}"
      {% endif %}
    {%- endfor %}
    {%- endif %}
{% endfor %}
