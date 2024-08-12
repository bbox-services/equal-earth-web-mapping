---
title: "MapLibre - Web Mercator grid"
date: 2024-04-22
updated: 2024-04-24
template: "mapviewer.html"
extra:
  header: |
    <script src='https://unpkg.com/maplibre-gl@4.1.3/dist/maplibre-gl.js'></script>
    <link href='https://unpkg.com/maplibre-gl@4.1.3/dist/maplibre-gl.css' rel='stylesheet' />
  js: |
    var map = new maplibregl.Map({
      container: 'map',
      style: 'https://equal.bbox.earth/natural-earth-countries-style.json'
    });
---

MapLibre map using Web Mercator tile grid. Vector tiles styled with GL JSON.
