{% set packages = pillar.get("packages", []) %}

{% for package in packages %}
package-{{package}}:
  pkg.installed:
    - name: {{package}}
{% endfor %}
