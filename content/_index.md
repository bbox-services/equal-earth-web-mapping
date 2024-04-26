+++
title = "Equal Earth Web Mapping"
date = 2024-04-22
updated = 2024-04-24
+++

## Equal-area projection for web mapping

Most of today's web maps are using the [Web Mercator projection](https://en.wikipedia.org/wiki/Web_Mercator_projection). A major issue of Web Mercator is the distortion of area sizes far from the equator.

In 2018 Bojan Šavrič, Tom Patterson and Bernhard Jenny published their work on the [Equal Earth map projection](https://www.equal-earth.com/), an equal-area projection for world maps.

This site is an information collection about using the Equal Earth map projection for web mapping.


## Equal Earth vector tiles using Web Mercator grid

A quadratic grid for Equal Earth centered on Greenwich is similar to a Web Mercator grid.
Instead of Mercator grid corners at (-20'037'508, -20'037'508) and (20'037'508, 20'037'508)
the grid corners of Equal Earth Greenwich are at (-17'243'959, -17'243'959) and (17'243'959, 17'243'959).

![grid diagram](/gridscale.jpg)

Tiles produced in Equal Earth projection on a Equal Earth Greenwich grid can be adressed with
the same tile numbers by a map viewer using a Web Merctor grid. Tiles are displayed with a scale 
factor of 1.162. Calculations between geographic WGS84 coordinates and the map coordinate reference system are obviously wrong.
Only 0/0 is the same. But maps can be displayed without any coordinate projection calculations.

Basic usage examples:
* [MapLibre](/maplibre)
* [OpenLayers](/openlayers)
* [Leaflet](/leaflet)


## Equal Earth vector tiles using Equal Earth grid

Examples:
* [OpenLayers](/ol-equal)
* [OpenLayers with Proj4js](/ol-equal-proj)
* [OpenLayers with GL JSON style](/ol-equal-styled)


## Reproject data to Equal Earth

Examples:
* [OpenLayers - GeoJSON with mousover infos](/ol-geojson)
* [OpenLayers - OSM raster tiles](/ol-osm-proj)
* [Gleo - styled GeoJSON](/gleo-geojson)
* [D3 / Observable](https://observablehq.com/@d3/equal-earth)
* [Matplotlib add-on](https://dneuman.github.io/EqualEarth/)


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
