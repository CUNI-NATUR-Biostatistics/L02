# L02 coherence and release audit

- Date: 2026-07-24
- Branch: `lesson/l02-coherence-polish`
- Anchor dataset: Palmer Penguins (retained)

## Comparative decisions

- Retain L02's semantic inline highlighting and overall theme. The colour
  language usefully distinguishes direction/signal from spread and supports
  attention during progressive reveals. Validation must confirm contrast and
  a non-colour-only fallback.
- Retain the transparent four-observation build from deviations to covariance;
  this is a topic-specific strength not present in L04.
- Add an explicit L01 callback using only observational units, variable types,
  one-variable summaries, and one-variable graph choice.
- Keep the biological question before learning outcomes.
- Preserve “same data, different axes,” the covariance/correlation core,
  the limits of causal interpretation, and the visible-association boundary.
- Preserve the complete quantitative × quantitative, quantitative ×
  categorical, and categorical × categorical graph gallery. Use the compact
  decision map as orientation, not as a replacement. Any later compression
  must be slide-specific and explicitly approved.
- Correct the bridge: L03 adds an effect estimate with a model; L04 adds
  estimation uncertainty and confidence intervals.
- Mark `Exercises/cviceni.R` explicitly deferred.

## Validation required before merge

- [x] Rendered written HTML/PDF and standalone RevealJS HTML/PDF with the
  repository wrappers.
- [x] The presentation wrapper regenerated `docs/index.html`; SHA-256 equality
  is checked again immediately before publication.
- [x] Checked UTF-8, Quarto structure, unique chunk labels, glossary coverage,
  student-visible base R, hidden-code conventions, links, and image licensing.
- [x] A fresh R session activated
  `D:/GITHUB/CUNI-NATUR-Biostatistics/L02`; after snapshot,
  `renv::status()` reported no issues.
- [x] Visually inspected the complete 67-state deck overview, restored graph
  gallery, compact decision-map slides, semantic highlights, and covariance
  sequence.
- [x] Confirmed the rendered written materials and presentation contain no
  student-facing repository lesson codes.
- [x] Confirmed the complete formula progression for sample variance,
  covariance, and Pearson correlation in source and rendered PDF.

## Human review decision

Approved by the human reviewer on 2026-07-25. The complete visualisation
gallery is part of the accepted lesson and must not be removed by a later
coherence pass without an explicit new decision.

The companion `slovnik` PR remains a shared release dependency, but the current
lesson source and rendered artifacts have passed their local validation.
