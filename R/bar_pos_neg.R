#### Positive and Negative Bar Chart for Reactable #####

#' Add a positive to negative bar chart to a reactable table
#'
#' @param label column name containing an address string
#'
#' @return Cell theme for a reactable table
#' @export
#'
#' @examples
#' test <- "test"
#' @import reactable

bar_chart_pos_neg <- function(label, value, max_value = 1, height = "16px",
                              pos_fill = "#008097", neg_fill = "#ec008c") {
  neg_chart <- div(style = list(flex = "1 1 0"))
  pos_chart <- div(style = list(flex = "1 1 0"))
  width <- paste0(abs(value / max_value) * 100, "%")

  if (value < 0) {
    bar <- div(style = list(marginLeft = "8px", background = neg_fill, width = width, height = height))
    chart <- div(style = list(display = "flex", alignItems = "center", justifyContent = "flex-end"), label, bar)
    neg_chart <- tagAppendChild(neg_chart, chart)
  } else {
    bar <- div(style = list(marginRight = "8px", background = pos_fill, width = width, height = height))
    chart <- div(style = list(display = "flex", alignItems = "center"), bar, label)
    pos_chart <- tagAppendChild(pos_chart, chart)
  }

  div(style = list(display = "flex"), neg_chart, pos_chart)
}
