---
layout: muse
radio: abcc
title: Australia ABC Classic
---
{% assign radio_data = site.data.radios | where:"id", page.radio %}
{% assign radio = radio_data | first %}  
<!-- BEGINS: AUTO-GENERATED MUSES RADIO PLAYER CODE -->
<script type="text/javascript" src="https://hosted.muses.org/mrp.js"></script>
<script type="text/javascript">
MRP.insert({
'url':'{{ radio.stream }};',
'codec':'{{ radio.codec }}',
'volume':100,
'autoplay':true,
'forceHTML5':true,
'jsevents':true,
'buffering':0,
'title':'{{ radio.name }}',
'wmode':'transparent',
'skin':'original',
'width':329,
'height':21
});
</script>
<!-- ENDS: AUTO-GENERATED MUSES RADIO PLAYER CODE -->

