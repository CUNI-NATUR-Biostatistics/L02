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
- Compress the long graph catalogue into a decision map with a small number of
  contrasting examples. The strong reasoning task is choosing what a graph
  must reveal, not memorising every available geometry.
- Correct the bridge: L03 adds an effect estimate with a model; L04 adds
  estimation uncertainty and confidence intervals.
- Mark `Exercises/cviceni.R` explicitly deferred.

## Validation required before merge

- [x] Rendered written HTML/PDF and standalone RevealJS HTML/PDF with the
  repository wrappers.
- [x] The presentation wrapper regenerated `docs/index.html`; SHA-256 equality
  is checked again immediately before publication.
- Check UTF-8, Quarto structure, unique chunk labels, glossary coverage,
  student-visible base R, hidden-code conventions, links, and image licensing.
- [x] A fresh R session activated
  `D:/GITHUB/CUNI-NATUR-Biostatistics/L02`; after snapshot,
  `renv::status()` reported no issues.
- [x] Visually inspected the complete 45-state deck overview and full-size
  compact decision-map slides. The semantic highlights remain legible and the
  strong covariance sequence is retained.
- [ ] Resolve the known exact-slug glossary-helper dependency through the
  companion `slovnik` change, then rerender without the legacy warning.
- [ ] Remove the excluded legacy gallery source after human acceptance of the
  compact replacement.
