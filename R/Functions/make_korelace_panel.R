# L02 render helper. O. Mottl, 2026.
# Purely presentational; source objects are prepared at first use.

make_korelace_panel <- function(
  x,
  y,
  line_layer = NULL,
  label,
  x_label = "X",
  y_label = "Y"
) {
  data_panel <-
    tibble::tibble(x = x, y = y)
  res_plot <-
    ggplot2::ggplot(data_panel, ggplot2::aes(x = x, y = y)) +
    ggplot2::geom_point(colour = col_data, size = 2, alpha = 0.8) +
    ggplot2::labs(subtitle = label, x = x_label, y = y_label)
  if (!is.null(line_layer)) {
    res_plot <-
      res_plot + line_layer
  }
  return(res_plot)
}
