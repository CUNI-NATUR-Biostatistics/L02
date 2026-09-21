# L02 exercise blueprint

## Metadata and boundary

- Date: 2026-09-21
- Author: Codex with course-owner direction
- Plan: approved by Ondřej Mottl in the current conversation, including three interpretation extensions and three separate optional `ggplot2` remakes
- Branch: `lesson/l02-exercises`, created from clean `main` at `0ca30e6` with explicit course-owner authorization
- Source: approved L02 written lesson and presentation, `_internal/osnova_lekci.md`, and the L01 practical
- Status: independent exercise review passed with no findings; Ondřej Mottl approved the script on 2026-09-21; PR pending

## Intended use and assumed knowledge

The public worksheet supports a facilitated 90-minute practical and independent study. The shared route is budgeted for 67 minutes of direct work, leaving approximately 23 minutes for explanation, comparison, and slower groups. The six `L02-Nxx` tasks are outside that route. The script begins with a short permanent reminder of L01's observational unit, variable types, script versus Console, `Ctrl + Enter`, objects, `$`, `is.na()`, `plot()`, `boxplot()`, and `table()`. Teachers can skip this reminder when the group is secure with L01 skills. No project, local file import, installation, or working-directory instruction is required.

## Outcome-to-task map and timing

| Core segment | Purpose and starting state | Direct work |
| --- | --- | ---: |
| Preparation | Obtain and open the released R script; check `palmerpenguins`; recall that one row is one individual and the two measurements must stay paired. | 5 min |
| `L02-U01` | Starting from `data_tucnaci_raw`, inspect the number of missing flipper and mass values and the 342 complete flipper–mass pairs. | 6 min |
| `L02-U02` | Starting from `data_tucnaci`, create and read a base R scatterplot of flipper length and body mass. | 8 min |
| `L02-U03` | Starting from the same 342 observations, reveal species on the scatterplot and distinguish within-species spread from between-species differences. | 8 min |
| `L02-U04` | Starting from the four penguins used in the lesson, reason about products of deviations and compare the covariance sign with `cov()`. | 7 min |
| `L02-U05` | Starting from the main flipper–mass pair, compute Pearson and Spearman correlations and interpret them alongside the graph. | 8 min |
| `L02-U06` | Starting from species and mass for the same observations, draw a boxplot and interpret overlap and within-species variation. | 7 min |
| `L02-U07` | Starting from species and island for the same observations, use a two-way count table and proportional bar chart; distinguish counts from within-island proportions. | 6 min |
| `L02-U08` | Starting from bill length and mass in the source data, check complete pairs and independently complete question → data → graph → correlation → qualified biological interpretation. | 12 min |

The core covers graph choice by variable type; description of direction, shape, and variability; covariance and correlation as summaries; reasons Pearson and Spearman may differ; and limits of causal inference. A novice classroom pacing trial remains for human review.

## Data and objects

- Source: `palmerpenguins::penguins`, one row per measured penguin. Required package `palmerpenguins` is checked with `requireNamespace()`; it is not attached or automatically installed.
- The raw data contain 344 rows. Two rows lack both flipper length and mass; the shared flipper–mass route retains the 342 complete pairs. Explicit row selection preserves pairing and matches the approved written lesson's sample. The selection retains species, island, and the bill measurements for later tasks.
- Main objects: `data_tucnaci_raw`, `data_mereni_par`, `data_tucnaci`, `vec_delka_ploutve`, `vec_hmotnost`, `vec_druh`, `vec_ostrov`, `data_ctyri_tucnaci`, and `tabulka_druh_ostrov`. Student-visible content-object names are Czech; original source column names remain available with their provenance stated.
- Core first graphs: scatterplot for two numeric variables, boxplot for numeric × categorical, and table plus proportional stacked bar chart for categorical × categorical. These use base R. Plot labels are Czech and carry measurement units.
- Alternative pair in `L02-U08`: bill length × mass (342 complete pairs, Pearson approximately 0.595). Alternative pair in `L02-N02`: bill depth × mass (342 complete pairs, Pearson approximately -0.472). Each task explicitly rechecks its own complete pairs rather than assuming the counts.
- No external data files, private helpers, working-directory assumptions, or internet access are required once the packages are installed.

