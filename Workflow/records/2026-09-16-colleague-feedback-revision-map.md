# L02 colleague-feedback revision map

- Date: 2026-09-16
- Branch: `lesson/l02-presentation-standards`
- Source: Tomáš Jor comments on the July L02 release
- Written-material story-map status: complete; human approval: approved by the human author in this session on 2026-09-16, without requested revisions
- Presentation story-map status: no new slide proposed
- Scope: one compact optional written-material comparison; retain the approved presentation narrative.

## Written-material story-map addendum

| Internal role | Student-facing heading | Evidence and action | Speaker note |
| --- | --- | --- | --- |
| Show why a numerical summary does not replace the plot | Stejná čísla, jiné grafy | A reproducible four-panel plot from R's built-in `anscombe` data; students compare the graphs before reading that the familiar summaries are nearly identical. | Place after the existing Pearson/Spearman four-situation schematic. Keep it optional and avoid fitting-model interpretation before L03. |

## Written-material knowledge-state ledger

| Concept | Known before block | Established by block | Later use |
| --- | --- | --- | --- |
| Scatterplot and correlation | Students have read paired points and Pearson's r | Similar r and simple summaries can coexist with very different point patterns | First model diagnostics in L03 |
| Model fitting | Not yet introduced | No coefficient or residual interpretation is required | L03 introduces these concepts |

The existing four-panel Pearson/Spearman schematic already covers the proposed correlation-shape illustration; it is retained rather than duplicated. The new Anscombe graphic is code-generated from a bundled R dataset rather than copied from Wikipedia.

## Implementation and validation

- Added the optional `Stejná čísla, jiné grafy` block to `Learning_materials/skripta.qmd` after the existing Pearson/Spearman comparison. It generates four Anscombe scatterplots and a compact summary table from R's bundled `anscombe` data, without introducing model coefficients or residuals before L03.
- Canonical `R/render_skripta.R` completed. Checked the two-page optional block in the 28-page PDF and the rendered HTML.
- UTF-8, duplicate chunk labels, R parsing, focused `git diff --check`, and fresh `renv::status()` passed. No presentation content was changed for this feedback revision.
- Independent `vision-corrector` review found no actionable issue in this focused addition. The reviewer confirmed that the sequence matches the approved map and does not introduce L03 model interpretation. PDF structure passed; focused pages 13–14 were visually inspected locally.
