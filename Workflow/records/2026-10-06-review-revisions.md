# L02 pre-teaching review revisions

- Date: 2026-10-06
- Branch: `polish/l02-before-teaching`; local source and generated-output changes only. No staging, commits, pushes, pull requests, live PollsLive synchronization, or publication.
- Trigger: Ondřej Mottl asked for a review of L02 against the canonical `.ai/` guidance and the L01 style before teaching (2026-10-05). The review produced 24 numbered suggestions in three groups (A: correctness and confusion; B: presentation versus guidance and L01; C: learning materials versus slides and L01).
- Human decision: Ondřej Mottl, 2026-10-06, “Ok, implement those changes”, approving the complete list A–C. For the items flagged as his call (H1 divider names; compressing the retained gallery), the recommended option was implemented. This decision also revises the presentation story map approved on 2026-10-05; the revised map is recorded below.
- Builds on: `2026-10-05-maintenance-scope.md`, `2026-10-05-presentation-story-map.md`, `2026-10-05-learning-material-story-map.md`, `2026-10-05-title-illustration.md`.

## Implemented changes

### Both artifacts

1. **Terminology.** *Rozptyl* is reserved for variance (`výběrový rozptyl`, as in L01); the visual spread of a scatter cloud is now *rozptýlení* or *variabilita*. Headings, outcomes, prompts, summaries, notes and the quick-reference table were changed; the glossary link to `rozptyl` remains only where variance is meant. The exercise already used *rozptýlení*/*variabilita*; one remaining instance was aligned.
2. **Learning outcomes.** One shared four-item list (bodový graf; rozptýlení and korelace; first graph by variable pair; association versus cause). The written heading is `Výsledky učení`, as in L01.
3. **Species palette.** Briefly switched to the `_brand` categorical palette, then reverted on 2026-10-06 at Ondřej Mottl's request: the palmerpenguins colours (Adelie `darkorange`, Chinstrap `mediumpurple`, Gentoo `cyan4`) are part of the dataset's established identity (https://allisonhorst.github.io/palmerpenguins/). Recorded as a lesson-specific, documented exception to the brand rule that group colours must not overlap the semantic orange/purple layers; the source comment states the decision. Ordered flipper-length categories use a neutral light-to-dark ramp.
4. **Curved correlation example.** The constructed curve no longer injects artificial outliers (which also removed an operator-precedence no-op in `outlier_idx`). It is now accelerating growth with proportional noise, so Pearson and Spearman differ for the stated reason (curvature). Identical generator in both artifacts.
5. **Visible data entry.** Presentation and written code are identical (`na.strings = ""`, `ostrov` retained).
6. **Graph-choice table.** One canonical table for the three variable pairs, shared by the closing gallery slide and the written quick-reference table.

### Presentation

- Hook image loads from a local copy (`Presentation/Materials/lter_penguins.png`) instead of a remote URL.
- H1 dividers: `Dvě měření, jeden bod` (new, opening section), `Jak spočítat společný pohyb?` (was `Kovariance`), `Číslo nezávislé na jednotkách` (was `Korelace`), `Jak vybrat první graf?`, `Závěr` (was `Co dál?`). No divider introduces an unearned term.
- Data entry split into `Tabulka tučňáků` (table plus question) and `Úplné dvojice v R` (code plus counts).
- `Stejná data, jiné osy`: neutral axis colours, a question, and a takeaway. `Rozptýlení čteme ve dvou směrech`: both strips use the orange focus colour; variable identity no longer borrows semantic colours.
- First MCQ uses L01-style option cards; correct options use `.rn-circle-orange` consistently.
- `Jedno číslo pro společný pohyb`: the answer is a fragment after the discussion prompt.
- `Jeden bod pod lupou`: names the product of deviations before the quadrant question asks about products; highlighted point is orange (focus), not purple (model).
- Quadrants use the standard school numbering (I top right, counter-clockwise); the correct answer is I and III; option text no longer reveals the signs.
- R output is now produced by evaluating the visible code (`output-location: fragment`) instead of hand-typed `[1] 0,87` strips. A hidden guard checks that the typed four-penguin vectors equal the observed subset.
- `Záleží na jednotkách?` asks for a prediction before the values appear.
- Pearson's *r* is introduced alone (`Kovariance bez jednotek: Pearsonovo r`) as covariance divided by both SDs. Spearman arrives on its own slide (`Pořadí místo hodnot`) immediately before the slide comparing the two.
- The calibration gallery became an interaction: `Odhadněte korelaci` (unlabelled, shuffled panels A–D) followed by `Stejná data, ale s hodnotou r` (identical draws, realised *r*). `make_kal_plot()` now takes a prepared panel and a `show_r` switch.
- `Výš v horách, chladněji?` replaces the concept-first `Záporná korelace` heading. The interpretation of the whole-penguin *r* is now attached to `Všichni tučňáci v kódu`.
- The two causation slides were merged; the image now has alt text and a provenance footer.
- Gallery: every graph family retained (12 graphs). Related views share one slide, each variable pair keeps a stable label and strip colour, headings name the pair instead of `N×N`/`N×Kat`/`Kat×Kat`, graph names are bold rather than model-purple, and the four overlapping decision slides (`Rozhodovací mapa`, `Tři první pohledy`, `Co rozhoduje?`, `Shrnutí základních vizualizací`) became one closing table. Gallery: 25 → 14 slides.
- Closing: the recall MCQ was replaced by an open question that returns to the opening biological question (L01 pattern), with the bridge to the next lesson as a fragment. The summary mirrors the outcomes.
- Alt text added to every displayed figure (previously 1). Hard-wrapped visible prose and notes unwrapped; Czech quotation marks; hard-coded greys replaced by `biostat_cols`.

### Learning materials

- Opening prediction options labelled A–C (the answer refers to B).
- `Co v grafu vidíme`: questions come first; the answer is given once, in the collapsed box.
- No use of *korelace* before its section; the axis-swap text speaks of direction and tightness.
- Third-person and authoring-voice leaks removed (“studenti”, “didakticky”, “didaktická ukázka”, reference to a non-existent table row). Workflow narration (“Nejdřív slovy… Teprve potom… Teprve nyní…”) replaced with content wording.
- Variance/SD recap now sits in its own subsection, `Připomenutí: rozptyl a směrodatná odchylka jedné proměnné`.
- Species reveal (`Stejný graf, ale s viditelnými druhy`, with its pooled-versus-within-group Extra) moved before covariance, matching the presentation order, directly after the sources of variability.
- Covariance section reordered to match the slides: question → quadrant figure → reading task → signs of products → naming → small-sample table → word equation → substitution → symbols → whole-data value → units. Quadrant shading that pre-empted the answer (and used model purple) removed. Pearson derivation is a subsection (`Od kovariance k Pearsonově korelaci`); misplaced quadrant list and duplicate lead-in removed.
- Spearman is explained before its first numeric use; the duplicated Pearson/Spearman prose and the unexplained “neparametrická alternativa” were removed; panel labels read `Pearson`/`Spearman` instead of `P`/`S`.
- Gallery aligned with the slides: added stacked histogram, stacked density and bubble views; the two-categorical example now uses species × island (a real pair with computed counts), and the cut flipper-length categories are created only in the ordinal section.
- Duplicate end MCQ removed (the causation MCQ remains); summary aligned with the outcomes; `Závěrečná otázka` added, matching the presentation's closing question.
- Hard-wrapped prose unwrapped. The `pseudoreplikace` TODO comment is kept, as `glossary.md` requires while the slug is missing.

### Exercise

- `L01`/`L02` references in student-facing comments replaced with “minulá lekce” / “tato lekce” (task IDs such as `L02-U01` and URLs unchanged); “rozptyl” → “rozptýlení” in one task. Comments only: no task, data or solution change; the script still parses.

## Revised presentation story map

Rows marked † changed in this revision; unmarked rows keep their 2026-10-05 role and speaker note.

| Order | Internal role | Slide type | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 1 | Title | H2 | Mají tučňáci s delší ploutví také vyšší tělesnou hmotnost? | Illustrated arrival screen. |
| 2 | Visual hook | H2 | Pomůže nám druhá proměnná? | † Local species illustration with alt text. |
| 3–6 | Previous-lesson retrieval | H2 ×4 | Co si pamatujete z minulé lekce? + three questions | Unchanged PollsLive include. |
| 7 | Outcomes | H2 | Výsledky učení | † Shared four-item list. |
| 8 | Section divider | H1 | Dvě měření, jeden bod | † New divider. |
| 9 | Transfer from L01 | H2 | Od jedné proměnné ke dvěma | † Fragment states the need instead of repeating the later discussion question. |
| 10 | Measurement context | H2 | Dvě hodnoty patří jednomu tučňákovi | |
| 11 | Commitment | H2 | Diskuze se sousedem | |
| 12 | Data table | H2 | Tabulka tučňáků | † Table + question only. |
| 13 | Reproducible entry | H2 | Úplné dvojice v R | † Split from row 12; code + counts. |
| 14–16 | Progressive build | H2 ×3 | Dva tučňáci · Čtyři tučňáci · Všichni tučňáci | † Row 15 code evaluated (plot hidden) with subset guard. |
| 17 | Observation commitment | H2 | Co v tomto grafu vidíte? | † Rozptýlení wording. |
| 18 | Axis comparison | H2 | Stejná data, jiné osy | † Question + takeaway; neutral colours. |
| 19 | Two-direction reading | H2 | Rozptýlení čteme ve dvou směrech | † Renamed; orange focus strips. |
| 20 | Interpretation MCQ | H2 (blank) | — | † Moved before the spine slide so students commit before the answer; option cards; orange circle on B. |
| 21 | Biological spine return | H2 | Mají tučňáci s delší ploutví také vyšší tělesnou hmotnost? | † Now resolves the MCQ. |
| 22–23 | Group colour + interpretation | H2 ×2 | Stejná data, ale s druhem · Co se po obarvení změnilo? | palmerpenguins species palette (documented exception). |
| 24 | Need for a number | H2 | Jedno číslo pro společný pohyb | † Answer revealed after discussion. |
| 25 | Section divider | H1 | Jak spočítat společný pohyb? | † Renamed from Kovariance. |
| 26–27 | Centre and one point | H2 ×2 | Průměry v grafu · Jeden bod pod lupou | † Product named; point orange. |
| 28–29 | Quadrants + vote | H2 (blank) + H2 | — · Ve které další části grafu budou součiny také kladné? | † Standard numbering; answer I a III. |
| 30–33 | Calculation | H2 ×4 | Čtyři tučňáci ručně · Kovariance je „průměr součinů odchylek“ · Odchylky a jejich součiny v R · Stejný výpočet pomocí `cov()` | † Evaluated R output; Czech decimals in prose. |
| 34 | Unit prediction | H2 | Záleží na jednotkách? | † Prediction before values. |
| 35 | Section divider | H1 | Číslo nezávislé na jednotkách | † Renamed from Korelace. |
| 36 | Pearson introduced | H2 | Kovariance bez jednotek: Pearsonovo *r* | † Replaces the two-coefficient definition slide. |
| 37–38 | Calibration interaction | H2 ×2 | Odhadněte korelaci · Stejná data, ale s hodnotou *r* | † New guess → reveal pair, identical draws. |
| 39 | Negative pattern | H2 | Výš v horách, chladněji? | † Data-first heading. |
| 40–41 | Executable Pearson | H2 ×2 | Čtyři tučňáci v kódu · Všichni tučňáci v kódu | † Pearson only, evaluated; interpretation attached. |
| 42 | Spearman introduced | H2 | Pořadí místo hodnot: Spearmanova korelace | † New slide. |
| 43–45 | Coefficient comparison | H2 ×3 | Kde se Pearson a Spearman mohou lišit? · Rostoucí vztah nemusí být přímka · Čtyři situace korelace | † Curve without injected outliers; full labels. |
| 46 | Spine interpretation | H2 | Co nám to říká právě o tučňácích? | |
| 47 | Causality | H2 | Korelace ukazuje asociaci, ne příčinu | † Merged image + panels; provenance footer. |
| 48 | Section divider | H1 | Jak vybrat první graf? | |
| 49 | Group commitment | H2 | Tři dvojice, tři různé otázky | |
| 50–52 | Numerical × numerical | H2 ×3 | Ploutev × hmotnost: body, nebo barva? · …: kde je bodů nejvíc? · …: kterou variantu zvolíte? | † Body+barva paired; interaction retained. |
| 53–56 | Categorical × numerical | H2 ×4 | Druh × hmotnost: body, nebo krabice? · …: jaký tvar má rozložení? · …: který druh převažuje? · Který graf byste udělali jako první? | † Paired views; interaction now states the question. |
| 57–60 | Categorical × categorical | H2 ×4 | Druh × ostrov: každý tučňák jedním čtverečkem · …: sloupce počtů a podílů · …: hezčí, nebo čitelnější? · Kdy potřebujeme počty a kdy podíly? | † Counts/proportions paired. |
| 61 | Gallery rule | H2 | Který graf zvolit jako první? | † Single canonical table replaces four slides. |
| 62 | Section divider | H1 | Závěr | † Renamed from Co dál?. |
| 63 | Model handoff | H2 | Co přidá model? | |
| 64 | Earned recap | H2 | Shrnutí | † Mirrors outcomes. |
| 65 | Closing question | H2 | Co potřebujete vidět, než napíšete „delší ploutev, těžší tučňák“? | † Open spine question + bridge fragment (L01 pattern). |

Count: 65 physical slides (previously 72): +1 divider, +1 data split, +1 calibration reveal, +1 Spearman slide; −1 causation merge; −11 gallery consolidation. H1 dividers at rows 8, 25, 35, 48, 62.

## Knowledge-state ledger changes

- Covariance block: *součin odchylek* is now named on row 27 before row 29 asks about products.
- Correlation block: *r* and its scale are introduced on row 36 before any figure shows *r*; Spearman, rank and “stále roste” are introduced on row 42 before row 43 compares the coefficients. *Monotónní* appears only in a speaker note and in the written materials, where it is defined.
- Written materials: species structure (rows of the variability block) now precedes covariance, as in the slides; correlation is not used before its section.

## Independent review and resolutions

A separate read-only reviewer (`.ai/agents/vision-corrector.md`) inspected both complete artifacts, the exercise edits, this record and the rendered PDFs. Verdict: no blocking findings. Resolved should-fix items:

1. The interpretation MCQ came after the slide that states its answer (pre-existing order) → MCQ moved first (map rows 20–21).
2. Rendered clipping/crowding: slide 14 point labels, quadrant numerals outside the frame, slide 29 crowding, gallery subtitles and tick collisions, unequal y scales → labels repositioned, quadrant frame fixed with `coord_cartesian()`, smaller figure, shorter subtitles, common y range, fewer breaks, and a shared full-width legend below each pair (`R/Functions/combine_gallery_pair.R`).
3. Waffle meaning differed between artifacts → the written waffle now also shows one square per penguin.
4. The 2D-density view was missing from the written gallery → added as a tab.
5. Covariance table products rounded so the column did not sum to the stated total → products shown with their decimal.
6. Slide 41 called the pooled *r* “těsný… stejně jako ukázal oblak” → “silný rostoucí vztah”; within-species caveat stays on the spine slide.
7. Three `L01` mentions remained in the exercise → replaced (plus two `L02` mentions in prose).
8. Pair identity strips and graph-name highlights borrowed model purple; orange focus was used in every gallery caption → neutral olive strips, graph names in bold or graphite, captions without orange, neutral fills for count/density tiles.

Minor items also applied: mirrored (not rotated) cloud on axis swap; curve slide explicitly explains candidate C; repeated pair question on slide 9 turned into a statement; gallery headings `Ploutev × hmotnost`; single bridge to the next lesson; skripta forward reference, list order, (n − 1) cancellation sentence and *numerická proměnná* wording. Not changed: the meme's provenance (open item).

A separate read-only glossary-coverage pass (`.ai/agents/glossary-coverage-reviewer.md`) found no invalid slugs and no misuse of `rozptyl`. Resolved: first-occurrence links in the variance recap heading, species-reveal paragraph, Pearson subsection heading, misconception section and closing answer; removed a mismatched `odhad` link (prediction of one individual) and a link attached to “osy”; restored the `pseudoreplikace` TODO.

## Validation

- Canonical renders (`R/render_skripta.R`, `R/render_presentation.R` with `POLLSLIVE_RENDER_MODE=offline`) pass after the final edits; HTML, Typst PDF and the decktape PDF regenerated. Remaining render warnings are pre-existing (SCSS “variable used before declaration” from the shared theme, `fs` build note, renv out-of-sync notice).
- Presentation: 65 physical slides in the static PDF. Every page inspected on contact sheets after each render; affected slides re-inspected after each fix. Written materials: all 33 PDF pages inspected; the four-situation labels, closing box and new gallery tabs checked at full size.
- Clean-session check: all 10 student-visible presentation chunks run with `Rscript --vanilla` from a folder containing only `data/palmer_penguins.csv`; outputs match the slides (cov 2166.667; *r* 0.931 for four penguins; *r* 0.871 and Spearman 0.840 for all penguins). Written-material visible chunks run during render; inline values checked in the HTML (344/342 rows; Biscoe 167 and Torgersen 51 penguins; cov 9824 mm·g).
- Source checks: unique chunk labels, UTF-8 without replacement characters, no new raw HTML, all glossary slugs valid; every displayed presentation figure has `fig-alt`.
- Removed eight gallery PNGs orphaned by the paired layout (`kv_kv_body`, `kv_kv_barva`, `kv_kat_body`, `kv_kat_boxplot`, `kv_kat_violin`, `kv_kat_histogram`, `kat_kat_sloupce`, `kat_kat_podily`). Older unreferenced assets that predate this revision were left untouched (`galerie_*`, `kat_kat_dlazdice`, `korelace_linear`, `kv_kat_hustota`, `kv_kv_smer`, `tri_rychle_priklady`).
- Not done: interactive HTML fragment-state walk-through in a browser (static PDF shows final fragment states only); live PollsLive synchronization; public deployment.

## Open items

- `Presentation/Materials/korelace_neni_kauzalita.png` is an internet meme of unknown authorship. The slide states this, but its reuse terms in a public CC BY release are unverified; replace it or confirm the source before the next public release.
- Add a `pseudoreplikace` slug to `slovnik/glossary_data.yaml` (canonical glossary change, separate repository); the TODO comment marks the place.
- Decide whether to delete the older unreferenced presentation assets listed under Validation.
- The corrected four-mammal retrieval image (2026-10-05) is still not synchronized to the live quiz.
- Final human review completed: Ondřej Mottl accepted the polish on 2026-10-06 and separately approved execution of the commit plan.

## Addendum: requested additions during final human review (2026-10-06)

Requested by Ondřej Mottl during his review of the learning materials (“there is not an Extra box with the process of generation of data/palmer_penguins.csv”; “In the presentation, I would like to add a gallery from Anscombův kvartet”). This explicit request is the human decision for both additions.

- **Learning materials:** new collapsed box `Doplňující: jak vznikl soubor palmer_penguins.csv` after the data checks (L01 pattern “odkud data pocházejí a co v nich chybí”). It gives data provenance and citations (Gorman, Williams & Fraser 2014; Horst et al. 2020; CC0), states that the CSV is an unmodified export of `palmerpenguins::penguins` 0.1.1 (all rows and columns computed inline, missing-value counts inline), links `R/prepare_penguin_data.R` on `main`, and shows a base-R equivalent (`as.data.frame()` + `write.csv(..., row.names = FALSE, na = "")`, not evaluated). Verified: the base-R export read back with `read.csv(na.strings = "")` is identical to the course CSV.
- **Presentation:** two slides after `Čtyři situace korelace` — `Čtyři soubory, stejná čísla` (computed summary table of means, variances and *r* with a sketch-and-share prompt) and the reveal `Stejná čísla, jiné grafy` (four panels with realised *r* in the panel titles, captions per panel, takeaway “proto se nejdřív díváme na graf”). Values come from R's built-in `anscombe`; same construction as the written Extra. Story map: new rows after row 45 (H2 data-moment/prediction; H2 evidence reveal), deck 65 → 67 physical slides; dividers unchanged.
- **Validation:** both canonical renders pass (presentation 67 pages, written PDF 34 pages); the new slides and box inspected at full size; table width and panel labels corrected after the first render.
- **Further requests (same review):** removed the slide `Ploutev × hmotnost: kterou variantu zvolíte?` as obsolete (its three situations duplicated the paired gallery captions and the following group-comparison vote). The four two-plot gallery slides now reveal in two steps: the left plot and caption first, then the right plot, shared legend and caption on one click (`r-stack` with a left-only image of identical layout, `combine_gallery_pair(show_right = FALSE)`, shared `fragment-index`). Deck 67 → 66 physical slides; longest stretch without an interaction in the gallery is now four slides. Verified all fragment states with `decktape --fragments=true` (142 states); the static PDF shows the final state.

## Final human acceptance

Ondřej Mottl, 2026-10-06: “I consider the polish to be done”. The subsequent instruction “I approve this plan, go ahead and commit” authorizes the proposed local commit batches. The remaining external-release and glossary items above are retained as future work; final human review is complete.
