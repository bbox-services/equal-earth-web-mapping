---
title: "MapLibre - Equal Earth / Web Mercator combined"
date: 2024-06-22
updated: 2024-06-22
template: "mapviewer.html"
extra:
  header: |
    <script src='https://unpkg.com/maplibre-gl@4/dist/maplibre-gl.js'></script>
    <link href='https://unpkg.com/maplibre-gl@4/dist/maplibre-gl.css' rel='stylesheet' />
    <script src='https://unpkg.com/maplibre-gl-equal-earth@0.2/dist/maplibre-gl-equal-earth.umd.js'></script>
  js: |
    var map = new maplibregl.Map({
      container: 'map',
      style: 'https://equal.bbox.earth/natural-earth-countries-style-eq2merc.json'
    });
    // Mercator tiles >= z3
    const transform = new maplibregleqearth.EqualEarthCoordTransform(map, 3);
---

MapLibre map with Equal Earth tiles at z0-z2 and Web Mercator tiles at z >= 3 on Web Mercator tile grid. Vector tiles styled with GL JSON.
