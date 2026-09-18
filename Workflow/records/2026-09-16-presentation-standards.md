# Presentation standards rollout

## Scope

- Date: 2026-09-16
- Branch: `lesson/l02-presentation-standards`
- Requirements: Issues #5, #6, #7, and #8 audit for L02

## Decisions

- The first slide uses the approved question-first course title composition and canonical logo.
- The existing approved PollsLive retrieval block remains unchanged.
- Model coefficient extraction is not applicable because L02 does not teach fitted model coefficients.
- The approved bridge after `Od jedné proměnné ke dvěma` now shows one penguin carrying two matched measurements. The illustration makes the observational unit and pairing visible before students move to a scatterplot.

## Generated illustration provenance

- File: `Presentation/Materials/penguin_paired_measurements.png`
- Generation mode: OpenAI built-in image generation; new bitmap asset.
- Generation brief: exactly one penguin on a blank scale while one field researcher measures the same penguin's extended flipper; warm course-style scientific watercolor/editorial composition; 16:9; no instructional text, numbers, axes, logos, or watermark.
- Rejected draft: the first attempt contained two penguins and was not retained.
- SHA-256: `8CE6010E883DC71C014D34D28A90ED58683BBB9BCEF898C5EE3B2D126A861B97`
- Student-facing metadata: Czech alternative text, visible AI disclosure, and a one-sentence conceptual takeaway are present in the slide source.
- Approval: the human author approved this illustration concept in the implementation plan on 2026-09-16.

## Approved presentation story-map addendum

This focused addendum records the new slide approved in the implementation plan on 2026-09-16. It sits immediately after `Od jedné proměnné ke dvěma` and before `Diskuze se sousedem`.

| Internal role | Student-facing heading | Evidence role | Takeaway | Transition |
| --- | --- | --- | --- | --- |
| Make the observational unit and pairing visible before the first bivariate discussion. | Dvě hodnoty patří jednomu tučňákovi | One penguin is weighed and has its flipper measured, so both values visibly belong to the same individual. | U každého jedince zachováme dvojici jeho hodnot. | The paired measurements motivate discussing how the two variables change together. |

## Knowledge-state ledger addendum

| Concept | Before this slide | Established on this slide | Used next |
| --- | --- | --- | --- |
| Paired observations | Students have seen two variables but may still imagine two separate lists. | One observational unit contributes one matched pair of measurements. | Students can discuss the direction of an association in a scatterplot without losing the individual pairing. |

## Validation status

- Canonical render: passed in offline PollsLive mode; HTML and PDF contain 72 slides, and `Presentation/presentation.html` matches `docs/index.html` by SHA-256.
- Existing PollsLive validator and offline fallback check: passed.
- Visual inspection: passed, including the title at 1600 × 900 and 1280 × 720 and the new paired-measurement illustration.
- UTF-8, duplicate chunk-label, R parsing, and focused diff checks: passed.
- Independent read-only presentation review: passed after the story-map and knowledge-state addendum; no remaining finding.
- Git publication: follow-up authorization granted on 2026-09-16; review and merge state is tracked in the lesson PR.

## 2026-09-18 author feedback revision

The approved PollsLive retrieval include in `Presentation/presentation.qmd` now appears after the opening question and before `Výsledky učení`. Quiz content and evidence remain unchanged.

Validation: canonical offline render passed; the 72-page PDF has retrieval on page 3 and outcomes on page 7, and `Presentation/presentation.html` matches `docs/index.html`.
