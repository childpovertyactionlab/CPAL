#### Functions to extract city name from address strings #####
# extractcity function only does a partial fix of extracting city information.
# may require tableauprep after file has been exported

#' Extract city name from an address string
#'
#' @param x column name containing an address string
#'
#' @return A column that should only contain the city name from an address string
#' @export
#'
#' @examples
#' test <- "test"
#' @import stringr
extract_city <- function(x) {
  str_replace_all(x, "[[:punct:]]", " ") %>%
    str_replace_all(., "[[:digit:]]", " ") %>%
    str_to_title(.) %>%
    str_remove(., "Tx") %>%
    str_squish(.) %>%
    word(., -1) %>%
    gsub('\\b\\w{1,1}\\b','',.) %>%
    as.character(.)
}
