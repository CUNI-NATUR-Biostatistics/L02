# L02 learning-material maintenance story map

- Artifact: complete `Learning_materials/skripta.qmd`, including retained September Extras.
- Status: complete proposed map; heading-strip and chronological knowledge-state audits complete.
- Human approver: Ondřej Mottl
- Approval date: 2026-10-05
- Decision and requested revisions: explicitly approved separately from the presentation map. Human reply: “Approve the learning-material map”. Retain the already taught summaries; no additional map revisions requested.
- Headings below are planning candidates. Retain the existing level-two backbone and complete gallery; corrections concern self-study clarity and accuracy rather than compression.

## Complete story map

| Order | Internal role | Student-facing heading | Speaker note / authoring intent |
|---|---|---|---|
| 1 | Biological hook | Úvod | Ask whether longer flippers accompany greater mass; invoke the L01 experience of one variable. |
| 2 | Outcomes | Co si z této lekce odnést | Graph reading, paired variation, correlation, graph selection and interpretation limits. |
| 3 | Dataset encounter and executable entry | Jaká data budeme používat | Present organism, observational unit, units, source and delivered CSV; visible base-R import, preview and paired missingness selection precede use of `data_tucnaci`. |
| 4 | First whole-data view | První graf: délka ploutve a tělesná hmotnost | Show the full cloud and reproduce it in base R from the preceding entry. |
| 5 | Observation prompt and payoff | Co v grafu vidíme | Describe direction, scatter and unusual observations without causal conclusions. |
| 6 | Name variable types after encounter | Jaké proměnné budeme sledovat | Name numerical variables and categorical species using the observed data. |
| 7 | Two-axis scatter and retained L01 recap | Rozptyl ve dvou směrech | Retain strips, the observed four-Adelie table, variance and standard deviation; use exact intermediate values, rounded conclusions, and make the L01 recap explicit. |
| 8 | Biological sources of variation | Proč jsou data rozptýlená | Distinguish individual, group and measurement variation; no formal variance partition. |
| 9 | Shared deviations, concrete to abstract | Kovariance: jak se dvě proměnné pohybují společně | Reuse the same observed subset, table, deviation products, words, numbers and symbols. Both magnitude and sign of products matter. Correct the one-axis unit conversion. |
| 10 | Standardised association | Korelace jako stručný číselný popis | Interpret Pearson and Spearman, show runnable calculations, and contrast positive, negative, curved and unassociated patterns. Constructed examples are visibly labelled. |
| 11 | Summary insufficiency checkpoint | Stejná čísla, jiné grafy | Retain the datasets sharing numerical summaries but differing visually; graph inspection remains necessary. |
| 12 | Interpretation boundary | Korelace není kauzalita | Correlation quantifies association; causal interpretation depends on study design and assumptions. A model alone does not establish causation. |
| 13 | Group structure | Stejný graf, ale s viditelnými druhy | Revisit pooled versus within-species patterns; retain the aggregation Extra without partial regression or slope claims. |
| 14 | Gallery orientation | Jak typ proměnných určuje výběr grafu | Question and variable types guide a first view, rather than an automatic recipe. |
| 15 | Numerical pair gallery | Dvě numerické proměnné: délka ploutve a hmotnost | Preserve scatter, category colour and overlap/density comparisons; native base-R comparison remains. |
| 16 | Category and numerical gallery | Kategoriální a numerická proměnná: druh a hmotnost | Preserve group points, boxplot, violin and distribution-width comparisons; distinguish individual data from distribution summaries. |
| 17 | Category pair gallery | Druh a kategorie délky ploutve | Preserve counts, proportions, heatmap and waffle; verify 100 distinct waffle cells per category. |
| 18 | Ordered-category gallery | Seřazené kategorie délky ploutve a hmotnost | Retain ordered categories and medians; do not imply a longitudinal trajectory. |
| 19 | Selection synthesis | Rychlá tabulka: který graf zvolit jako první? | Keep the full comparison and make the table fit the output. |
| 20 | Dependence Extra and limits | Co zatím ještě nemůžeme tvrdit | Retain the dependence-between-rows Extra and limits of graphical conclusions; no effective-sample-size formula or inference. |
| 21 | Course handoff | Co bude následovat dál | Models express relations in original units; later estimation adds uncertainty. Do not claim only models quantify association or prove effects. |
| 22 | Earned recap | Shrnutí | Recap only graph reading, paired variation, covariance/correlation and interpretation boundaries already shown. |
| 23 | Self-study reference | Slovníček pojmů | Use canonical glossary entries and first-occurrence coverage within each level-two section. |

## Chronological knowledge-state ledger

| Block | May assume before | Introduced or earned here | Must not assume yet | Visible evidence / experience |
|---|---|---|---|---|
| Hook and outcomes | L01 observations, variable types, one-variable summaries and graphs | Need to consider two measurements jointly | Correlation, covariance, regression, inference | Biological question with organism and units |
| Dataset and first graph | Rows, columns, basic R inspection and missing values from L01 | CSV import path, complete paired measurements and one point per penguin | Hidden data preparation or unintroduced package objects | Visible import, preview, missingness and complete-pair selection |
| Graph reading and types | Paired points and axes | Direction, scatter, groups and numerical/category pair choices | Association as proof of mechanism | Full cloud, prompts and interpretation |
| Variance/SD recap | L01 means, variance and SD; paired graph | Transfer the same one-variable summaries to each axis | Covariance formula before deviation products | Observed four-penguin table; exact intermediate calculations |
| Covariance | Means and deviations | Products, positive/negative contributions, sample covariance and unit dependence | Pearson normalisation or sign from quadrant counts alone | Table → word equation → numerical equation → symbols |
| Correlation | Covariance and SD | Standardisation, Pearson linear association, Spearman ranks, pattern limits | Significance tests, confidence intervals, causal claims | Runnable code and labelled real/constructed comparison plots |
| Same summaries and causality | Numerical summaries and graph patterns | Graphs distinguish equal summaries; association has limited causal interpretation | Regression establishes causal effects automatically | Contrasting datasets and causal caution |
| Species and aggregation | Category colour and pooled pattern | Pooled and within-group views can differ | Partial correlation, adjustment, interaction coefficients | Full species-coloured cloud and retained aggregation Extra |
| Complete gallery | Variable types and basic distributions from L01 | Alternatives for pairs, overlap, counts versus proportions, ordered categories | Formal density estimation methods or modelling the category order | Every retained gallery example and choice prompt |
| Limits and dependence Extra | Observational unit and plotted rows | Repeated individuals, nests or sites may share information | Mixed models, formal remedies or effective sample size | Retained conceptual examples |
| Handoff and recap | Descriptive association and graph-selection results | Models can give predictions/relations in original units; uncertainty is a later topic | Model syntax, inference or causal identification | Explicit bounded handoff and earned summary |

## Audit decisions

- Retain: L02's full graph gallery, paired-data story, concrete covariance build, already taught summaries, retrieval continuity and approved Extras.
- Adapt from L01: visible data entry and missingness, exact table-to-equation values, beginner-safe code and self-contained interpretation.
- Omit with reason: L01 administrative opening and its mammal-specific observational-unit discussion do not serve the penguin question.
- No new method or dataset is introduced; constructed supplementary patterns remain teaching illustrations with explicit provenance.
- Current map approval is complete; implementation and independent full-artifact review follow.
