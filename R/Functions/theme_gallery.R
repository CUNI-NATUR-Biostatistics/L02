# L02 render helper. O. Mottl, 2026.
# Purely presentational; source objects are prepared at first use.

theme_gallery <- function() {
  res_theme <-
    ggplot2::theme(
    plot.title = ggplot2::element_text(
      face = "bold",
      size = 17,
      colour = biostat_cols["graphite"]
    ),
    plot.subtitle = ggplot2::element_text(
      size = 11,
      colour = biostat_cols["grey_olive"]
    ),
    axis.title = ggplot2::element_text(size = 12),
    axis.text = ggplot2::element_text(size = 10),
    legend.text = ggplot2::element_text(size = 10),
    legend.title = ggplot2::element_blank(),
    legend.position = "none",
    panel.grid.minor = ggplot2::element_blank()
  )
  return(res_theme)
}
