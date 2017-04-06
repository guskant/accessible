---
<meta name="viewport" content="width=device-width, initial-scale=1">
---
## list of notes.
  {% for page in site.notes %}
- [{{ page.title }}](/accessible{{ page.url }}) {% endfor %}


<time datetime="{{ site.time | date_to_xmlschema }}" pubdate="pubdate">{{ site.time | date: "%Y-%m-%d %T %Z" }}</time>
