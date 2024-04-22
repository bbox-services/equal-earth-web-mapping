+++
title = "Equal Earth Web Mapping"
date = 2024-04-22
updated = 2024-04-22
+++

## Equal-area projection for web mapping

Mainly because of programmers laziness (which can be a good thing!), 99% of today's web maps are in Web Mercator projection. My goal for this year is to help people using appropriate projections for making better maps. In 2018 Bojan Šavrič, Tom Patterson and Bernhard Jenny published their work on the [Equal Earth map projection](https://www.equal-earth.com/), an equal-area projection for world maps.

This is the obvious candidate for replacing Web Mercator in web maps. I will evaluate using Equal Earth in tiled maps and the most important Javascript libraries. As a way to prove and document its usage, my plan is to publish maps covering topics like transport, weather, aviation and sensors. These will certainly benefit from an adequate world projection and are also use cases for real-time updates, another topic I want to investigate.


## Equal Earth vector tiles using Web Mercator grid

Examples:
* [MapLibre](/maplibre)
* [OpenLayers](/openlayers)
* [Leaflet](/leaflet)
