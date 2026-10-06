# L02 render helper. O. Mottl, 2026.
# Purely presentational; source objects are prepared at first use.

generate_corr_data <- function(r, n) {
  vec_x <-
    rnorm(n = n)
  vec_y <-
    r * vec_x + sqrt(1 - r^2) * rnorm(n = n)
  res_data <-
    tibble::tibble(x = vec_x, y = vec_y)
  return(res_data)
}
