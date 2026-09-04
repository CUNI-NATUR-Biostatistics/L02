# L02 PollsLive retrieval quiz: integration map and exact questions

- Date: 2026-09-04
- Branch: `lesson/l02-pollslive`
- Workstream: Stage 4–5 presentation integration

Integration-map status: approved.

Exact-question status: approved.

Human approval: approved by Ondřej Mottl on 2026-09-04, after the document was revised to show the complete L02 lesson context and the information visible to students. No further revisions were requested.

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
| Immediately after learning outcomes | `Co si pamatujete z minulé lekce?` | New; replaces the current one-slide callback | Introduce an anonymous, ungraded three-question retrieval activity using familiar L01 evidence. | Insert the production quiz introduction. |
| Retrieval block | `Odpovězte na tři otázky` | New | Display the permanent participation QR and link while students answer all questions independently. | Wait approximately 2–3 minutes; do not display aggregate results. |
| Retrieval block | `Jak odpovídala skupina?` | New | Display anonymous aggregate results after all students have committed their answers. | Use the PollsLive results embed, reload control, and external-open fallback. |
| Retrieval block | `Kolik hodin spí gepard?` | New native review | Re-read a value from the familiar four-row L01 table. | Discuss Question 1 and reveal its explanation. |
| Retrieval block | `Kde je nejvyšší sloupec?` | New native review | Re-read the modal interval from the approved L01 sleep histogram. | Discuss Question 2 and reveal its explanation. |
| Retrieval block | `Co vypsala funkce median()?` | New native review | Re-read a numerical result from familiar L01 R console output. | Discuss Question 3 and reveal its explanation. |
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

### Question 1: read a table cell

**Displayed artifact**

| Druh (species) | Spánek za den (h) |
| --- | ---: |
| Cheetah | 12.1 |
| Owl monkey | 17.0 |
| Mountain beaver | 14.4 |
| Greater short-tailed shrew | 14.9 |

**Question**

Kolik hodin spánku za den má v tabulce gepard (*Cheetah*)?

**Options**

1. 12.1 h — **correct**
2. 17.0 h
3. 14.4 h
4. 14.9 h

**Explanation shown in the native discussion**

Najdeme řádek `Cheetah` a přečteme hodnotu ve sloupci `Spánek za den (h)`: **12.1 h**. Ostatní hodnoty patří jiným druhům v tabulce.

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

### Question 3: read R console output

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

Jakou hodnotu vrátila funkce `median(x = vec_spanek_deviti)`?

**Options**

1. 7.611111
2. 8.4 — **correct**
3. 4.0
4. 9.1

**Explanation shown in the native discussion**

Výsledek je vytištěn bezprostředně pod voláním `median()`: **8.4**. Hodnota 7.611111 je výsledek `mean()`; hodnoty 4.0 a 9.1 jsou jednotlivá pozorování ve vektoru.

**Artifact source and accessibility**

Faithful excerpt from the approved L01 mean-and-median sequence. Alt text: “R kód vytváří vektor devíti hodnot spánku. Funkce mean vrací 7.611111 a funkce median vrací 8.4.”

## Knowledge-state ledger

| Point in the lesson | Knowledge students may use | New knowledge introduced here | Deliberately withheld until later | Evidence |
| --- | --- | --- | --- | --- |
| Before retrieval | L01 rows connect represented species with values; histograms group observations into intervals; R prints function results below calls | None | scatterplots, covariance and correlation | approved L01 table, histogram and console output |
| Table review | Select the correct row and column before reading a value | None | relationships between variables | four-row mammal table |
| Histogram review | Horizontal position identifies an interval and bar height represents its frequency | None | graph choice for pairs of variables | approved sleep histogram |
| Console review | Associate a printed result with the function call immediately above it | None | model summaries and regression output | familiar mean and median calls |
| Retrieval bridge | Each species row can contain both sleep duration and body mass | A two-variable display must preserve which two values belong together | formal scatterplot reading, covariance and correlation | transition from one table column to a paired set of columns |
| Remainder of L02 | Existing approved lesson sequence | All approved L02 content | model effect estimate until L03 | existing L02 presentation |

## Approval scope

Approval of this document approves:

- the placement and role of the retrieval block within the complete L02 lesson;
- replacement of the current one-slide L01 callback by the retrieval block and bridge;
- the exact wording, option order, correct answers, explanations, artifacts, alt text and provenance for all three questions.

Approval does not authorize creating or publishing the PollsLive poll, enabling its schedule entry, committing or merging L02 changes, or altering any other approved L02 section. Those remain separate implementation, review and Git/GitHub steps.
