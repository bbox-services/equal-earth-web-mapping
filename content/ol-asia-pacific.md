---
title: "OpenLayers - Equal Earth Asia-Pacific"
date: 2024-05-01
updated: 2024-05-01
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@10/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@10/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/ol-mapbox-style@12/dist/olms.js"></script>
  js: |
    olms.apply('map', 'https://equal.bbox.earth/natural-earth-countries-style-asia-pacific.json')
---

OpenLayers map using Web Mercator tile grid. Vector tiles styled with GL JSON.
