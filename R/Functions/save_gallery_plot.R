# L02 render helper. O. Mottl, 2026.
# Saves a gallery figure at the shared slide width; paired (two-panel)
# figures use a shorter height so they fill the slide width.

save_gallery_plot <- function(plot, file_name, height = 860) {
  res_output <-
    ggview::save_ggplot(
      plot = plot,
      width = 1600,
      height = height,
      units = "px",
      file = here::here(path_materials, file_name)
    )
  return(res_output)
}
