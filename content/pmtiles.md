---
title: "OpenLayers - PMTiles"
date: 2026-10-28
updated: 2026-10-28
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@10/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@10/ol.min.css" rel="stylesheet">
    <script src="https://unpkg.com/pmtiles@4/dist/pmtiles.js"></script>
    <!-- <script src="https://unpkg.com/ol-pmtiles@2/dist/olpmtiles.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/proj4@2/dist/proj4.min.js"></script>
  js: |
    proj4.defs('EPSG:8857', '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
    ol.proj.proj4.register(proj4);

    const extent = [-17243959.06, -17243959.06, 17243959.06, 17243959.06];
    const projection = ol.proj.get('EPSG:8857');
    projection.setGlobal(true);
    projection.setExtent(extent);
    projection.setWorldExtent([-90, -180, 90, 180]);

    const tiles = new pmtiles.PMTiles(
      'https://download.mapterhorn.com/planet.pmtiles',
    );
    
    function loadImage(src) {
      return new Promise((resolve, reject) => {
        const img = new Image();
        img.addEventListener('load', () => resolve(img));
        img.addEventListener('error', () => reject(new Error('load failed')));
        img.src = src;
      });
    }
    
    const rasterLayerPm = new ol.layer.WebGLTile({
      source: new ol.source.ImageTile({
        async loader(z, x, y, {signal}) {
          const response = await tiles.getZxy(z, x, y, signal);
          const blob = new Blob([response.data]);
          const src = URL.createObjectURL(blob);
          const image = await loadImage(src);
          URL.revokeObjectURL(src);
          return image;
        },
        tileSize: [512,512],
        wrapX: false,
        attributions: "https://mapterhorn.com/attribution/",
      }),
    });

    /* PMTilesRasterSource does not reproject
    const rasterLayer = new ol.layer.WebGLTile({
      source: new olpmtiles.PMTilesRasterSource({
        url: "https://download.mapterhorn.com/planet.pmtiles",
        attributions: ["https://mapterhorn.com/attribution/"],
        tileSize: [512,512],
        wrapX: false,
      })
    });
    */

    const map = new ol.Map({
      layers: [rasterLayerPm],
      target: 'map',
      view: new ol.View({
        projection: 'EPSG:8857',
        center: [0,0],
        zoom: 0,
      }),
    });
---

OpenLayers map using Web Mercator raster tiles from a PMTiles archive.
