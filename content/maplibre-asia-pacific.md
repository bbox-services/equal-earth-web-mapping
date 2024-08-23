---
title: "MapLibre - Equal Earth Asia-Pacific"
date: 2024-05-01
updated: 2024-05-01
template: "mapviewer.html"
extra:
  header: |
    <script src='https://unpkg.com/maplibre-gl@4/dist/maplibre-gl.js'></script>
    <link href='https://unpkg.com/maplibre-gl@4/dist/maplibre-gl.css' rel='stylesheet' />
  js: |
    var map = new maplibregl.Map({
      container: 'map',
      style: 'https://equal.bbox.earth/natural-earth-countries-style-asia-pacific.json'
    });
---

MapLibre map using Web Mercator tile grid. Vector tiles styled with GL JSON.
