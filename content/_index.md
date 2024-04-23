+++
title = "Equal Earth Web Mapping"
date = 2024-04-22
updated = 2024-04-22
+++

## Equal-area projection for web mapping

Most of today's web maps are using the [Web Mercator projection](https://en.wikipedia.org/wiki/Web_Mercator_projection). A major issue of Web Mercator is the distortion of area sizes far from the equator.

In 2018 Bojan Šavrič, Tom Patterson and Bernhard Jenny published their work on the [Equal Earth map projection](https://www.equal-earth.com/), an equal-area projection for world maps.

This site is an information collection about using the Equal Earth map projection for web mapping.


## Equal Earth vector tiles using Web Mercator grid

Examples:
* [MapLibre](/maplibre)
* [OpenLayers](/openlayers)
* [Leaflet](/leaflet)


## Creating data in Equal Earth projection

There are official EPSG codes for the following Equal Earth projection variants:
* Equal Earth Greenwich: EPSG:8857
* Equal Earth Americas: EPSG:8858
* Equal Earth Asia-Pacific: EPSG:8859

So most GIS software packages already support working with data in Equal Earth projection.

Example using GDAL:

```
ogr2ogr ne_10m_populated_places.fgb -t_srs EPSG:8857 /vsicurl/https://github.com/nvkelso/natural-earth-vector/raw/master/geojson/ne_10m_populated_places_simple.geojson
```

### Open Street Map extracts in Equal Earth projection

OSM extracts in Equal Earth projection can be produced with <https://osm2pgsql.org/themepark/>

A detailed tutorial will follow.

### Vector tiles in Equal Earth projection

Vector tiles in Equal Earth projection can be produced with <https://www.bbox.earth/tile-server/>

A detailed tutorial will follow.

Tile matrix sets:
* Equal Earth Greenwich: [EqualEarthGreenwichWGS84Quad.json](https://github.com/bbox-services/assets/raw/main/ne-extracts/EqualEarthGreenwichWGS84Quad.json)


## Feedback and contributions

For feedback please open an issue or pull request on <https://github.com/bbox-services/equal-earth-web-mapping>
