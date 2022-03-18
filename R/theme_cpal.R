#### CPAL ggplot theme #####
#' CPAL ggplot theme
#'
#' @param base_size text size for chart theme
#' @param base_family font family for chart theme
#'
#' @return A ggplot base theme based on CPAL standards
#' @export
#'
#' @import ggplot2
#' @import ggthemes
#' @import tibble
#' @import showtext
#' @import sysfonts
#' @examples
#' ggplot2::ggplot(iris, ggplot2::aes(x=Petal.Length, y=Sepal.Width, color = Species)) +
#' ggplot2::geom_point() +
#' theme_cpal()
theme_cpal <- function(base_size = 48, base_family = "sans") {
  #  font_add_google("Poppins", family = "Poppins")
  showtext_auto()
  colors <- deframe(ggthemes::ggthemes_data[["fivethirtyeight"]])
  (ggthemes::theme_foundation(base_size = base_size, base_family = base_family) +
      theme(
        line = element_line(colour = "#b4b4b4"),
        rect = element_rect(fill = "#e7ecee",
                            linetype = 1,
                            colour = NA),
        text = element_text(family = "Poppins", face = "bold", colour = "#6c6c6c"),
        axis.title = element_text(),
        axis.title.x = element_text(vjust = 2),
        axis.title.y = element_text(vjust = 2),
        axis.text = element_text(color = "#595959"),
        axis.ticks = element_blank(),
        #axis.ticks.length = unit(6, "pt"),
        #axis.line = element_line(color = "#595959", size = 1, linetype = "solid"),
        legend.background = element_rect(),
        legend.position = "bottom",
        legend.direction = "horizontal",
        legend.title = element_blank(),
        legend.box = "horizontal",
        plot.title = element_text(hjust = 0, size = rel(1.5), face = "bold"),
        plot.margin = unit(c(1, 2, 0, 0), "cm"),
        #plot.margin = unit(t = 2, r = 3, b = 2, l = 2),
        panel.border = element_rect(size = 1, color = "#595959"),
        panel.grid.major = element_line(colour = "#595959", linetype = "dotted", size = 0.25),
        panel.grid.minor = element_blank(),
        strip.background = element_rect()
      )
  )
}

