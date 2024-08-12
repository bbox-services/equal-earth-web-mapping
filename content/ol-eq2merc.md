---
title: "OpenLayers - Equal Earth / Web Mercator combined"
date: 2024-06-22
updated: 2024-06-22
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@9.1.0/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@9.1.0/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/ol-mapbox-style@12.3.1/dist/olms.js"></script>
  js: |
    olms.apply('map', 'https://equal.bbox.earth/natural-earth-countries-style-eq2merc.json');
---

OpenLayers map with Equal Earth tiles at z0-z2 and Web Mercator tiles at z > 2 on Web Mercator tile grid. Vector tiles styled with GL JSON.
