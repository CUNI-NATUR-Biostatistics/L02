# L02 maintenance before teaching

- Date: 2026-10-05
- Branch: `polish/l02-before-teaching`
- Scope approved by Ondřej Mottl: implement the complete lesson and presentation review, retaining the summaries already taught in L01.
- Preserve the complete graph gallery, progressive covariance explanation, L01 retrieval quiz, and September Extras. Retain variance and standard deviation as recap, with corrected arithmetic and terminology.
- Existing July and September approvals remain historical decisions. Both complete maintenance story maps and knowledge ledgers received separate current approvals before substantial student-facing drafting.
- Git boundary: local source and generated-output changes only; no staging, commits, pushes, pull requests, or publication.

## Review corrections

1. Correct covariance unit conversion, displayed intermediate precision, calibration labels, weighted density composition, and overlapping waffle tiles.
2. Make visible R examples reproducible from the delivered CSV, including paired missingness, a data preview, and the shared observed four-penguin subset.
3. Keep concepts in chronological order; explain constructed examples visibly and distinguish association from causal interpretation.
4. Repair the correlation-choice interaction and remove duplicate gallery orientation while preserving every gallery example and task family.
5. Apply canonical terminology, glossary first-occurrence coverage, semantic colours, object locality, and reusable helper conventions.
6. Repair clipped code, equations, figure titles, and the summary table. Render HTML/PDF and inspect the full artifacts, including presentation reveals.
7. Obtain separate read-only full-artifact review and glossary review before requesting final human review.

## Current gates

| Artifact | Map | Knowledge ledger | Human map decision |
|---|---|---|---|
| Learning materials | `2026-10-05-learning-material-story-map.md` | Complete | Approved separately by Ondřej Mottl, 2026-10-05 |
| Presentation | `2026-10-05-presentation-story-map.md` | Complete | Approved by Ondřej Mottl, 2026-10-05, after explicit H1/H2 revision |

## Validation

Implementation was complete and ready for final human artifact review on 2026-10-05. The separate map approvals above were recorded before drafting. Ondřej Mottl accepted the completed polish on 2026-10-06 after the revisions recorded in `2026-10-06-review-revisions.md`.

- Retained the full graph gallery, L01 variance/standard-deviation summaries, covariance build, retrieval quiz, and September Extras. Removed only the duplicate gallery orientation. The deck has 72 physical slides; the approved map explicitly distinguishes H1 dividers and H2 content slides.
- Corrected the worked four-penguin calculations, covariance unit conversion and approximation labels, correlation/calibration labels, density weighting, and waffle-cell indexing. Both artifacts use the same observed four-penguin subset and distinguish its correlations from those for all 342 complete pairs.
- Added a runnable CSV entry, visible data preview and missingness check, chronological object definitions, and an evidence-based A/B/C correlation task. Clarified association, study design, and the handoff to models in original measurement units.
- Completed the targeted glossary-coverage pass: 29 valid slugs and 98 rendered glossary instances, all with definitions. The lesson-local `Learning_materials/glossary-headings.lua` replaces glossary anchors with native tooltip spans only within HTML headings, including nested emphasis, so the table of contents contains valid navigation links. Body glossary links and PDF text are preserved.
- Kept computational plot helpers in six separate single-function files under `R/Functions/`. Seven format-specific native Typst blocks keep short code examples, two tables, and three answer callouts together in PDF; they do not appear in HTML. Wrapped long plot titles and adjusted dense facet ticks.
- The separate read-only internal reviewer used `.ai/agents/vision-corrector.md` to inspect both complete artifacts. Follow-up checks covered the numerical corrections, glossary markup, layout amendments, heading filter, and repaired quiz asset. Final verdict: no blocking findings; final filter review: no findings.
- Clean-session R verification passed for all six visible written-material chunks and all ten visible presentation chunks. The separate numerical harness verified the source data, shared subset, calculations, covariance scaling, waffle cells, and chunk/helper syntax.
- Canonical standalone HTML/PDF renders passed for both artifacts. Visually inspected all 32 written PDF pages, all 72 presentation PDF pages, and all 141 captured presentation HTML/fragment states. The final written HTML check found no missing glossary definitions, broken TOC links or images, code overflow, page overflow, or visible raw Typst blocks.
- Source checks passed for UTF-8, absence of BOM/replacement characters, unique chunk labels, valid glossary slugs, and source whitespace. `docs/index.html` matches the final `Presentation/presentation.html` delivery copy.
- The render wrappers synchronized the canonical local `_brand` assets; their generated lesson-local descendants are included with the L02 changes. No canonical brand or glossary source was edited.

## PollsLive boundary

Renders used `POLLSLIVE_RENDER_MODE=offline` and the pinned client revision `17a62daf970278f2cf5ce134d1b68ec01819be15`. Credential-free definition/configuration and asset checks passed. The three retrieval questions and their values are unchanged.

The four-mammal table image had a corrupted Czech label. It was regenerated with the correct “Spánek za den (h)” label, preserving all species and values; both integrity guards now use SHA-256 `043172ede7e25ce55643491bce2534102659270a04fdef1f24372fcf3f34d5d7`. This revised image has not been synchronized to the live quiz. Live operational acceptance, physical-device verification, and public deployment are outside this local maintenance validation.

## Repository boundary

Only L02 source, workflow records, generated figures, and rendered delivery outputs were changed for this maintenance. The existing `_internal` workspace-file change and temporary material were preserved. No staging, commits, pushes, pull requests, or publication were performed.

## Final acceptance and commit authorization

On 2026-10-06, Ondřej Mottl stated “I consider the polish to be done” and then approved the proposed commit plan: “I approve this plan, go ahead and commit”. This closes final human review for the maintenance, title illustration, and subsequent review revisions. The approved Git scope is the separate `_brand` title-layout commit, four line-ending-only SVG reversions, and five dependency-ordered L02 commits. No push, pull request, live PollsLive synchronization, or publication is authorized by this decision.
