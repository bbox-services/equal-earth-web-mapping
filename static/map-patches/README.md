Morocco / Western Sahara supplemental geometry
================================================

The Equal Earth `ne_extracts_8857` vector tiles currently omit part of
southern Morocco and Western Sahara at low zooms. The two GeoJSON files in this
directory are supplemental geometries derived from the same hosted z6 vector
tiles. Using the high-zoom tile output keeps the patch aligned with the
existing tile grid and avoids the visible offset that appears when raw Natural
Earth longitude/latitude geometry is overlaid on this Equal Earth-in-Mercator
MapLibre style.

The fill file contains tile-clipped `MAR` and `SAH` polygon pieces. The outline
file contains only coastline segments, so the existing `land-border-country`
vector layer can continue to draw the Algeria and Mauritania borders without
duplicated land-border strokes.
