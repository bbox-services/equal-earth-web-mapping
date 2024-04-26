---
title: "Gleo - styled GeoJSON"
date: 2024-04-26
updated: 2024-04-26
template: "mapviewer.html"
extra:
  header: ""
  body: |
    <div style="width: calc(100vw - 32px); height: calc(100vh - 80px)" id="gleomap"></div>
    <script type="importmap">
      {
        "imports": {
                "gleo/": "https://unpkg.com/gleo/src/"
        }
      }
    </script>
    <script type='module'>
      import { default as GleoMap } from "gleo/MercatorMap.mjs";
      import GeoJSON from "gleo/loaders/GeoJSON.mjs";
      import Hair from "gleo/symbols/Hair.mjs";
      import Fill from "gleo/symbols/Fill.mjs";

      import epsg8857 from "gleo/crs/epsg8857.mjs";

      const map = (window.map = new GleoMap("gleomap"));
      map.crs = epsg8857;

      map.setView({
        center: [0, 0],
        span: 8,
      });

      new GeoJSON(
        "https://ivansanchez.gitlab.io/gleo/assets/ne_110m_coastline.geojson",
        {
          lineSymbolizer: function (feat, geom) {
            return new Hair(geom, { colour: "blue" });
          },
        }
      ).addTo(map);

      // From colorbrewer2.org, a qualitative 7-colour ramp
      const colourRamp = [
        "#7fc97f",
        "#beaed4",
        "#fdc086",
        "#ffff99",
        "#386cb0",
        "#f0027f",
        "#bf5b17",
      ];

      new GeoJSON("https://ivansanchez.gitlab.io/gleo/assets/geoBoundariesCGAZ_ADM0.simplify100usr.geojson", {
        polygonSymbolizer: function (feat, geom) {
          return new Fill(geom, {
            colour: colourRamp[feat.properties.color_id - 1],
          });
        },
      }).addTo(map);
    </script>
  js: ""
---

[Gleo](https://ivansanchez.gitlab.io/gleo/) map with built-in support for Equal Earth.
