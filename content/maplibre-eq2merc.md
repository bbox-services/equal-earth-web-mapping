---
title: "MapLibre - Equal Earth / Web Mercator combined"
date: 2024-06-22
updated: 2024-06-22
template: "mapviewer.html"
extra:
  header: |
    <script src='https://unpkg.com/maplibre-gl@4.1.3/dist/maplibre-gl.js'></script>
    <link href='https://unpkg.com/maplibre-gl@4.1.3/dist/maplibre-gl.css' rel='stylesheet' />
  js: |
    var map = new maplibregl.Map({
      container: 'map',
      style: location.origin + '/natural-earth-countries-style-eq2merc.json'
    });
---

MapLibre map with Equal Earth tiles at z0-z2 and Web Mercator tiles at z > 2 on Web Mercator tile grid. Vector tiles styled with GL JSON.
