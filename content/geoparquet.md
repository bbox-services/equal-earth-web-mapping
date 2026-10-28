---
title: "OpenLayers - GeoParquet"
date: 2026-10-28
updated: 2026-10-28
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@10/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@10/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/proj4@2/dist/proj4.min.js"></script>
  body: |
    <div id='map'></div>
    <script type="module">
      import { CogpReader, toGeoJSON } from 'https://cdn.jsdelivr.net/npm/@cogp/reader@2.1.4/+esm'
  
      proj4.defs('EPSG:8857', '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
      ol.proj.proj4.register(proj4);
  
      const extent = [-17243959.06, -17243959.06, 17243959.06, 17243959.06];
      const projection = ol.proj.get('EPSG:8857');
      projection.setGlobal(true);
      projection.setExtent(extent);
      projection.setWorldExtent([-90, -180, 90, 180]);
  
      (async () => {
  
        const reader = await CogpReader.open('https://cache.bbox.earth/pois.cogp.parquet');
        const batch = await reader.read({
          bbox: [-180, -90, 180, 90], // [west, south, east, north]
          maxLevel: 1, //reader.selectLevel(0.001), // CRS units per screen pixel
          columns: [reader.primaryGeometryColumn, 'id', 'tags'],
          useOverview: true,
        });
        
        const features = toGeoJSON(batch);
        
        const vectorSource = new ol.source.Vector({
          features: new ol.format.GeoJSON({
            featureProjection: projection,
            featureClass: ol.render.Feature,
          }).readFeatures(features),
          overlaps: false,
        });
        
        const map = new ol.Map({
          layers: [new ol.layer.Vector({ source: vectorSource })],
          target: 'map',
          view: new ol.View({
            projection: 'EPSG:8857',
            center: [0,0],
            zoom: 0,
          }),
        });
  
      })();
     </script>
  js: ""
---

OpenLayers map reprojecting GeoParquet vector data.
