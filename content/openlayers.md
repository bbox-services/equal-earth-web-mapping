---
title: "OpenLayers"
date: 2024-04-22
updated: 2024-04-22
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@8.2.0/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@8.2.0/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/ol-mapbox-style@12.2.0/dist/olms.js"></script>
  js: |
    olms.apply('map', location.origin + '/natural-earth-countries-style.json');
---
