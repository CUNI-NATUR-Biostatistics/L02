# L02 CSV delivery maintenance

## Scope

- Date: 2026-10-01
- Branch: `data/l02-csv-delivery`
- Purpose: replace the runtime dependency on `palmerpenguins::penguins` with a stable, downloadable CSV while preserving the approved practical tasks, values, and timing.

## Data contract

- `data/palmer_penguins.csv` contains all 344 rows and eight original columns from `palmerpenguins::penguins` 0.1.1.
- The two missing flipper-length values and two missing body-mass values remain on the same two rows.
- `R/prepare_penguin_data.R` reproduces and validates the CSV.
- The student script downloads the file from the stable lesson route, stores it under `data/`, checks its presence, and imports it with `read.csv()`.
- `website-release.yml` publishes the CSV and its provenance note.

## Pedagogical effect

No task, expected result, hint sequence, or timing allocation changes. The practical becomes independent of the `palmerpenguins` package for its main route; the optional ggplot2 tasks retain their existing package check.

## Validation required

- regenerate the CSV from the locked package;
- compare its values with the package source, allowing only factor-to-character serialization;
- parse and run the unfilled script from a clean R session;
- rehearse the documented script-and-data folder route;
- independently review the complete updated exercise against `Workflow/records/2026-09-21-exercise-blueprint.md`.

## Validation outcome

- The preparation script regenerated the CSV from `palmerpenguins` 0.1.1.
- A value-by-value comparison matched all 344 source rows after the expected factor-to-character CSV serialization; missing-value positions and 342 complete measurement pairs were preserved.
- The complete exercise parsed and ran from a clean temporary student-style project containing only the distributed script and CSV.
- Manifest paths, UTF-8 without BOM, and `git diff --check` passed.
- Independent read-only exercise review completed on 2026-10-01 with no findings. Estimated direct-work timing is 70–72 minutes including the added file setup. Human review remains required before release.
