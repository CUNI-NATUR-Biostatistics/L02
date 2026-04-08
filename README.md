# L02 – Vztahy dvou proměnných, vizualizace, pravděpodobnost

Týdenní repozitář kurzu **Biostatistika (MB120P163)** pro lekci `L02`.
Repozitář vznikl ze šablony `_L-template` a slouží jako pracovní kostra
pro přípravu materiálů k tématu vztahů dvou proměnných, vizualizace a
pravděpodobnosti.

Repozitář je výchozí kostra pro tři propojené výstupy:

- Quarto RevealJS prezentaci v `Presentation/`
- podkladová skripta v `Learning_materials/`
- pomocné R skripty pro renderování, téma a sdílené funkce v `R/`

---

## Struktura repozitáře

```text
L02/
├── theme/                          # Zdroje vizuálního tématu – editujte zde
│   ├── colors.json                 # Paleta barev a sémantická přiřazení
│   ├── fonts.json                  # Písma pro HTML, RevealJS, Typst a R grafy
│   ├── custom_theme.json           # Další vzhledové parametry
│   ├── _colors.scss                # ← generováno z colors.json
│   ├── fonts-include.html          # ← generováno z fonts.json
│   ├── presentation_theme.scss     # ← generováno z JSON konfigurace
│   └── skripta_theme.scss          # ← generováno z JSON konfigurace
├── Presentation/                   # Zdroj prezentace v Quarto RevealJS
│   ├── presentation.qmd            # Hlavní zdrojový soubor prezentace
│   ├── presentation.html           # HTML výstup prezentace
│   ├── presentation_raw.pdf        # PDF export přes decktape
│   ├── presentation.pdf            # Komprimovaný PDF pro distribuci
│   └── Materials/                  # Obrázky a další podklady ke snímkům
├── Learning_materials/             # Podkladová čtenářská skripta
│   ├── skripta.qmd                 # Hlavní zdrojový soubor skript
│   ├── skripta.html                # HTML výstup
│   ├── skripta_raw.pdf             # PDF výstup přes Typst
│   ├── skripta.pdf                 # Komprimovaný PDF pro distribuci
│   ├── skripta_theme.typ           # ← generováno z JSON konfigurace
│   └── images/                     # Obrázky použité ve skriptech
├── Exercises/
│   └── cviceni.R                   # Starter skript pro praktické cvičení
├── data/                           # Datové soubory specifické pro tento týden
├── R/
│   ├── render_all.R                # Regeneruje téma a renderuje vše
│   ├── render_presentation.R       # Renderuje prezentaci a kopíruje ji do docs/
│   ├── render_skripta.R            # Renderuje skripta a komprimuje PDF
│   ├── generate_theme.R            # Generuje všechny theme artefakty z JSON
│   ├── set_r_theme.R               # ← generováno: ggplot2 paleta a theme_biostat()
│   └── Functions/
│       ├── render_glossary_term.R  # Lokální fallback pro tooltipové pojmy
│       └── Theme_generation/       # Pomocné funkce pro generování tématu
├── docs/
│   └── index.html                  # Prezentace pro GitHub Pages
├── Temp/
│   └── .gitkeep                    # Místo pro dočasné debug skripty (gitignore)
├── renv.lock                       # Zámek závislostí (renv)
├── .Rprofile                       # Aktivuje renv při otevření projektu
└── README.md
```

Poznámka: `presentation.qmd` i `skripta.qmd` načítají aktivní theme soubory
ze složky `theme/` přes cesty `../theme/...`. Generované soubory proto
neupravujte ručně.

---

## Jak začít pracovat s tímto repozitářem

1. Otevřete projekt v RStudiu nebo VS Code a obnovte závislosti příkazem
   `renv::restore()`.
  Lokální pracovní soubory RStudia, Quarto cache a dočasné debug soubory se
  necommitují díky `.gitignore`.
2. Doplňte obsah do `Presentation/presentation.qmd`,
   `Learning_materials/skripta.qmd` a případně `Exercises/cviceni.R`.
  Při návrhu nové lekce postupujte podle workflow v
  `.github/instructions/lesson-authoring.instructions.md`:
  nejdřív výstupy z učení a dataset, potom podrobná skripta, teprve pak
  prezentace.
3. Přidejte datové soubory do `data/` a obrázky pro skripta výhradně do
   `Learning_materials/images/`.
  Krátké reprodukční debug skripty ukládejte do `Temp/` podle
  `.github/instructions/debugging.instructions.md`.
4. Spusťte renderovací pipeline a commitněte aktualizované výstupy.

---

## Systém vizuálního tématu

