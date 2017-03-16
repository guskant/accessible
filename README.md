## list of notes.
  {% for page in site.notes %}
- [{{ page.title }}](/accessible{{ page.url }}) {% endfor %}

{{ site.time | date: %Y-%m-%d %T%Z }}
