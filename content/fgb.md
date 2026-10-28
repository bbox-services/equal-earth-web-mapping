---
title: "OpenLayers - FlatGeobuf"
date: 2026-10-28
updated: 2026-10-28
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@10/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@10/ol.min.css" rel="stylesheet">
    <script src="https://unpkg.com/flatgeobuf@4/dist/flatgeobuf-ol.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/proj4@2/dist/proj4.min.js"></script>
  js: |
    proj4.defs('EPSG:8857', '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
    ol.proj.proj4.register(proj4);

    const extent = [-17243959.06, -17243959.06, 17243959.06, 17243959.06];
    const projection = ol.proj.get('EPSG:8857');
    projection.setGlobal(true);
    projection.setExtent(extent);
    projection.setWorldExtent([-90, -180, 90, 180]);

    const source = new ol.source.Vector();
    const loader = flatgeobuf.createLoader(source, 'https://equal.bbox.earth/ecoregions-3857.fgb', undefined, false, { featureProjection: projection });
    source.setLoader(loader)
    const fgbLayer = new ol.layer.Vector({
      source: source,
      wrapX: false,
      style: {
        'fill-color': ['string', ['get', 'COLOR'], '#eee'],
      },
    });

    const map = new ol.Map({
      layers: [fgbLayer],
      target: 'map',
      view: new ol.View({
        projection: 'EPSG:8857',
        center: [0,0],
        zoom: 0,
      }),
    });
---

OpenLayers map reprojection FlatGeobuf vector data.
