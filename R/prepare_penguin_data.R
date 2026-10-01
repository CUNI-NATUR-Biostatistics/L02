#----------------------------------------------------------#
#
#
#                          L02
#
#                 Prepare penguin data
#
#                     O. Mottl
#                       2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Extract the reviewed package data -----
#----------------------------------------------------------#

if (
  as.character(packageVersion("palmerpenguins")) != "0.1.1"
) {
  cli::cli_abort(
    "Package {.pkg palmerpenguins} version 0.1.1 is required to reproduce the teaching data."
  )
}

data_tucnaci <-
  palmerpenguins::penguins |>
  as.data.frame()

if (
  nrow(data_tucnaci) != 344L ||
    ncol(data_tucnaci) != 8L ||
    sum(is.na(data_tucnaci$flipper_length_mm)) != 2L ||
    sum(is.na(data_tucnaci$body_mass_g)) != 2L
) {
  cli::cli_abort(
    "The Palmer Penguins source table failed its dimension or missing-value check."
  )
}


#----------------------------------------------------------#
# Save the teaching table -----
#----------------------------------------------------------#

readr::write_csv(
  x = data_tucnaci,
  file = here::here(
    "data",
    "palmer_penguins.csv"
  ),
  na = ""
)
