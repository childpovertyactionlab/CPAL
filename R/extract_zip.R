#### Functions to extract the zip code from address strings #####

#' Extract zip code from an address string
#'
#' @param x column name containing an address string
#'
#' @return A column that should only contain the zip code from an address string
#' @export
#'
#' @examples
#' test <- "test"
#' @import stringr
extract_zip <- function(x) {
  str_replace_all(x, "[[:punct:]]", "") %>%
    str_replace_all(., "[[:alpha:]]", " ") %>%
    str_squish(.) %>%
    word(., -1) %>%
    str_sub(., 1, 5)
}
