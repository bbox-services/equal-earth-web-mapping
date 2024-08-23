---
title: "OpenLayers - GeoJSON with mouseover infos"
date: 2024-04-25
updated: 2024-04-25
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@10/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@10/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/proj4@2/dist/proj4.min.js"></script>
  body: |
    <div id='map'></div>
    <i id="info"></i>
  js: |
    proj4.defs('EPSG:8857', '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
    ol.proj.proj4.register(proj4);

    const extent = [-17243959.06, -17243959.06, 17243959.06, 17243959.06];

    const vectorLayer = new ol.layer.Vector({
      source: new ol.source.Vector({
        url: 'https://openlayers.org/data/vector/ecoregions.json',
        format: new ol.format.GeoJSON(),
      }),
      style: {
        'fill-color': ['string', ['get', 'COLOR'], '#eee'],
      },
    });

    const map = new ol.Map({
      layers: [vectorLayer],
      target: 'map',
      view: new ol.View({
        center: [0, 0],
        projection: 'EPSG:8857',
        extent: extent,
        zoom: 0
      }),
    });

    const featureOverlay = new ol.layer.Vector({
      source: new ol.source.Vector(),
      map: map,
      style: {
        'stroke-color': 'rgba(255, 255, 255, 0.7)',
        'stroke-width': 2,
      },
    });

    let highlight;
    const displayFeatureInfo = function (pixel) {
      const feature = map.forEachFeatureAtPixel(pixel, function (feature) {
        return feature;
      });

      const info = document.getElementById('info');
      if (feature) {
        info.innerHTML = feature.get('ECO_NAME') || '&nbsp;';
      } else {
        info.innerHTML = '&nbsp;';
      }

      if (feature !== highlight) {
        if (highlight) {
          featureOverlay.getSource().removeFeature(highlight);
        }
        if (feature) {
          featureOverlay.getSource().addFeature(feature);
        }
        highlight = feature;
      }
    };

    map.on('pointermove', function (evt) {
      if (evt.dragging) {
        return;
      }
      const pixel = map.getEventPixel(evt.originalEvent);
      displayFeatureInfo(pixel);
    });

    map.on('click', function (evt) {
      displayFeatureInfo(evt.pixel);
    });
---

OpenLayers map using Proj4js reprojecting GeoJSON data with mouseover function.
