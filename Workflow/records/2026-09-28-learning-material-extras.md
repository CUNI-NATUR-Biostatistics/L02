# L02 learning-material Extras revision

## Approval and scope

- Date: 2026-09-28
- Branch: `lesson/l02-learning-material-extras`
- Human approver: Ondřej Mottl
- Decision: approved in the course-wide L01-L08 Extra-content review and explicitly authorised for implementation on 2026-09-28.
- Scope: deepen limits of bivariate displays and correlation without adding inference.

## Mandatory story map

- Artifact: Learning materials amendment
- Story-map status: complete
- Heading-strip audit completed: [x]
- Knowledge-state audit completed: [x]
- Human story-map approval: approved
- Approved by: Ondřej Mottl
- Approval date: 2026-09-28
- Approval decision and requested revisions: The course-wide L01-L08 Extra-content map was approved and implementation was explicitly authorised; no revisions were requested. The table below records that approved content in the canonical format without changing its substance.

| Order | Internal role | Student-facing heading | Speaker note |
|---|---|---|---|
| 1 | Dependence preview | Doplňující: sto bodů nemusí znamenat sto nezávislých informací | After identifying the observational unit, show why rows can still share information without introducing a formal remedy. |
| 2 | Aggregation warning | Doplňující: souhrnný vztah se může lišit od vztahů uvnitř skupin | After the species-coloured graph, distinguish the pooled visual pattern from within-species patterns using only graph-reading language. |

## Knowledge-state ledger

| Concept block | May assume before | Introduced or earned here | Must not assume yet | Evidence or experience |
|---|---|---|---|---|
| Dependence between rows | Each dot represents a paired observation. | Rows can share information through repeated individuals, nests, sites or dates. | Mixed-model syntax or formal effective sample size. | Conceptual examples only; L11 treats hierarchy and pseudoreplication. |
| Pooled and within-group patterns | Students have seen the pooled and species-coloured penguin plots. | A pooled association may combine within-group relations and between-group differences. | Slopes, partial regression, multivariable coefficients or causal adjustment. | Reuse species-coloured penguins; name confounding only as a later destination. |

## Leakage audit

- No correlation p-values, partial correlation or model coefficients are introduced.
- Both blocks ask students to recognise a data-structure problem, not solve it formally.

## Review and validation

- Independent amendment review: final cross-lesson re-review passed after removing premature slope/coefficient language; no remaining finding in the two new Extras.
- Glossary coverage: rechecked after the L01-L08 pass; the first new occurrence of `nejistota` is wrapped with its existing glossary slug and `pseudoreplikace` remains explicitly marked as a future glossary addition.
- Source checks: UTF-8 without BOM, no replacement characters, `git diff --check` passed.
- Render: project-native HTML and PDF render passed; all 28 PDF pages were inspected through lesson-wide contact sheets, and both new Extra pages were checked at readable size with no clipping, overlap, broken glyphs or orphaned blocks.
- Pre-existing full-artifact review notes outside this amendment: dataset-object locality and the initial visible missingness check remain candidates for a later cleanup.
