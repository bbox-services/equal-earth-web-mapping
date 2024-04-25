---
title: "OpenLayers - OSM raster tiles"
date: 2024-04-25
updated: 2024-04-25
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@9.1.0/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@9.1.0/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/proj4@2.11.0/dist/proj4.min.js"></script>
  js: |
    proj4.defs(
      'EPSG:8857',
      '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs'
    );
    ol.proj.proj4.register(proj4);

    const extent = [-17243959.06, -17243959.06, 17243959.06, 17243959.06];

    const map = new ol.Map({
      layers: [
        new ol.layer.Tile({
          source: new ol.source.OSM(),
        }),
      ],
      target: 'map',
      view: new ol.View({
        center: [0, 0],
        projection: 'EPSG:8857',
        extent: extent,
        zoom: 0
      }),
    });

    map.addControl(new ol.control.ScaleLine());
---

OpenLayers map using Proj4js reprojecting OSM raster tiles.
