#### Functions to extract the zip code from address strings #####

#' Extract zip code from an address string
#'
#' @param field column name containing an address string
#'
#' @return A column that should only contain the zip code from an address string
#' @export
extract_zip <- function(field = NULL) {
  stringr::str_replace_all(field, "[[:punct:]]", "") %>%
    stringr::str_replace_all(., "[[:alpha:]]", " ") %>%
    stringr::str_squish(.) %>%
    stringr::word(., -1) %>%
    stringr::str_sub(., 1, 5)
}