## Optional route

| Task | Purpose |
| --- | --- |
| `L02-N01` | Compare the four plots in built-in `anscombe` and their similar Pearson correlations; the numerical summary does not determine the visual pattern. |
| `L02-N02` | Transfer the entire paired-data workflow to bill depth and mass. |
| `L02-N03` | Explain why the observed correlation does not establish causation; consider species and body size as plausible alternative explanations without claiming either is proved. |
| `L02-N04` | Remake the `L02-U02` scatterplot with `ggplot2`. |
| `L02-N05` | Remake the `L02-U06` boxplot with `ggplot2`. |
| `L02-N06` | Remake the `L02-U07` species-by-island proportion chart with `ggplot2`. |

The last three tasks are the course owner's explicit exception to the normal base-R-only exercise rule. The public script introduces `ggplot2` as a more modern way to make R graphs, links to the L02 learning-material section on choosing graphs and the official `ggplot2` introduction, and explains data, aesthetic mapping, layers, `+`, labels, and `::`. A runnable species-count bar chart gives first-use practice without solving any of the three remakes. They use `ggplot2::` calls only, never `library()`, and check `ggplot2` only before the optional plot route. They retain the same observations, variables, units, and question as the corresponding core figure. They ask students to compare what each plotting approach makes easy to read or adjust; there is no expectation to finish them in class.

## Exclusions and review gates

Regression models, significance tests, confidence intervals, causal identification, detailed covariance algebra, `tidyverse` data manipulation, and reproduction of the complete lecture graph gallery are outside this exercise. The public script must not contain a full answer key or teacher-only orchestration. Before human review, parse and run the unfilled script from a clean session and temporary working directory, solve every task in an untracked harness, verify expected outcomes and saved plot labels, audit UTF-8 and prohibited patterns, rehearse file distribution and first use, and commission an independent read-only review using `_internal/.ai/agents/exercise-reviewer.md`. The release manifest and student-facing download link were added after human exercise approval on 2026-09-21; publication remains a separate authorization boundary.
## Validation and independent review

- The unfilled distributed script parsed and executed with `Rscript --vanilla` from a clean session and temporary working directory. No repository-root working-directory, private helper, or console-created object was required.
- An untracked reference harness verified all task calculations: 344 source rows, two missing values per core measurement in the same two rows, 342 complete pairs, four-penguin covariance 2430, Pearson/Spearman core correlations about 0.871/0.840, bill-length correlation about 0.595, bill-depth correlation about -0.472, Anscombe correlations about 0.816, and the species-by-island count and proportion displays. The six optional tasks were checked for reproducible inputs and expected interpretations.
- Temporary base R and `ggplot2` plots were saved and visually inspected. The proportion-chart legend was moved above the bars and `ggplot2` uses the same named species palette and stack order. Czech labels rendered correctly after setting a UTF-8 validation locale; no locale workaround was added to student code.
- The modified source and workflow files are UTF-8 without BOM or replacement characters. `git diff --check`, prohibited-pattern searches, heading/task-ID checks, and a public-content and first-use audit passed.
- A separate read-only exercise reviewer inspected the complete script and blueprint, identified two teaching issues, rechecked the corrections, and concluded `No findings.` After the course owner requested a fuller `ggplot2` introduction, the reviewer checked the updated section again and found no issues. The course learning link returned HTTP 200 and contains the named heading; the official tutorial link is live. The worked chart rendered with the expected species counts and Czech labels. A clean-session simulation with `ggplot2` unavailable completed with a clear optional-task message and no example plot object. The 67-minute direct-work budget is plausible; a novice classroom pacing trial remains for human review.
- The approved script is listed in `website-release.yml`, and the README points students to the future `/L02/current/code/cviceni.R` route, following the L01 distribution pattern. The route cannot be tested live until an authorized stable release; this PR does not itself publish the script to `/current/`.
