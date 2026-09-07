# L02 PollsLive retrieval quiz: integration map and exact questions

- Date: 2026-09-04
- Branch: `lesson/l02-retrieval-quiz`
- Workstream: Stage 4–5 presentation integration

Integration-map status: approved.

Exact-question status: approved.

Human approval: initially approved by Ondřej Mottl on 2026-09-04, after the document was revised to show the complete L02 lesson context and the information visible to students. Ondřej approved the revised questions and combined participation-slide treatment on 2026-09-07.

This document describes a focused change to the existing, approved L02 presentation. It is not a replacement story map for the whole lesson. The Mentimeter and PollsLive prototype questions are not approved production content and are not the source of this proposal.

## Existing lesson and scope of the change

The current L02 presentation contains 67 rendered states and was approved by Ondřej Mottl on 2026-07-25. Its complete source is [Presentation/presentation.qmd](https://github.com/CUNI-NATUR-Biostatistics/L02/blob/main/Presentation/presentation.qmd), and the approval is recorded in the [L02 coherence audit](https://github.com/CUNI-NATUR-Biostatistics/L02/blob/main/Workflow/records/2026-07-24-coherence-polish.md).

The retrieval quiz replaces only the existing one-slide L01 callback, `Co si neseme z minulé lekce?`. It does not reopen or restructure the remainder of the approved lesson.

## Complete L02 integration map

| Position in the existing lesson | Content | Status | Function of the section | Proposed change |
| --- | --- | --- | --- | --- |
| Opening | `Vztahy dvou proměnných a vizualizace` | Existing and unchanged | Introduce the lesson topic. | None. |
| Opening | `Pomůže nám druhá proměnná?` | Existing and unchanged | Establish the penguin question: whether longer flippers accompany greater body mass. | None. |
| Opening | `Výsledky učení` | Existing and unchanged | State the approved L02 learning contract. | None. |
| Immediately after learning outcomes | `Co si pamatujete z minulé lekce?` | New; replaces the current one-slide callback | Introduce an anonymous, ungraded three-question retrieval activity and display the permanent participation QR and link. | Centre the heading, instruction, transparent-background QR, and new-window link; wait approximately 2–3 minutes without displaying aggregate results. |
| Retrieval block | `Jak odpovídala skupina?` | New | Display anonymous aggregate results after all students have committed their answers. | Use the PollsLive results embed, reload control, and external-open fallback. |
| Retrieval block | `Který druh spí nejdéle?` | New native review | Compare values in the familiar four-row L01 table. | Discuss Question 1 and reveal its explanation. |
| Retrieval block | `Kde je nejvyšší sloupec?` | New native review | Re-read the modal interval from the approved L01 sleep histogram. | Discuss Question 2 and reveal its explanation. |
| Retrieval block | `Jaký je průměr?` | New native review | Distinguish the printed mean from the median in familiar L01 R console output. | Discuss Question 3 and reveal its explanation. |
| End of retrieval block | `Od jedné proměnné ke dvěma` | New bridge | Reconnect the three L01 artifacts to the L02 need to preserve paired measurements. | Replace the bridging function of the old callback slide. |
| Immediately after retrieval | `Diskuze se sousedem` | Existing and unchanged | Ask students how two measurements belonging to each penguin could be displayed together. | None; the retrieval bridge prepares this discussion. |
| First data sequence | `Naše data` and the progressive observation build | Existing and unchanged | Move from two observations to the complete penguin dataset. | None. |
| First graphical sequence | `Co už v tomto grafu vidíme?`, `Stejná data, jiné osy`, and `Rozptyl čteme ve dvou směrech` | Existing and unchanged | Build the first two-variable graph and read variation along both axes. | None. |
| Biological interpretation | Return to the penguin question and add species | Existing and unchanged | Expose biological structure that an uncoloured scatterplot can conceal. | None. |
| Covariance section | Deviations, products and `cov()` | Existing and unchanged | Build covariance transparently from four penguins and then all observations. | None. |
| Correlation section | Pearson and Spearman correlation, calibration gallery and examples | Existing and unchanged | Introduce scale-free summaries of direction and tightness. | None. |
| Interpretation boundary | `Korelace není kauzalita` | Existing and unchanged | Separate visible association from causal or effect claims. | None. |
| Graph-choice gallery | Numeric × numeric, numeric × categorical, and categorical × categorical | Existing and unchanged | Choose an initial graph from the types of both variables. | None. |
| Bridge to L03 | `Co přidá model?` | Existing and unchanged | Motivate an estimated relationship in the following lesson. | None. |
| Ending | `Shrnutí` | Existing and unchanged | Return to the biological question and approved learning outcomes. | None. |

## Exact production questions

All three are ordinary, single-answer multiple-choice questions. The displayed evidence is part of each question in PollsLive and in the native RevealJS fallback. The option order below is intentional: the correct option is not always in the same position.

### Question 1: compare values in a table

**Displayed artifact**

| Druh (species) | Spánek za den (h) |
| --- | ---: |
| Cheetah | 12.1 |
| Owl monkey | 17.0 |
| Mountain beaver | 14.4 |
| Greater short-tailed shrew | 14.9 |

**Question**

Který z uvedených druhů spí podle tabulky nejdéle?

**Options**

1. Cheetah
2. Owl monkey — **correct**
3. Mountain beaver
4. Greater short-tailed shrew

**Explanation shown in the native discussion**

Porovnáme hodnoty ve sloupci `Spánek za den (h)`. Nejvyšší hodnota je **17.0 h** v řádku `Owl monkey`.

**Artifact source and accessibility**

Faithful reuse of the approved L01 slide `Čtyři druhy, čtyři řádky`, derived from the `sleep_total` column of `ggplot2::msleep`. Alt text: “Tabulka čtyř druhů savců. Cheetah má 12.1, Owl monkey 17.0, Mountain beaver 14.4 a Greater short-tailed shrew 14.9 hodiny spánku za den.”

### Question 2: read a histogram interval

**Displayed artifact**

The approved L01 figure `Presentation/Materials/spanek_histogram.png`, with the horizontal axis `Celkový spánek za den (h)` and vertical axis `Počet druhů`.

**Question**

Ve kterém intervalu délky spánku je podle histogramu nejvíce zastoupených druhů?

**Options**

1. 10–12 h
2. 12–14 h
3. 8–10 h — **correct**
4. 16–18 h

**Explanation shown in the native discussion**

Nejvyšší sloupec stojí nad intervalem **8–10 h**. Poloha sloupce na vodorovné ose určuje interval spánku; jeho výška vyjadřuje počet druhů v tomto intervalu.

**Artifact source and accessibility**

Direct reuse of the approved L01 sleep histogram generated from non-missing `sleep_total` values in `ggplot2::msleep`, with two-hour bins. Alt text: “Histogram celkové délky spánku savců. Nejvyšší sloupec leží v intervalu 8 až 10 hodin spánku za den.”

### Question 3: distinguish mean and median in R output

**Displayed artifact**

```r
vec_spanek_deviti <-
  c(
    2.9, 3.8, 4.0, 8.0, 8.4,
    9.1, 9.7, 10.1, 12.5
  )

mean(
  x = vec_spanek_deviti
)
# [1] 7.611111

median(
  x = vec_spanek_deviti
)
# [1] 8.4
```

**Question**

Jaká je podle výstupu průměrná délka spánku devíti druhů?

**Options**

1. 7.611111 h — **correct**
2. 8.4 h
3. 4.0 h
4. 9.1 h

**Explanation shown in the native discussion**

Průměr vypočítává funkce `mean()`, která vrací **7.611111 h**. Funkce `median()` vrací 8.4 h; hodnoty 4.0 h a 9.1 h jsou jednotlivá pozorování ve vektoru.

**Artifact source and accessibility**

Faithful excerpt from the approved L01 mean-and-median sequence. Alt text: “R kód vytváří vektor devíti hodnot spánku. Funkce mean vrací 7.611111 a funkce median vrací 8.4.”

## Knowledge-state ledger

| Point in the lesson | Knowledge students may use | New knowledge introduced here | Deliberately withheld until later | Evidence |
| --- | --- | --- | --- | --- |
| Before retrieval | L01 rows connect represented species with values; histograms group observations into intervals; R prints function results below calls | None | scatterplots, covariance and correlation | approved L01 table, histogram and console output |
| Table review | Compare values within one column and retain the row label of the maximum | None | relationships between variables | four-row mammal table |
| Histogram review | Horizontal position identifies an interval and bar height represents its frequency | None | graph choice for pairs of variables | approved sleep histogram |
| Console review | Distinguish the mean from the median and associate each printed result with its function call | None | model summaries and regression output | familiar mean and median calls |
| Retrieval bridge | Each species row can contain both sleep duration and body mass | A two-variable display must preserve which two values belong together | formal scatterplot reading, covariance and correlation | transition from one table column to a paired set of columns |
| Remainder of L02 | Existing approved lesson sequence | All approved L02 content | model effect estimate until L03 | existing L02 presentation |

## Approval scope

Approval of this document approves:

- the placement and role of the retrieval block within the complete L02 lesson;
- replacement of the current one-slide L01 callback by the retrieval block and bridge;
- the exact wording, option order, correct answers, explanations, artifacts, alt text and provenance for all three questions.

Approval does not authorize creating or publishing the PollsLive poll, enabling its schedule entry, committing or merging L02 changes, or altering any other approved L02 section. Those remain separate implementation, review and Git/GitHub steps.

## Local implementation status

- Migrated to the production local-render contract on 2026-09-06 after explicit authorization from Ondřej Mottl.
- The authoritative version-2 definition is `pollslive/quiz.json`; its three questions, option order, correct answers, explanations, media descriptions, and provenance match the approved content above.
- Poll identity is absent from teaching inputs and will be persisted only in the protected central registry.
- `pollslive/config.json` pins the reviewed `_internal` client revision and directs the canonical `_brand` render helper to the trusted synchronization workflow on `_internal` `main`.
- The table and console images are generated by `R/render_pollslive_assets.R`; the script also verifies that the committed histogram has the approved L01 SHA-256 checksum before every render.
- Generated includes, public metadata, receipts, QR assets, client caches, and temporary synchronization output remain ignored and outside Git.
- The lesson workflow validates the definition, configuration, and referenced evidence without credentials; the trusted central workflow independently validates all inputs again before a PollsLive write.
- The revised definition was synchronized from immutable source commit `1d0f66c590c960ffb6be2994c534685e09b39f5d` on 2026-09-07. The trusted workflow updated the existing production poll `cmtq7ukxs001co201ysrnuojb` rather than creating a duplicate and returned input checksum `72f16a0a9ab28ba03203976d92a09f6be3db4b773201c98df638feceb816e34d`.
- The synchronized poll remained closed after the content update: voting and its public aggregate-results page were both disabled. The local render then produced the standalone HTML and a 71-slide static PDF; the PDF omits the QR and remote-results slide while retaining all three questions, evidence images, answers, explanations, and the bridge.
- The final localhost presenter endpoint returned the corrected standalone HTML with status 200 and `Cache-Control: no-store`; unrelated repository paths returned 404. The PollsLive embed endpoint returned status 200 with `frame-ancestors *`. Interactive browser control was unavailable during this run, so iframe focus/navigation and the physical-device acceptance test remain outstanding.
- A separate read-only reviewer confirmed after client revision `94280a90aecd3c7b948cfb99fd5489897881e27d` that the compiled results, fallback, and navigation containers are valid; no literal Quarto fence remains; and the 71-slide PDF has no clipping in the retrieval questions. No PollsLive-change blocker remains.
- The L02 activation entry remains disabled until interactive localhost browser testing and physical-device acceptance are complete.
