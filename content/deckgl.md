---
title: "DeckGL - Web Mercator grid"
date: 2024-05-02
updated: 2024-05-02
template: "mapviewer.html"
extra:
  header: |
    <script src="https://unpkg.com/deck.gl@latest/dist.min.js"></script>
    <script src='https://unpkg.com/maplibre-gl@4.1.3/dist/maplibre-gl.js'></script>
    <link href='https://unpkg.com/maplibre-gl@4.1.3/dist/maplibre-gl.css' rel='stylesheet' />
    <script src="https://cdn.jsdelivr.net/npm/proj4@2.11.0/dist/proj4.min.js"></script>
  js: |
    const {MapboxOverlay, ScatterplotLayer} = deck;

    var map = new maplibregl.Map({
      container: 'map',
      maxZoom: 6,
      style: 'https://equal.bbox.earth/natural-earth-countries-style.json'
    });

    map.on('style.load', () => {
      const deckOverlay = new MapboxOverlay({
        interleaved: true,
        layers: [
          new ScatterplotLayer({
            data: 'https://raw.githubusercontent.com/visgl/deck.gl-data/master/website/airports.json',
            getPosition: d => shiftLonLat(d.coordinates),
            getRadius: 100,
            getColor: [155, 40, 0],
            radiusMinPixels: 2
          })
        ]
      });

      map.addControl(deckOverlay);
    });

    proj4.defs('EPSG:8857', '+proj=eqearth +lon_0=0 +x_0=0 +y_0=0 +R=6371008.7714 +units=m +no_defs +type=crs');
    const wgs84 = proj4('EPSG:4326');
    const merc = proj4('EPSG:3857');
    const eq = proj4('EPSG:8857');
    // Scale factor from Equal Earth to Web Mercator grid
    const fact = 20037508.3427892 / 17243959.06;

    // Shift geographic coordinate to match Equal Earth projection on Merctor grid
    function shiftLonLat(ll) {
      const coord = proj4(wgs84, eq, ll);
      const scaled = [coord[0] * fact, coord[1] * fact];
      const shifted = proj4(merc, wgs84, scaled);
      return shifted;
    }
---

MapLibre map with DeckGL layer using Web Mercator tile grid.