Barvy, písma a další stylové volby se udržují v jediném místě: v JSON
souborech ve složce `theme/`. Kanonický zdroj je veřejný repozitář
[`_brand`](https://github.com/CUNI-NATUR-Biostatistics/_brand). Script
`R/generate_theme.R` při renderu:

- stáhne aktuální JSON konfiguraci z repozitáře `_brand`,
- při výpadku internetu ponechá lokální cache,
- stáhne pomocné R funkce pro generování tématu,
- znovu vygeneruje všechny theme artefakty pro HTML, RevealJS, Typst a R.

### Zdrojové soubory

| Soubor | Co řídí |
| --- | --- |
| `theme/colors.json` | Barvy a jejich sémantické role |
| `theme/fonts.json` | Písma, velikosti a typografické volby |
| `theme/custom_theme.json` | Okraje, bloky kódu, tabulky, stíny a další detaily |

### Generované soubory

| Soubor | Účel |
| --- | --- |
| `theme/_colors.scss` | Sdílené SCSS proměnné |
| `theme/fonts-include.html` | Načtení webových písem pro HTML výstupy |
| `theme/presentation_theme.scss` | RevealJS téma prezentace |
| `theme/skripta_theme.scss` | HTML téma skript |
| `Learning_materials/skripta_theme.typ` | Typst styl pro PDF |
| `R/set_r_theme.R` | ggplot2 paleta a funkce `theme_biostat()` |

Pokud změníte JSON konfiguraci a nechcete spouštět celý render, lze theme
artefakty regenerovat samostatně:

```r
source("R/generate_theme.R")
```

`render_all.R` tento krok provádí automaticky před renderem prezentace i
skript.

### Písma v PDF

HTML výstupy mohou používat Google Fonts, ale Typst pracuje jen s lokálně
nainstalovanými písmy. Pokud má PDF používat konkrétní písmo, musí být
dostupné v systému a správně nastavené v `theme/fonts.json`.

---

## Slovníček pojmů ve skriptech

`Learning_materials/skripta.qmd` je připravené pro napojení na centrální
slovník v repozitáři [`slovnik`](https://github.com/CUNI-NATUR-Biostatistics/slovnik).

Renderovací setup dělá tři věci:

- stáhne aktuální `pojmy.yaml` z `slovnik` do dočasného lokálního souboru,
- nastaví `glossary::glossary_path()` na tuto lokální kopii,
- pokusí se načíst `render_glossary_term.R` z GitHubu a při neúspěchu
  použije lokální fallback v `R/Functions/render_glossary_term.R`.

V textu skript používejte pro první výskyt pojmu v dané sekci tuto podobu:

```markdown
`r render_glossary_term("median", display = "medián")`
```

Tento wrapper vrací v HTML tooltip s definicí a v typst/PDF pouze čistý
text. Díky tomu stejné `.qmd` funguje pro oba výstupy bez ručních úprav.

HTML tooltip styly a potlačení klikání na odkazy jsou řešeny v samostatném
chunku `nastaveni-slovnik`, aby se CSS a JavaScript vložily jen do HTML
výstupu.

---

## Workflow renderování

Nejjednodušší je spustit celý pipeline najednou:

```r
source("R/render_all.R")
```

Nebo jednotlivé části samostatně:

```r
source("R/render_presentation.R")
source("R/render_skripta.R")
```

`render_all.R` provede:

1. regeneraci všech theme souborů z `theme/*.json`,
2. render prezentace,
3. render skript.

`render_presentation.R` provede:

1. Quarto render `Presentation/presentation.qmd` → `Presentation/presentation.html`,
2. kopii HTML do `docs/index.html` pro GitHub Pages,
3. export PDF přes `decktape` → `Presentation/presentation_raw.pdf`,
4. kompresi PDF → `Presentation/presentation.pdf`.

`render_skripta.R` provede:

1. Quarto render `Learning_materials/skripta.qmd` →
   `Learning_materials/skripta.html` a `Learning_materials/skripta_raw.pdf`,
2. kompresi PDF → `Learning_materials/skripta.pdf`.

### Předpoklady

- Quarto musí být nainstalované a dostupné v systému.
- PDF export prezentace vyžaduje samostatně nainstalovaný
  [decktape](https://github.com/astefanutti/decktape).
- Komprese PDF používá balíček `qpdf` v R.
- Doporučené spuštění je uvnitř projektu s aktivním `renv`.

---

## Distribuce materiálů studentům

Studenti k repozitáři přímo nepřistupují. Distribuují se jen vyrenderované
výstupy, typicky přes Moodle.

Interní release používá tag bez přípony `-moodle`, například:

```text
L01-v0.1.0-20260318
```

Moodle release používá tag s příponou `-moodle`, například:

```text
L01-v0.1.0-20260318-moodle
```

Před vydáním by měly být v repozitáři aktuální alespoň tyto soubory:

- `Presentation/presentation.html`
- `Presentation/presentation.pdf`
- `Learning_materials/skripta.html`
- `Learning_materials/skripta.pdf`

Podrobnosti viz `_internal/obecne/nove/strategie_releases.md`.

---

## Důležité poznámky

### Standardní zázemí R projektu

Šablona už obsahuje základní součásti běžného R projektu:

- `.Rprofile` pro automatickou aktivaci `renv`
- `renv.lock` a `renv/` pro reprodukovatelné závislosti
- `.gitignore` pro lokální R / RStudio / Quarto artefakty
- `Temp/` pro jednorázové debug skripty, které nemají skončit v git historii

### Typst a cesty k obrázkům

Typst při renderování PDF sandboxuje přístup k souborům. Obrázky používané
ve `skripta.qmd` proto musí být uložené uvnitř `Learning_materials/` nebo
jeho podsložek. Cesty typu `../Presentation/Materials/...` mohou při
renderu selhat.

```r
# Správně:
knitr::include_graphics(
  here::here("Learning_materials", "images", "obrazek.png")
)

# Špatně – přeruší Typst render:
knitr::include_graphics(
  here::here("Presentation", "Materials", "obrazek.png")
)
```

### UTF-8 a editace souborů

Při editaci `.qmd` souborů používejte pouze běžné file-edit nástroje
(VS Code, RStudio). PowerShell 5.1 může tiše poškodit diakritiku nebo
přidat UTF-8 BOM, který znemožní parsování YAML.
