---
title: "MapLibre"
date: 2024-04-22
updated: 2024-04-22
template: "mapviewer.html"
extra:
  header: |
    <script src='https://unpkg.com/maplibre-gl@4.0.2/dist/maplibre-gl.js'></script>
    <link href='https://unpkg.com/maplibre-gl@4.0.2/dist/maplibre-gl.css' rel='stylesheet' />
  js: |
    var map = new maplibregl.Map({
      container: 'map',
      style: location.origin + '/natural-earth-countries-style.json'
    });

---
