{%- for user in pillar.get('users', {}) %}
{{ user.name }}:
  user.present:
    {%- for key, value in user.items() %}
    {%- if key != "files" and key != "extra" %}
    - {{ key }}: {{ value | yaml }}
    {%- endif %}
    {%- endfor %}
    
    {%- if user.files is defined %}
    {%- for file in user.files %}
{% endfor %}

include:
  - users.configs
