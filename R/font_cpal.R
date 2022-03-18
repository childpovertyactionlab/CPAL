#### CPAL fonts function #####
#' CPAL font install
#'
#' @param x placeholder
#'
#' @return Installs all fonts currently used by the Child Poverty Action Lab
#' @export
#'
#' @import sysfonts
#' @examples
#' ggplot2::ggplot(iris, ggplot2::aes(x=Petal.Length, y=Sepal.Width, color = Species)) +
#' ggplot2::geom_point() +
#' theme_cpal()
#'
font_cpal <- function(x) {
  sysfonts::font_add_google("Poppins", family = "Poppins")
}
