---
title: "OpenLayers - Equal Earth grid with Proj4js"
date: 2024-04-24
updated: 2024-04-24
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@9.1.0/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@9.1.0/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/proj4@2.11.0/dist/proj4.min.js"></script>
  body: |
    <div id='map' style='width: 60%; aspect-ratio: 2/1;'></div>
    <pre id="mouse-position"></pre>
  js: |
    proj4.defs(
      'EPSG:8857',
      '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs'
    );
    ol.proj.proj4.register(proj4);

    const extent = [-17243959.06, -17243959.06, 17243959.06, 17243959.06];
    const projection = ol.proj.get('EPSG:8857');
    projection.setExtent(extent);

    const resolutions = [
      134718.43015625, 67359.215078125, 33679.6075390625, 16839.80376953125, 8419.901884765624, 4209.950942382812, 2104.975471191406, 1052.487735595703, 526.2438677978515, 263.12193389892576, 131.56096694946288, 65.78048347473144, 32.89024173736572, 16.44512086868286, 8.22256043434143, 4.111280217170715, 2.0556401085853575, 1.0278200542926788, 0.5139100271463394, 0.2569550135731697, 0.12847750678658484, 0.06423875339329242, 0.03211937669664621, 0.016059688348323106, 0.008029844174161553
    ];

    var mvt = new ol.layer.VectorTile({
      source: new ol.source.VectorTile({
        format: new ol.format.MVT(),
        tileGrid: new ol.tilegrid.TileGrid({
          extent: extent,
          resolutions: resolutions,
          tileSize: 256
        }),
        tilePixelRatio: 16,
        url: 'https://assets.bbox.earth/tiles/ne_extracts_8857/ne_countries/{z}/{x}/{y}.pbf',
        projection: projection
      })
    });

    var map = new ol.Map({
      layers: [mvt],
      target: 'map',
      view: new ol.View({
        center: [0, 0],
        projection: 'EPSG:8857',
        extent: extent,
        zoom: 1
      })
    });

    const mousePositionControl = new ol.control.MousePosition({
      coordinateFormat: ol.coordinate.createStringXY(4),
      projection: 'EPSG:4326',
      className: 'custom-mouse-position',
      target: document.getElementById('mouse-position'),
    });
    map.getControls().extend([mousePositionControl]);
---

OpenLayers map using Proj4js and Equal Earth tile grid.
