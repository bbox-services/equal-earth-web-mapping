---
title: "OpenLayers - Switch to Web Mercator"
date: 2024-05-07
updated: 2024-05-07
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@10/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@10/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/ol-mapbox-style@12/dist/olms.js"></script>
  js: |
    var eqearth = new ol.layer.VectorTile({
      source: new ol.source.VectorTile({
        format: new ol.format.MVT(),
        url: 'https://assets.bbox.earth/tiles/ne_extracts_8857/ne_countries/{z}/{x}/{y}.pbf'
      }),
      maxZoom: 3,
    });
    olms.applyStyle(eqearth, 'https://equal.bbox.earth/natural-earth-countries-style.json');

    var merc = new ol.layer.VectorTile({
      source: new ol.source.VectorTile({
        format: new ol.format.MVT(),
        url: 'https://assets.bbox.earth/tiles/ne_extracts_3857/ne_countries/{z}/{x}/{y}.pbf'
      }),
      minZoom: 3,
    });
    olms.applyStyle(merc, 'https://equal.bbox.earth/natural-earth-countries-style.json', {updateSource: false});

    const map = new ol.Map({
      layers: [eqearth, merc],
      target: 'map',
      view: new ol.View({
        center: [0, 0],
        zoom: 0,
        maxZoom: 6,
      }),
    });
---

OpenLayers with Equal Earth tiles for zoom level 1-2 and Web Mercator tiles for level 3-6.
