#' Intersection of two sf geographies used to summarize variables between each
#'
#' @param polylg The larger sf geography that can be summarized down into a smaller geography
#' @param polysm The smaller sf geography that can be summarized up into a larger geography
#'
#' @return An sf dataframe that has been intersected between both geographies and now contains the calculated area of all geographies
#' and the percentage of intersection for the small and large geographies.
#' @export
GeoIntersect <- function(polylg = NULL,
                         polysm = NULL)
{
  if("geometry" %in% colnames(polylg) & "geometry" %in% colnames(polysm))
  {
  if (sf::st_crs(polylg) == sf::st_crs(polysm)) {
    polylg <- (polylg) %>%
      dplyr::mutate(AreaLarge = as.numeric(sf::st_area(geometry)))
    polysm <- (polysm) %>%
      dplyr::mutate(AreaSmall = as.numeric(sf::st_area(geometry)))

    sf::st_intersection(polylg, polysm) %>%
      dplyr::mutate(AreaInt = as.numeric(sf::st_area(geometry)),
             PerIntLg = AreaInt/AreaLarge,
             PerIntSm = AreaInt/AreaSmall)
  } else {
    print("Both sf objects must be set to the same crs")
  }
  } else {
    print("sf attribute columns must be named geometry for both sf dataframes")
  }
}
