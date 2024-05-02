---
title: "OpenLayers with projection switch"
date: 2024-05-02
updated: 2024-05-02
template: "mapviewer.html"
extra:
  header: |
    <script src="https://cdn.jsdelivr.net/npm/ol@9.1.0/dist/ol.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/ol@9.1.0/ol.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/proj4@2.11.0/dist/proj4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/ol-mapbox-style@12.3.1/dist/olms.js"></script>
  body: |
    <div id='map'></div>
    <pre id="center"></pre>
  js: |
    proj4.defs('EPSG:8857', '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
    proj4.defs('EPSG:8858', '+proj=eqearth +lon_0=-90 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
    proj4.defs('EPSG:8859', '+proj=eqearth +lon_0=150 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
    ol.proj.proj4.register(proj4);

    const extent = [-17243959.06, -17243959.06, 17243959.06, 17243959.06];

    const resolutions = [
      134718.43015625, 67359.215078125, 33679.6075390625, 16839.80376953125, 8419.901884765624, 4209.950942382812, 2104.975471191406, 1052.487735595703, 526.2438677978515, 263.12193389892576, 131.56096694946288, 65.78048347473144, 32.89024173736572, 16.44512086868286, 8.22256043434143, 4.111280217170715, 2.0556401085853575, 1.0278200542926788, 0.5139100271463394, 0.2569550135731697, 0.12847750678658484, 0.06423875339329242, 0.03211937669664621, 0.016059688348323106, 0.008029844174161553
    ];

    const tileGrid = new ol.tilegrid.TileGrid({
        extent: extent,
        resolutions: resolutions,
        tileSize: 256
      });

    const sources = Object.fromEntries(['8857', '8858', '8859'].map(epsg => {
      const code = `EPSG:${epsg}`;
      const projection = ol.proj.get(code);
      projection.setGlobal(true);
      projection.setExtent(extent);
      projection.setWorldExtent([-90, -180, 90, 180]);

      const source = new ol.source.VectorTile({
        format: new ol.format.MVT(),
        tileGrid: tileGrid,
        tilePixelRatio: 16,
        url: `https://assets.bbox.earth/tiles/ne_extracts_${epsg}/ne_countries/{z}/{x}/{y}.pbf`,
        projection: projection
      });

      return [code, source];
    }));

    const source = sources['EPSG:8857'];
    var mvt = new ol.layer.VectorTile({
      declutter: true,
      source: source
    });

    olms.applyStyle(mvt, location.origin + '/natural-earth-countries-style.json');

    var map = new ol.Map({
      layers: [mvt],
      target: 'map',
      view: new ol.View({
        center: [0, 0],
        projection: source.getProjection(),
        zoom: 1
      })
    });

    function centerLonLat(view) {
      return ol.proj.toLonLat(view.getCenter(), view.getProjection());
    }

    function display(id, coords, projcode) {
      document.getElementById(id).innerHTML =
        projcode + ' | Center longitude: ' + coords.map(v => v.toFixed(2));
    }

    function wrapLon(value) {
      const worlds = Math.floor((value + 180) / 360);
      return value - worlds * 360;
    }

    function updateProjection(source) {
      const projection = source.getProjection();
      const view = map.getView();
      if (view.getProjection() != projection) {
        var ll = centerLonLat(view);
        map.setView(new ol.View({
          center: ol.proj.fromLonLat(ll, projection),
          projection: projection,
          zoom: view.getZoom()
        }));
        mvt.setSource(source);
      }
    }

    function onMoveEnd(evt) {
      const map = evt.map;
      var center = centerLonLat(map.getView());
      //const center_lon = wrapLon(center[0]);
      const center_lon = center[0];
      display('center', [center_lon], map.getView().getProjection().getCode());
      if (center_lon >= 80 || center_lon < -155 ) {
        updateProjection(sources['EPSG:8859']);
      } else if (center_lon >= -40 && center_lon < 70) {
        updateProjection(sources['EPSG:8857']);
      } else if (center_lon >= -145 && center_lon < -50) {
        updateProjection(sources['EPSG:8858']);
      }
    }

    map.on('moveend', onMoveEnd);
---

OpenLayers map using Proj4js and Equal Earth tile grid. Vector tiles styled with GL JSON.
Projection switches when longitude of map center passes 75°, -45° or -150° (+/- 5°).
