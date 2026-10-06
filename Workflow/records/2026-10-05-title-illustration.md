# L02 title-screen illustration

- Date: 2026-10-05
- Requested by: Ondřej Mottl, following approval and implementation of both maintenance maps.
- Request: “Now also generate the title screen image (from images used in the presentation and skripta) - follow teh brand style”.
- Scope: one title illustration, its integration into the existing first slide, and regenerated local presentation outputs. The question, formal title, logo, materials link, subsequent hook, and slide order are retained.
- Branch: `polish/l02-before-teaching`; no staging, commits, pushes, or publication.

## Asset and provenance

Final asset: `Presentation/Materials/tucnaci_titulni_ilustrace.png`. Generated with the built-in Image Generation tool, using a true transparent background. The complete prompt is stored in `2026-10-05-title-illustration-prompt.txt` beside this record.

The complete title screen is also exported as `Presentation/Materials/l02_title_screen.png` (1600 × 900), captured from the final rendered native title slide with presentation controls and the slide counter hidden. The PNG is an export; the slide's text, logo, and link remain editable in Quarto.

Supporting inputs inspected before generation:

- `Learning_materials/images/lter_penguins.png`: existing species illustration by Allison Horst, biological reference only; original creator credit remains on the lesson's existing species visual. The generated asset does not reproduce that illustration, its colour splashes, or its signature.
- `Presentation/Materials/penguin_paired_measurements.png`: existing lesson illustration of weighing a penguin while measuring its flipper; reference for the paired-measurement situation.
- `L01/Presentation/Materials/typicky_savec_titulni_ilustrace.png`: existing L01 arrival-screen illustration, used to match the course's painted, gently humorous cutout treatment.

The new scene shows a Gentoo penguin on a field scale, a Chinstrap penguin measuring that individual's flipper, and an Adelie penguin recording the two measurements. Its teaching purpose is to keep the two measured variables attached to the same observation. It contains no numerical data, fitted relationship, or causal claim.

Natural graphite/white/grey plumage is combined with the canonical indigo `#5D2890`, restrained amethyst `#86579E`, parchment `#F4F1EC`, and orange-gold `#F3A712` measurement accents. The canonical reversed logo is rendered separately, unchanged. The title and link are editable Quarto text, not baked into the illustration.

The title screen includes a visible Czech AI disclosure and descriptive alt text. The reusable illustrated arrival-screen variant is implemented in canonical `_brand/R/Functions/Theme_generation/generate_presentation_components.R` and documented in `_brand/README.md`. It suppresses the decorative question mark, reserves space for the cutout, and supplies a generic short-credit/disclosure caption. L02 uses only the generated brand classes and native fenced divs; there is no lesson-local CSS override. The supported presentation render regenerates the theme from that canonical source.

## Validation

Generation output inspected: species markings, paired measurement on one individual, coherent instruments, restrained palette, clean transparent cutout, and absence of readable data or recreated logo.

- The final cutout is 1199 × 1312 RGBA with actual transparency (alpha extrema 0 and 255), SHA-256 `59e17f769b150ab9e5e4417d50f87f3df717606663d4017d2f849d517f21ed16`.
- The supported offline presentation render passed, synchronized the canonical brand variant, and regenerated HTML, PDF and `docs/index.html`. The final PDF retains 72 pages; the slide order and other teaching content are unchanged.
- Title-screen browser checks and visual inspection passed at 1600 × 900 and 1280 × 720. The illustration loads, none of the title components overlaps it or crosses the viewport boundary, and the real materials link and AI disclosure are visible. The PDF title page and complete exported PNG were also visually inspected.
- The separate read-only vision reviewer inspected the complete presentation source and the amendment. Its initial CSS-ownership finding was resolved by placing the layout in canonical `_brand`; the final focused review returned no findings.
- UTF-8/chunk-label checks and source whitespace checks passed. `Presentation/presentation.html` and `docs/index.html` have matching SHA-256 `766eb4fe610bb9a1c7d0274fc117f89e858adb0b50fed5bf87bc1bb769af27d4`.
- This follow-up changes two repositories: L02 owns the new image, title-slide integration, workflow records and regenerated outputs; `_brand` owns the reusable component generator and its README documentation. All changes remain local and uncommitted. No live PollsLive synchronization or public deployment was performed.
