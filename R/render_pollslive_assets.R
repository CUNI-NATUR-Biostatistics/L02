#----------------------------------------------------------#
# Generate local visual evidence for the L02 retrieval quiz
#----------------------------------------------------------#

library(grid)
library(ggplot2)
library(here)

here::i_am("R/render_pollslive_assets.R")

output_dir <- here::here("pollslive", "assets")
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

approved_histogram <-
  here::here("pollslive", "assets", "l01-sleep-histogram.png")

expected_histogram_sha256 <-
  "212ca9c94c5fb7e78b3e53c9b9a794021cd3f6f1f6beca34b78f5f75426f4181"

stopifnot(
  file.exists(approved_histogram),
  identical(
    digest::digest(file = approved_histogram, algo = "sha256"),
    expected_histogram_sha256
  )
)

colours <- jsonlite::read_json(
  here::here("theme", "colors.json"),
  simplifyVector = TRUE
)$primary

open_png <- function(filename) {
  grDevices::png(
    filename = here::here(output_dir, filename),
    width = 1600,
    height = 900,
    res = 160,
    type = "cairo",
    bg = colours[["parchment"]]
  )
}

normalize_png <- function(filename) {
  path <- here::here(output_dir, filename)
  pixels <- png::readPNG(path)
  png::writePNG(pixels, target = path)
}

draw_text <- function(label, x, y, ...) {
  grid.text(
    label = label,
    x = unit(x, "npc"),
    y = unit(y, "npc"),
    ...
  )
}

# Four familiar rows from ggplot2::msleep. Values are read from the source data
# so that the image cannot drift from the teaching dataset.
species_to_show <-
  c(
    "Cheetah",
    "Owl monkey",
    "Mountain beaver",
    "Greater short-tailed shrew"
  )

sleep_table <-
  ggplot2::msleep[
    match(species_to_show, ggplot2::msleep$name),
    c("name", "sleep_total")
  ]

stopifnot(
  identical(sleep_table$name, species_to_show),
  !anyNA(sleep_table$sleep_total)
)

open_png("l01-table-four-mammals.png")
grid.newpage()
pushViewport(viewport(x = 0.5, y = 0.5, width = 0.9, height = 0.78))

row_y <- seq(0.77, 0.14, length.out = nrow(sleep_table))
header_y <- 0.93

grid.roundrect(
  x = 0.5,
  y = header_y,
  width = 1,
  height = 0.17,
  r = unit(0.02, "npc"),
  gp = gpar(fill = colours[["indigo_velvet"]], col = NA)
)
draw_text(
  "Druh (species)", 0.04, header_y,
  just = "left",
  gp = gpar(col = colours[["parchment"]], fontsize = 30, fontface = "bold")
)
draw_text(
  "Spánek za den (h)", 0.96, header_y,
  just = "right",
  gp = gpar(col = colours[["parchment"]], fontsize = 30, fontface = "bold")
)

for (index in seq_len(nrow(sleep_table))) {
  fill_colour <-
    if (index %% 2 == 0) colours[["light_gray"]] else colours[["white"]]

  grid.rect(
    x = 0.5,
    y = row_y[[index]],
    width = 1,
    height = 0.155,
    gp = gpar(fill = fill_colour, col = colours[["grey_olive"]], lwd = 1)
  )
  draw_text(
    sleep_table$name[[index]], 0.04, row_y[[index]],
    just = "left",
    gp = gpar(col = colours[["graphite"]], fontsize = 29)
  )
  draw_text(
    sprintf("%.1f", sleep_table$sleep_total[[index]]), 0.96, row_y[[index]],
    just = "right",
    gp = gpar(col = colours[["graphite"]], fontsize = 29, fontface = "bold")
  )
}

popViewport()
dev.off()
normalize_png("l01-table-four-mammals.png")

# The console excerpt is assembled from actual computed results. The formatting
# mirrors the approved L01 teaching sequence.
vec_spanek_deviti <-
  c(
    2.9, 3.8, 4.0, 8.0, 8.4,
    9.1, 9.7, 10.1, 12.5
  )

mean_sleep <- mean(x = vec_spanek_deviti)
median_sleep <- median(x = vec_spanek_deviti)

console_lines <-
  c(
    "vec_spanek_deviti <- c(",
    "  2.9, 3.8, 4.0, 8.0, 8.4,",
    "  9.1, 9.7, 10.1, 12.5",
    ")",
    "",
    "mean(x = vec_spanek_deviti)",
    sprintf("# [1] %.6f", mean_sleep),
    "",
    "median(x = vec_spanek_deviti)",
    sprintf("# [1] %.1f", median_sleep)
  )

open_png("l01-console-median.png")
grid.newpage()
grid.roundrect(
  x = 0.5,
  y = 0.5,
  width = 0.9,
  height = 0.84,
  r = unit(0.025, "npc"),
  gp = gpar(fill = colours[["light_gray"]], col = colours[["grey_olive"]], lwd = 2)
)

line_y <- seq(0.84, 0.16, length.out = length(console_lines))
for (index in seq_along(console_lines)) {
  is_output <- grepl("^#", console_lines[[index]])
  draw_text(
    console_lines[[index]], 0.09, line_y[[index]],
    just = "left",
    gp = gpar(
      col = if (is_output) colours[["indigo_velvet"]] else colours[["graphite"]],
      fontsize = 25,
      fontface = if (is_output) "bold" else "plain",
      fontfamily = "mono"
    )
  )
}

dev.off()
normalize_png("l01-console-median.png")
