---
title: "OpenLayers - Web Mercator grid"
date: 2024-04-22
updated: 2024-04-24
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@10/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@10/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/ol-mapbox-style@12/dist/olms.js"></script>
  js: |
    olms.apply('map', 'https://equal.bbox.earth/natural-earth-countries-style.json');
---

OpenLayers map using Web Mercator tile grid. Vector tiles styled with GL JSON.
