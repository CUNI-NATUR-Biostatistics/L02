# L02 render helper. O. Mottl, 2026.
# Places two gallery plots side by side. When `legend_from` is given, its
# legend is drawn once, full width, below the pair, so neither panel is
# narrowed by a legend and long group names are not clipped.
# With `show_right = FALSE` the right panel and legend are left empty but keep
# their space, so the left-only image and the full pair share one layout and
# can be revealed in two steps on a slide.

combine_gallery_pair <- function(
  plot_left,
  plot_right,
  legend_from = NULL,
  show_right = TRUE
) {
  bez_legendy <-
    ggplot2::theme(legend.position = "none")

  panel_vpravo <-
    if (isTRUE(show_right)) {
      plot_right + bez_legendy
    } else {
      cowplot::ggdraw()
    }

  res_pair <-
    cowplot::plot_grid(
      plot_left + bez_legendy,
      panel_vpravo,
      ncol = 2,
      align = "h",
      axis = "tb"
    )

  if (!is.null(legend_from)) {
    legenda <-
      if (isTRUE(show_right)) {
        cowplot::get_plot_component(
          legend_from + ggplot2::theme(legend.position = "bottom"),
          "guide-box-bottom",
          return_all = FALSE
        )
      } else {
        cowplot::ggdraw()
      }
    res_pair <-
      cowplot::plot_grid(
        res_pair,
        legenda,
        ncol = 1,
        rel_heights = c(1, 0.15)
      )
  }

  return(res_pair)
}
