# L02 render helper. O. Mottl, 2026.
# Purely presentational; source objects are prepared at first use.
# The same simulated panel is drawn with or without its realised r, so the
# guessing slide and its reveal show identical points.

make_kal_plot <- function(data_kalibrace, panel_label, show_r = TRUE) {
  vec_r_observed <-
    cor(x = data_kalibrace$x, y = data_kalibrace$y)
  vec_r_label <-
    formatC(vec_r_observed, digits = 2, format = "f", decimal.mark = ",")
  label_txt <-
    if (isTRUE(show_r)) {
      stringr::str_glue("{panel_label}:  r ≈ {vec_r_label}")
    } else {
      panel_label
    }
  res_plot <-
    ggplot2::ggplot(
      data = data_kalibrace,
      mapping = ggplot2::aes(x = x, y = y)
    ) +
    ggplot2::geom_point(
      colour = biostat_cols["grey_olive"],
      alpha = 0.65,
      size = 2
    ) +
    ggplot2::labs(
      title = label_txt,
      x = NULL,
      y = NULL
    ) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        hjust = 0.5,
        size = 16,
        face = "bold"
      )
    )
  return(res_plot)
}
