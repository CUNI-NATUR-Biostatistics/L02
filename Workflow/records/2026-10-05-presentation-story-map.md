# L02 presentation maintenance story map

- Artifact: complete `Presentation/presentation.qmd`, including the unchanged PollsLive callback.
- Status: complete proposed map; heading-strip and chronological knowledge-state audits complete.
- Human approver: Ondřej Mottl
- Approval date: 2026-10-05
- Decision and requested revisions: approved explicitly after adding the H1/H2 classification requested by Ondřej Mottl. Retain the already taught summaries and the full gallery. Human reply: “Approve the revised presentation map”.
- Each row below is a planned physical slide, including section dividers and the retrieval include. Fragment states remain local to their slide. Verified count: 72 slides in HTML and 72 static PDF pages.
- Preserve the complete gallery and existing local semantic highlighting. Add a self-contained CSV entry and divide the covariance R calculation into runnable preparation and calculation views; remove the duplicate gallery divider/task, giving a net unchanged count.

## Complete story map

| Order | Internal role | Slide type / heading level | Student-facing heading | Speaker note |
|---|---|---|---|---|
| 1 | Title | H2: content slide | Mají tučňáci s delší ploutví také vyšší tělesnou hmotnost? | Biological question names the organism and measurements. User-requested title illustration pairs weighing and flipper measurement on the same individual; AI disclosure and provenance accompany it. |
| 2 | Visual hook | H2: content slide | Pomůže nám druhá proměnná? | Organism illustration and the biological question precede formal outcomes. |
| 3 | Previous-lesson retrieval | H2: retrieval title | Co si pamatujete z minulé lekce? | Retain PollsLive and static/no-network fallback; only L01 content. |
| 4 | L01 retrieval commitment | H2: generated retrieval question | Který z uvedených druhů spí podle tabulky nejdéle? | Retain the existing evidence, poll or individual commitment and static answer reveal; no L02 concepts. |
| 5 | L01 retrieval commitment | H2: generated retrieval question | Ve kterém intervalu délky spánku je podle histogramu nejvíce zastoupených druhů? | Retain the existing evidence, poll or individual commitment and static answer reveal; no L02 concepts. |
| 6 | L01 retrieval commitment | H2: generated retrieval question | Jaká je podle výstupu průměrná délka spánku devíti druhů? | Retain the existing evidence, poll or individual commitment and static answer reveal; no L02 concepts. |
| 7 | Outcomes | H2: content slide | Výsledky učení | Contract: read, describe association, select a graph and state limits. |
| 8 | Transfer from L01 | H2: content slide | Od jedné proměnné ke dvěma | Recall existing summaries rather than introduce them as new. |
| 9 | Measurement context | H2: content slide | Dvě hodnoty patří jednomu tučňákovi | Illustration connects the two measurements to one individual. |
| 10 | Commitment | H2: content slide | Diskuze se sousedem | Ask students how paired measurements become points; allow silent individual response. |
| 11 | Reproducible data entry | H2: content slide | Tabulka tučňáků | Show CSV import, first rows, units and paired missingness selection before full-data code. |
| 12 | Progressive paired-data build | H2: content slide | Dva tučňáci | First two members of the observed four-Adelie subset; visible base-R construction and points. |
| 13 | Extend the same build | H2: content slide | Čtyři tučňáci | Add the other two observed rows; keep plot and code readable. |
| 14 | Whole-data view | H2: content slide | Všichni tučňáci | Plot the previously introduced complete-pair object. |
| 15 | Observation commitment | H2: content slide | Co v tomto grafu vidíte? | Prompt before interpretation; evidence remains on the slide. |
| 16 | Scale comparison | H2: content slide | Stejná data, jiné osy | Compare axes without changing data. |
| 17 | Retained L01 recap | H2: content slide | Rozptyl čteme ve dvou směrech | Retain variability and already taught summaries; compare strips. |
| 18 | Biological spine return | H2: content slide | Mají tučňáci s delší ploutví také vyšší tělesnou hmotnost? | Account for observed association and what remains open. |
| 19 | Interpretation commitment | H2: content slide | — | Retain the conceptual multiple-choice question about association and causal interpretation; commitment precedes the answer reveal. |
| 20 | Group-coloured encounter | H2: content slide | Stejná data, ale s druhem | Preserve species colours as a documented categorical palette. |
| 21 | Group interpretation prompt | H2: content slide | Co se po obarvení změnilo? | Compare pooled and within-group impressions. |
| 22 | Need for numerical description | H2: content slide | Jedno číslo pro společný pohyb | Ask what a joint numerical summary should capture. |
| 23 | Section divider | H1: section-divider slide | Kovariance | Keep an explicit minimal divider. |
| 24 | Centre encounter | H2: content slide | Průměry v grafu | Put the already taught means on both axes. |
| 25 | One observation's deviations | H2: content slide | Jeden bod pod lupou | Read signed deviations in the visible plot. |
| 26 | Quadrant build | H2: content slide | — | Show positive product in a first quadrant. |
| 27 | Sign commitment | H2: content slide | Ve které další části grafu budou součiny také kladné? | Preserve a response before reveal and verbal fallback. |
| 28 | Concrete table | H2: content slide | Čtyři tučňáci ručně | Same observed rows as the progressive build and written materials. |
| 29 | Numerical and symbolic synthesis | H2: content slide | Kovariance je průměr součinů odchylek | Both magnitude and sign matter; divide by n−1 for sample covariance. |
| 30 | Runnable R preparation | H2: content slide | Odchylky a jejich součiny v R | Show means, deviations and products using the existing observed table. |
| 31 | R verification | H2: content slide | Stejný výpočet pomocí cov() | Manual sum and `cov()` use the same defined objects; fit both views. |
| 32 | Unit dependence | H2: content slide | Záleží na jednotkách? | Distinguish one-axis and two-axis conversions; values come from data. |
| 33 | Section divider | H1: section-divider slide | Korelace | Keep an explicit minimal divider. |
| 34 | Standardised concepts | H2: content slide | Dvě čísla pro vztah dvou proměnných | Pearson and Spearman arrive after graph/deviation experience. |
| 35 | Strength calibration | H2: content slide | Kalibrační galerie | Label computed sample r, with explicit constructed-example provenance. |
| 36 | Negative pattern | H2: content slide | Záporná korelace | Constructed elevation–temperature illustration, visibly disclosed. |
| 37 | Small-data executable application | H2: content slide | Čtyři tučňáci v kódu | Same observed four rows, Pearson and Spearman with generated results. |
| 38 | Whole-data executable application | H2: content slide | Všichni tučňáci v kódu | Use the visible CSV-derived object; move computed summaries to first use. |
| 39 | Pattern-choice commitment | H2: content slide | Kde se Pearson a Spearman mohou lišit? | Show three local unlabelled candidate patterns before voting; no absent four-case reference or exposed answer. |
| 40 | Curved pattern encounter | H2: content slide | Rostoucí vztah nemusí být přímka | Visibly constructed curve with outliers, followed by generated P/S results. |
| 41 | Comparison synthesis | H2: content slide | Čtyři situace korelace | Retain positive, negative, curve and no-association panels; computed values. |
| 42 | Spine interpretation | H2: content slide | Co nám to říká právě o tučňácích? | Return to the opening biological question without causal overclaim. |
| 43 | Causality misconception encounter | H2: content slide | Korelace není kauzalita | Keep the existing visual misconception checkpoint. |
| 44 | Causality payoff | H2: content slide | Korelace ukazuje asociaci, ne příčinu | Study design and assumptions govern causal interpretation. |
| 45 | Section divider | H1: section-divider slide | Jak vybrat první graf? | Single gallery orientation divider. |
| 46 | Gallery-choice commitment | H2: content slide | Tři dvojice, tři různé otázky | Retain group task and individual/no-vote route. |
| 47 | Gallery orientation | H2: content slide | Rozhodovací mapa | Orient, without replacing the full gallery. |
| 48 | Gallery payoff | H2: content slide | Tři první pohledy | Compare valid first views and questions. |
| 49 | Numerical gallery entry | H2: content slide | Numerická × numerická | Recall variable types and introduce retained alternatives. |
| 50 | Individual data | H2: content slide | N×N: body | Preserve scatter plot and discussion. |
| 51 | Add grouping | H2: content slide | N×N: kategorie barvou | Preserve category colour and interpret groups. |
| 52 | Overlap alternative | H2: content slide | N×N: když se body překrývají | Retain density/binning view and its purpose. |
| 53 | Choice checkpoint | H2: content slide | N×N: zvolte první graf | Require a reason grounded in the question. |
| 54 | Group comparison entry | H2: content slide | Numerická × kategoriální | Establish the pair and group comparison question. |
| 55 | Individual group data | H2: content slide | N×Kat: body ve skupinách | Preserve individual points. |
| 56 | Summary plus individuals | H2: content slide | N×Kat: boxplot + body | Keep raw-data evidence visible. |
| 57 | Distribution shape | H2: content slide | N×Kat: violin + boxplot | Preserve shape comparison and limitations. |
| 58 | Frequency view | H2: content slide | N×Kat: histogram | Keep distribution counts and binning interpretation. |
| 59 | Local composition | H2: content slide | N×Kat: skládaná hustota | Use count-weighted densities so unequal species counts are represented. |
| 60 | Choice checkpoint | H2: content slide | Který graf byste udělali jako první? | Retain commitment before payoff. |
| 61 | Category pair entry | H2: content slide | Kategoriální × kategoriální | Explain count/proportion question. |
| 62 | Count encounter | H2: content slide | Kat×Kat: waffle plot | Preserve the existing one-tile-per-penguin view by species and island; the written gallery has a separate 100-tile proportion example. |
| 63 | Count comparison | H2: content slide | Kat×Kat: skupinové sloupce | Preserve counts by species and category. |
| 64 | Composition comparison | H2: content slide | Kat×Kat: skládané podíly | Contrast proportions with unequal group totals. |
| 65 | Joint count view | H2: content slide | Kat×Kat: bublinové počty | Preserve bubble counts and readable legend. |
| 66 | Count/proportion commitment | H2: content slide | Kat×Kat: počty nebo podíly? | Ask which question each answers. |
| 67 | Selection synthesis | H2: content slide | Co rozhoduje? | Type, biological question and raw-data visibility. |
| 68 | Gallery recap | H2: content slide | Shrnutí základních vizualizací | Retain every family and repair PDF table clipping. |
| 69 | Section divider | H1: section-divider slide | Co dál? | Keep explicit minimal divider. |
| 70 | Bounded model handoff | H2: content slide | Co přidá model? | Original-unit relations/predictions; do not claim modelling proves causation or uniquely quantifies association. |
| 71 | Earned recap | H2: content slide | Shrnutí | Only learned graph reading, covariance/correlation and interpretation limits. |
| 72 | Closing conceptual commitment | H2: content slide | — | Retain the multiple-choice model-handoff question with a verbal or individual fallback. |

