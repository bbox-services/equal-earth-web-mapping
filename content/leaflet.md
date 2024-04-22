---
title: "Leaflet"
date: 2024-04-22
updated: 2024-04-22
template: "mapviewer.html"
extra:
  header: |
    <!-- Leaflet -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"></script>

    <!-- maplibre-gl-leaflet -->
    <link href="https://unpkg.com/maplibre-gl@2.2.1/dist/maplibre-gl.css" rel='stylesheet' />
    <script src="https://unpkg.com/maplibre-gl@2.2.1/dist/maplibre-gl.js"></script>
    <script src="https://unpkg.com/@maplibre/maplibre-gl-leaflet@0.0.20/leaflet-maplibre-gl.js"></script>
  js: |
    var map = L.map('map').setView([0, 0], 1);
    var gl = L.maplibreGL({
        style: location.origin + '/natural-earth-countries-style.json'
    }).addTo(map);
---
