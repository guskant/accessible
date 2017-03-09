---
layouts:  default
title:  test
---
 notes for blind or dyslexia Japanese speakers.
 {% for page in site.pages %}
- [{{ page.title }}]({{ page.url }})
 {% endfor %}
