# L02 — Vztahy dvou proměnných a vizualizace

**Od bodového grafu ke korelaci**

Tento repozitář obsahuje druhou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Souvisí délka ploutve tučňáka s jeho tělesnou hmotností? Druhá lekce přechází od popisu jedné proměnné ke zkoumání vztahu mezi dvěma proměnnými.

Na datech Palmer Penguins se naučíme zvolit graf podle typů sledovaných proměnných, popsat směr a sílu viditelného vztahu a rozpoznat variabilitu, která kolem něj zůstává. Kovariance a korelace nabídnou číselné shrnutí vztahu, ale zároveň ukážeme, proč jeden koeficient nemůže nahradit graf ani biologické uvažování.

Lekce také připravuje důležité rozlišení pro další části kurzu: vzor v datech může být zajímavý, ale sám o sobě ještě není důkazem efektu ani příčinného vztahu.

## Výsledky učení

Po prostudování této lekce dokážete:

- vybrat vhodný graf pro vztah dvou proměnných podle jejich typu;
- popsat směr, tvar a sílu vzoru v datech a odlišit pozorování od závěru, který zatím nelze podpořit;
- vysvětlit, proč jsou biologická data rozptýlená i tehdy, když vykazují zřetelný trend;
- stručně popsat vztah dvou numerických proměnných pomocí kovariance a korelace;
- vysvětlit, proč se Pearsonova a Spearmanova korelace mohou lišit;
- rozpoznat, proč korelace sama o sobě nedokazuje kauzalitu.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L02. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L02/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L02/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L02/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L02/current/presentation/presentation.pdf) |


Pro navazující praktické cvičení je připraven [R skript ke stažení](https://cuni-natur-biostatistics.github.io/L02/current/code/cviceni.R). Skript obsahuje společné úlohy pro praktikum a dobrovolné úlohy navíc.

- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `Exercises/cviceni.R` je studentský R skript pro praktické cvičení.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L02.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L02-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L02/current/`. Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).
