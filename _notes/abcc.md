---
layout: muse
radio: abcc
title: Australia ABC Classic
---
{% assign radio = site.data.radios.[page.radio] %}
  {% for item in radio.items %} 
## [{{ item.name }}]({{ item.website }})
<!-- BEGINS: AUTO-GENERATED MUSES RADIO PLAYER CODE -->
<script type="text/javascript" src="https://hosted.muses.org/mrp.js"></script>
<script type="text/javascript">
MRP.insert({
'url':'{{ item.stream }};',
'codec':'{{ item.codec }}',
'volume':100,
'autoplay':true,
'forceHTML5':true,
'jsevents':true,
'buffering':0,
'title':'{{ item.name }}',
'wmode':'transparent',
'skin':'original',
'width':329,
'height':21
});
</script>
<!-- ENDS: AUTO-GENERATED MUSES RADIO PLAYER CODE -->
  {% endfor %} 
