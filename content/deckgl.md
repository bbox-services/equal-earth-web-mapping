---
title: "deck.gl - Web Mercator grid"
date: 2024-05-02
updated: 2024-05-02
template: "mapviewer.html"
extra:
  header: |
    <script src="https://unpkg.com/deck.gl@9/dist.min.js"></script>
    <script src='https://unpkg.com/maplibre-gl@4/dist/maplibre-gl.js'></script>
    <link href='https://unpkg.com/maplibre-gl@4/dist/maplibre-gl.css' rel='stylesheet' />
    <script src='https://unpkg.com/maplibre-gl-equal-earth@0.2/dist/maplibre-gl-equal-earth.umd.js'></script>
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
            getPosition: d => maplibregleqearth.geogLonLat_to_eqmercLonLat(d.coordinates),
            getRadius: 100,
            getColor: [155, 40, 0],
            radiusMinPixels: 2
          })
        ]
      });

      map.addControl(deckOverlay);
    });
---

MapLibre map with deck.gl layer using Web Mercator tile grid.
