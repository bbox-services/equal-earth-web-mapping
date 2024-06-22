---
title: "Leaflet - Equal Earth / Web Mercator combined"
date: 2024-06-22
updated: 2024-06-22
template: "mapviewer.html"
extra:
  header: |
    <!-- Leaflet -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

    <!-- maplibre-gl-leaflet -->
    <link href="https://unpkg.com/maplibre-gl@4.1.3/dist/maplibre-gl.css" rel='stylesheet' />
    <script src="https://unpkg.com/maplibre-gl@4.1.3/dist/maplibre-gl.js"></script>
    <script src="https://unpkg.com/@maplibre/maplibre-gl-leaflet@0.0.20/leaflet-maplibre-gl.js"></script>
  js: |
    var map = L.map('map').setView([0, 0], 1);
    var gl = L.maplibreGL({
        style: location.origin + '/natural-earth-countries-style-eq2merc.json'
    }).addTo(map);
---

Leaflet map map with Equal Earth tiles at z0-z2 and Web Mercator tiles at z > 2 on Web Mercator tile grid. Vector tiles styled with GL JSON.
