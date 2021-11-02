#' Intersection of two sf geographies used to summarize variables between each
#'
#' @param x The larger sf geography that can be summarized down into a smaller geography
#' @param y The smaller sf geography that can be summarized up into a larger geography
#'
#' @return An sf dataframe that has been intersected between both geographies and now contains the calculated area of all geographies
#' and the percentage of intersection for the small and large geographies.
#' @export
#' @import tigris
#' @import sf
#' @import dplyr
#' @import magrittr
#'
#'
#' @examples
#' TexasCD <- tigris::congressional_districts(state = "TX")
#' plot(TexasCD["geometry"])
#'
#' DallasCounty <- tigris::county_subdivisions(state = "TX", county = "Dallas County")
#' plot(DallasCounty["geometry"])
#'
#' DallasCD <- TexasCD[DallasCounty, ]
#'
#' DallasInt <- GeoIntersect(x = DallasCounty, y = DallasCD)
#'
#' plot(DallasInt["geometry"])

GeoIntersect <- function(x, y)
{
  if("geometry" %in% colnames(x) & "geometry" %in% colnames(y))
  {
  if (st_crs(x) == st_crs(y)) {
    x <- x %>%
      mutate(AreaLarge = as.numeric(st_area(geometry)))
    y <- y %>%
      mutate(AreaSmall = as.numeric(st_area(geometry)))

    st_intersection(x, y) %>%
      mutate(AreaInt = as.numeric(st_area(geometry)),
             PerIntLg = AreaInt/AreaLarge,
             PerIntSm = AreaInt/AreaSmall)
  } else {
    print("Both sf objects must be set to the same crs")
  }
  } else {
    print("sf attribute columns must be named geometry for both sf dataframes")
  }
}