## Count reconciliation

The completed physical map contains 72 rows and the canonical HTML/static PDF renders contain 72 slides/pages. The unchanged retrieval include expands into its title and three question slides (rows 3–6); these are now explicitly represented rather than condensed into one include row. H1 section-divider slides are physical rows 23, 33, 45 and 69. The human-approved planning map used rows 20, 30, 42 and 66 before that unchanged include was expanded; the division and content decisions are unchanged.

## Chronological knowledge-state ledger

| Block / rows | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Opening / 1–7 | L01 units, types, mean, median, variance/SD and one-variable plots | Biological paired-data question | Covariance, correlation, models or inference in retrieval | Hook → unchanged L01 callback → outcomes |
| Paired build / 8–14 | Rows, columns and elementary R | Reproducible CSV entry, paired missingness, two → four → all points | Hidden objects or undisclosed fabricated measurements | Table, visible code and matching plots |
| Graph reading / 15–21 | Axes and paired points | Direction, scatter, scale and species groups | Causal effects or adjusted relations | Student commitments plus same-data comparisons |
| Covariance / 22–32 | L01 means/SD and scatter | Signed deviation products, sample covariance, units and runnable calculation | Quadrant counts determine sign or correlation before normalisation | Local evidence, observed table, word/number/symbol sequence and R |
| Correlation / 33–38 | Covariance and SD | Pearson linear pattern, Spearman rank pattern and calibrated strengths | Statistical tests or significance claims | Constructed calibration labelled with realised r; observed penguins in executable code |
| Pattern comparison / 39–41 | Both coefficients and negative pattern | Curvature/outliers can change their relationship; zero linear correlation need not exclude a pattern | Vote without its visual candidates | Three local unlabelled patterns before reveal; complete four-case synthesis after |
| Interpretation / 42–44 | Descriptive associations | Association versus causality and limits of pooled interpretation | Model fit as causal identification | Biological spine and visible caution |
| Complete gallery / 45–68 | L01 distributions/types and paired graph reading | Pair-dependent views, overlap, count-weighted composition and counts versus proportions | Formal density theory or an automatic graph recipe | Every retained plot family with a task and payoff |
| Handoff / 69–72 | Descriptive association and graph choice | Models in original units; later uncertainty | Slope calculations, confidence intervals or causal proof | Bounded handoff and earned recap |

## Audit decisions

- Retain the L02 strengths: progressive paired-data build, covariance construction, biological spine, complete graph gallery, semantic highlights and retrieval.
- Adapt L01's visible data entry, exact calculation-to-table alignment and beginner-facing code; retain previously taught summaries explicitly as recap.
- Omit the duplicate gallery divider and repeated orientation task because the earlier commitment/map/payoff already performs that role; retain all substantive graph examples and graph-family tasks.
- Speaker notes may guide timing; visible copy must not expose authoring stages or promise unavailable statistical knowledge.
- Current map approval is complete; implementation and independent full-artifact review follow.

## Map revision requested by the human

- 2026-10-05: Ondřej Mottl requested explicit identification of subheader/section-divider slides. Every row now specifies H1 or H2; rows 20, 30, 42 and 66 are separate minimal H1 divider slides. He then explicitly approved the revised map.

- Physical count audit: the unchanged four-slide retrieval include is expanded in the completed map; this bookkeeping correction adds no new student content.
