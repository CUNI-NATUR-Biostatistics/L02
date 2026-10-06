# L02 render helper. O. Mottl, 2026.
# Purely presentational; source objects are prepared at first use.

include_local_figure <- function(data_source) {
  res_figure <-
    knitr::include_graphics(
    path = here::here(
      path_materials,
      data_source
    ),
    error = TRUE
  )
  return(res_figure)
}
