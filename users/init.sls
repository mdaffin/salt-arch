{%- for user in pillar.get('users', {}) %}
{{ user.name }}:
  user.present:
    {%- for key, value in user.items() %}
    - {{ key }}: {{ value | yaml }}
    {%- endfor %}
{% endfor %}
