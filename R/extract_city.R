#### Functions to extract city name from address strings #####
# extractcity function only does a partial fix of extracting city information.
# may require tableauprep after file has been exported

#' Extract city name from an address string
#'
#' @param field column name containing an address string
#'
#' @return A column that should only contain the city name from an address string
#' @export
extract_city <- function(field = NULL) {
  stringr::str_replace_all(field, "[[:punct:]]", " ") %>%
    stringr::str_replace_all(., "[[:digit:]]", " ") %>%
    stringr::str_to_title(.) %>%
    stringr::str_remove(., "Tx") %>%
    stringr::str_squish(.) %>%
    stringr::word(., -1) %>%
    gsub('\\b\\w{1,1}\\b','',.) %>%
    as.character(.)
}
