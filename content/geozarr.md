---
title: "OpenLayers - GeoZarr"
date: 2026-10-31
updated: 2026-10-31
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@10/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@10/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/proj4@2/dist/proj4.min.js"></script>
  body: |
    <div id='map'></div>
    <script type="module">
      // ol.js expects the zarrita library as a global `zarr`, but zarrita is
      // only published as an ES module.
      import * as zarr from 'https://cdn.jsdelivr.net/npm/zarrita@0.7.5/+esm';
      window.zarr = zarr;

      proj4.defs('EPSG:8857', '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
      ol.proj.proj4.register(proj4);
  
      const extent = [-17243959.06, -17243959.06, 17243959.06, 17243959.06];
      const projection = ol.proj.get('EPSG:8857');
      projection.setGlobal(true);
      projection.setExtent(extent);
      projection.setWorldExtent([-90, -180, 90, 180]);
  
      // An RGB composite style stretching each band from [min, max] to 0..255.
      function rgb(min, max) {
        const stretch = (band) => [
          'interpolate',
          ['linear'],
          ['band', band],
          min,
          0,
          max,
          255,
        ];
        return {color: ['color', stretch(1), stretch(2), stretch(3)]};
      }
  
      const source = new ol.source.GeoZarr({
        url: 'https://data.source.coop/ftw/global-data/predictions/zarr/alpha/global.zarr',
        variable: 'variables',
        // The three class probabilities as RGB, for the most recent year
        dimensions: {band: [0, 1, 2], time: 1},
      });
  
      const globalSource = new ol.source.ImageTile({
        attributions:
          'Tiles © <a href="https://maps.eox.at" target="_blank">eox.at</a> / <a href="http://nasa.gov" target="_blank">NASA</a>',
        url: 'https://tiles.maps.eox.at/wmts/1.0.0/bluemarble/default/WGS84/{z}/{y}/{x}.jpg',
        tileGrid: ol.tilegrid.createXYZ({
          extent: [-180, -90, 180, 90],
          maxResolution: 180 / 256,
        }),
        projection: ol.proj.get('EPSG:4326'),
        wrapX: false,
      });
  
      const map = new ol.Map({
        layers: [
          new ol.layer.WebGLTile({
            source: globalSource,
          }),
          new ol.layer.WebGLTile({
            source,
            style: rgb(0, 0.5),
          }),
        ],
        target: 'map',
        view: new ol.View({
          projection: 'EPSG:8857',
          center: [0, 0],
          zoom: 0,
        }),
      });
     </script>
  js: ""
---

OpenLayers map GeoZarr raster data in WGS84 coordinates.
