## CPALtools
__CPALtools__ is an R package containing custom functions used by the Child Poverty Action Lab across its work streams.

Install from github with the following command:

```r devtools::install_github("childpovertyactionlab/CPALtools")```

### Theme Functions

__theme_cpal__: ggplot2 base theme for CPAL graphics.

__font_cpal__: Used to install Poppins font from Google for use with ggplot2.

__bar_pos_neg__: Reactable function for a positive and negative bar chart.

### GIS Functions

__GeoIntersect__: Intersects two sf geometries and computes area and percent of area intersect for estimating population variables.

### Utility Functions

__extract_city__: Function used to extract city name from address string column. Not fully accurate and still being developed.

__extract_zip__: Function used to extract zip code from address string column.

### Data and Objects

__acs_variables__: Object containing the name of American Community Survey variables commonly used as metrics in CPAL analysis.

__cpal_leaflet__: Leaflet map style attribution.

__cpal_mapbox__: CPAL mapbox style link.

__dpd_vgc__: List of incident types used to identify Violent Gun Crime at the Dallas Police Department.

__ntx_county__: List of the eight North Texas counties surrounding Dallas County.

__pal_cpalfac__: Hex color codes to CPAL standards for factor variables. Includes ten hex codes.

__pal_cpaldiv__: Hex color codes to CPAL standards for diverging scale graphics.

__pal_cpaltri__: Hex color codes to CPAL standards for three variables.
