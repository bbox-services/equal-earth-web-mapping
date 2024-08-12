---
title: "OpenLayers - Equal Earth Americas"
date: 2024-05-01
updated: 2024-05-01
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@9.1.0/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@9.1.0/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/ol-mapbox-style@12.3.1/dist/olms.js"></script>
  js: |
    olms.apply('map', 'https://equal.bbox.earth/natural-earth-countries-style-americas.json')
---

OpenLayers map using Web Mercator tile grid. Vector tiles styled with GL JSON.
