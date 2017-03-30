{%- for user in pillar.get('users', {}) %}
    {%- if user.files is defined %}
    {%- for file in user.files %}
"{{ user.name }}-{{ file.name }}":
  file.managed:
    - name: {{ salt['user.info'](user.name).home }}/{{ file.name }}
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
