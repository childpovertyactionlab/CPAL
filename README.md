# cpaltools

**NOTE:** This project is still under active development.

`library(cpaltools)` contains R based functions for and templates for managing analysis workflows at the Urban Institute. It heavily relies on functions and functionality from the [tidyverse](https://www.tidyverse.org/).

## Installation

You can install the latest version of `cpaltools` from GitHub:

```         
# install.packages("devtools")
devtools::install_github("childpovertyactionlab/cpaltools")
```

## Usage

`library(cpaltools)` contains three families of functions:

`Geo*` functions related to geographic interactions within data that are not currently available within commonly used GIS packages such as `sf`.

`extract_*` utility functions focused on extracting specific pieces of information from a string.

`get_*` loop functions related to downloading multiple years of data from various api's such as `tidycensus`

### Geo* functions

  - `GeoIntersect()` Similar to the summarize within functionality within ArcGIS. Compares fields between two geography types and generates estimates between them.

### extract_* functions

  - `extract_zip()` Extracts the 5 digit zip code from a string address.
  - `extract_city()` Extracts a city name from a string address.

### get_* functions

  - `get_acs_years()` Pulls multiple years of data from the census api through `tidycensus` for specified fields, geographies, and years.
