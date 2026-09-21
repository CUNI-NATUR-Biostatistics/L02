#----------------------------------------------------------#
#
#       L02 — Vztahy dvou proměnných a vizualizace
#                 Praktické cvičení v R
#             Studenti biologie a ekologie
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Příprava -----
#----------------------------------------------------------#

# Skript stáhněte z veřejné stránky lekce L02 na HUBu kurzu:
# https://cuni-natur-biostatistics.github.io/L02/current/code/cviceni.R
# Uložte jej mezi své studijní soubory. V RStudiu zvolte File > Open File,
# vyberte stažený cviceni.R a otevřete jej v panelu se skriptem.
# Odpovědi a vlastní příkazy zapisujte přímo do své kopie souboru;
# průběžně ji ukládejte pomocí Ctrl + S. Není potřeba vytvářet projekt
# ani měnit pracovní složku.
#
# Při společném praktiku dokončete Hlavní úlohy L02-U01 až L02-U08.
# Úlohy navíc jsou dobrovolné a můžete se k nim vrátit při samostudiu.
# Skript spouštějte shora dolů. Jeden příkaz spusťte kurzorem na jeho
# řádku pomocí Ctrl + Enter. U příkazu na více řádcích označte všechny
# jeho řádky a stiskněte Ctrl + Enter. Výsledek najdete v Console,
# graf v Plots. Komentáře začínající znakem # R nespouští.
# Pod „Vaše řešení“ pište vlastní příkazy a slovní odpovědi.
# Nápovědy čtěte postupně; druhá nabízí konkrétnější krok.


#--------------------------------------------------#
## Výsledky učení a návaznost na L01 -----
#--------------------------------------------------#

# Po společné trase dokážete vybrat graf pro dvojici proměnných,
# popsat směr a variabilitu vztahu, vypočítat a opatrně číst
# kovarianci a korelaci a odlišit zjištěný vztah od tvrzení o příčině.
#
# V L01 jste rozlišovali typy proměnných a zobrazovali jednu proměnnou.
# Jeden řádek zde představuje jednoho měřeného tučňáka; délka ploutve
# a hmotnost na stejném řádku tedy patří témuž jedinci. Počítáme
# a zobrazujeme odpovídající dvojice, nikoli dvě nezávislé řady čísel.
#
# Pokud už bezpečně používáte Ctrl + Enter, objekty, $, plot(),
# boxplot() a table(), můžete toto krátké připomenutí přeskočit:
# uložený skript obsahuje příkazy, Console ukazuje jejich výsledky
# a Environment objekty v aktuální relaci R. Po restartu relace
# objekty zmizí, ale uložený skript zůstane na disku.


#--------------------------------------------------#
## Technická kontrola -----
#--------------------------------------------------#

# Data jsou v balíčku {palmerpenguins}. Kontrola nic neinstaluje.
if (
  !requireNamespace(
    package = "palmerpenguins",
    quietly = TRUE
  )) {
  stop(
    "Chybí balíček {palmerpenguins}. Nainstalujte jej podle pokynů kurzu a spusťte skript znovu.",
    call. = FALSE
  )
}

# Pokud balíček ve vašem R chybí, můžete jednou spustit v Console:
# install.packages(pkgs = "palmerpenguins")


#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Dvě měření jednoho tučňáka -----
#--------------------------------------------------#

# Dataset Palmer Penguins obsahuje měření dospělých tučňáků tří druhů
# z oblasti Palmerova souostroví. Jde o pozorované jedince z této studie,
# nikoli o náhodný vzorek všech tučňáků na světě.
data_tucnaci_raw <- palmerpenguins::penguins

# Původní tabulka má anglické názvy sloupců. Pro další práci
# vytvoříme české názvy objektů; původní sloupce nepřejmenováváme.
head(x = data_tucnaci_raw)
nrow(x = data_tucnaci_raw)

# Zápis [, c(...)] vybere dva sloupce a ponechá pořadí řádků.
# V novém objektu zůstávají délka ploutve a hmotnost vedle sebe.
data_mereni_par <-
  data_tucnaci_raw[, c("flipper_length_mm", "body_mass_g")]

head(x = data_mereni_par)

# is.na() znáte z L01; TRUE označuje chybějící hodnotu.
# complete.cases() naopak označí TRUE u řádků, kde nic nechybí
# v právě sledovaných sloupcích.


#----------------------------------------#
### Úloha | L02-U01 -----
#----------------------------------------#

# Zadání: V data_tucnaci_raw spočítejte zvlášť chybějící hodnoty
# ve sloupcích flipper_length_mm a body_mass_g. Pomocí data_mereni_par
# zjistěte počet řádků, kde jsou obě měření známá. Leží zde chybějící
# hodnoty v obou sloupcích na stejných řádcích? Proč může oddělené
# mazání hodnot v jiné tabulce poškodit dvojice?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Tabulka má 344 řádků, v každém sloupci
# chybějí 2 hodnoty a úplných dvojic je 342. Chybějí tedy stejné
# dva řádky; oddělené mazání by zde dvojice náhodou zachovalo,
# ale při různých chybějících řádcích by je mohlo nesprávně spojit.
# Nápověda 1: Porovnejte počet chybějících hodnot v každém sloupci
# s počtem řádků, kde chybí alespoň jedno z obou měření.
# Nápověda 2: Pro sloupec použijte sum(is.na(...)); úplné dvojice
# získáte sečtením hodnot TRUE z complete.cases(data_mereni_par).


# complete.cases() vrátí pro každý řádek TRUE, pokud ve vybraných
# sloupcích nechybí žádná hodnota. Zápis [ma_dvojici, ] vybere
# celé řádky, takže délka ploutve a hmotnost zůstanou spárované.
ma_dvojici <- complete.cases(x = data_mereni_par)

data_tucnaci <- data_tucnaci_raw[ma_dvojici, ]

vec_delka_ploutve <- data_tucnaci$flipper_length_mm
vec_hmotnost <- data_tucnaci$body_mass_g
vec_druh <- data_tucnaci$species
vec_ostrov <- data_tucnaci$island

# Ověříme, že oba vektory pro bodový graf jsou stejně dlouhé.
length(x = vec_delka_ploutve)
length(x = vec_hmotnost)


#--------------------------------------------------#
## Co ukazuje oblak bodů -----
#--------------------------------------------------#

# Dvě číselné proměnné zobrazíme bodovým grafem. Jeden bod nese
# dvě měření jednoho tučňáka. plot() znáte z L01; popisky os
# zde doplní jednotky obou měření.


#----------------------------------------#
### Úloha | L02-U02 -----
#----------------------------------------#

# Zadání: Z vec_delka_ploutve a vec_hmotnost vytvořte bodový graf
# pomocí plot(). Délku ploutve v mm dejte na vodorovnou osu,
# hmotnost v g na svislou; obě osy česky popište včetně jednotek.
# Před spuštěním odhadněte směr vztahu. Potom popište jeho směr,
# přibližný tvar a rozptýlení bodů při podobné délce ploutve.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Rostoucí, přibližně přímkový, ale ne dokonale
# těsný oblak 342 bodů. Při podobné délce ploutve se hmotnosti liší.
# Nápověda 1: Každý bod potřebuje dvě hodnoty ze stejného řádku;
# pro graf máte připravené odpovídající vektory x a y.
# Nápověda 2: V plot() nastavte x, y, xlab a ylab. Pro dobře
# viditelné body můžete nastavit pch = 16.


#--------------------------------------------------#
## Stejný vztah u tří druhů -----
#--------------------------------------------------#

# Jména vektoru barev odpovídají názvům druhů v datech.
barvy_druhu <-
  c(
    "Adelie" = "darkorange3",
    "Chinstrap" = "mediumpurple4",
    "Gentoo" = "cyan4"
  )

# as.character() převede faktor druhu na text, podle kterého
# pojmenovaný vektor vybere barvu pro každého jedince.
head(x = barvy_druhu[as.character(x = vec_druh)])


#----------------------------------------#
### Úloha | L02-U03 -----
#----------------------------------------#

# Zadání: Nakreslete znovu délku ploutve proti hmotnosti pro všech
# 342 jedinců z data_tucnaci. Přiřaďte bodům barvu podle vec_druh
# a barvy_druhu a přidejte legendu Adelie, Chinstrap a Gentoo.
# Porovnejte rozptýlení uvnitř druhů s rozdíly mezi druhy.
# Změnila barva měření, nebo jen to, co v grafu rozpoznáte?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Tři rozlišitelné skupiny; Gentoo leží
# převážně u delších ploutví a vyšších hmotností. Body se
# rozptylují i uvnitř každého druhu. Barva nepřidala nové měření.
# Nápověda 1: Použijte stejné x a y jako v U02; druh rozhoduje
# jen o vzhledu bodu.
# Nápověda 2: V plot() doplňte col = barvy_druhu[as.character(vec_druh)].
# Legendu vytvoří legend() s legend = names(barvy_druhu),
# col = barvy_druhu a pch = 16.


#--------------------------------------------------#
## Kovariance a korelace -----
#--------------------------------------------------#

# Čtyři dvojice z výkladu dávají malý příklad společného pohybu
# proměnných. I tady zachováváme párování v každém řádku.
data_ctyri_tucnaci <-
  data.frame(
    delka_ploutve_mm = c(186, 191, 197, 204),
    hmotnost_g = c(3800, 3920, 4300, 4480)
  )

data_ctyri_tucnaci
mean(x = data_ctyri_tucnaci$delka_ploutve_mm)
mean(x = data_ctyri_tucnaci$hmotnost_g)

# Odchylka od průměru může být záporná nebo kladná. Součin dvou
# odchylek je kladný, když jsou obě na stejné straně svých průměrů.


#----------------------------------------#
### Úloha | L02-U04 -----
#----------------------------------------#

# Zadání: U prvního a čtvrtého řádku data_ctyri_tucnaci určete,
# zda je každá hodnota pod svým průměrem nebo nad ním. Předpovězte
# znaménko součinu obou odchylek pro tyto řádky. Pak pomocí cov()
# spočítejte kovarianci všech čtyř dvojic. Co říká její znaménko?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: V prvním řádku jsou obě hodnoty pod průměrem,
# ve čtvrtém nad průměrem; oba součiny jsou kladné. Kovariance
# je 2430 mm·g a shrnuje společný rostoucí směr v tomto příkladu.
# Nápověda 1: Dvě odchylky se stejným znaménkem mají kladný součin.
# Nápověda 2: Funkci cov() předejte pomocí x a y dva sloupce
# data_ctyri_tucnaci ve stejném pořadí řádků.


# Kovariance závisí na jednotkách. Korelace převede společný pohyb
# na číslo od -1 do 1. Pearson shrnuje hlavně přímkový vztah
# původních hodnot; Spearman pracuje s jejich pořadím.
# Ani jedna hodnota nenahrazuje kontrolu grafu.


#----------------------------------------#
### Úloha | L02-U05 -----
#----------------------------------------#

# Zadání: Pro vec_delka_ploutve a vec_hmotnost spočítejte zvlášť
# Pearsonovu a Spearmanovu korelaci funkcí cor(). Před výpočtem
# odhadněte jejich znaménko podle grafu U02. Porovnejte výsledky
# a jednou větou vyložte, co vypovídají o měřených tučňácích.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Pearson přibližně 0,871 a Spearman přibližně
# 0,840; obě korelace jsou kladné a podobné, ale ne dokonalé.
# Nevypovídají samy o sobě o příčině vztahu.
# Nápověda 1: Znaménko souvisí se směrem bodového mraku;
# metody pracují s původními hodnotami a s jejich pořadím.
# Nápověda 2: Ve dvou voláních cor() použijte stejná x a y;
# měňte jen method = "pearson" a method = "spearman".


#--------------------------------------------------#
## Typy proměnných mění volbu grafu -----
#--------------------------------------------------#

# Druh je kategoriální a hmotnost číselná proměnná. Zápis
# hmotnost ~ druh v boxplot() znamená „hmotnost po skupinách druhu“.


#----------------------------------------#
### Úloha | L02-U06 -----
#----------------------------------------#

# Zadání: Pro stejné jedince z data_tucnaci zobrazte pomocí
# boxplot() hmotnost v g podle vec_druh. Použijte vec_hmotnost
# a česky označte obě osy. Porovnejte typickou hmotnost a rozptyl
# v jednotlivých druzích. Proč by zde bodový graf se dvěma
# číselnými osami nebyl první volbou?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Tři krabice, jedna pro každý druh;
# Gentoo mají ve vzorku vyšší typickou hmotnost. Skupiny nejsou
# bez variability a graf sám nedokazuje rozdíly v celé populaci.
# Nápověda 1: Jedna proměnná určuje skupiny, druhá v nich má
# číselné hodnoty; porovnejte jejich rozdělení po skupinách.
# Nápověda 2: V boxplot() použijte vzorec vec_hmotnost ~ vec_druh
# a nastavte xlab a ylab.


# Druh i ostrov jsou kategoriální proměnné. table() spočítá
# jejich kombinace. Sloupce tabulky patří ostrovům.
tabulka_druh_ostrov <-
  table(
    Druh = vec_druh,
    Ostrov = vec_ostrov
  )

tabulka_druh_ostrov

# prop.table(..., margin = 2) převede každý sloupec (ostrov)
# zvlášť na podíly. Každý takový sloupec sečtený přes druhy dá 1.
podily_druh_ostrov <-
  prop.table(
    x = tabulka_druh_ostrov,
    margin = 2
  )


#----------------------------------------#
### Úloha | L02-U07 -----
#----------------------------------------#

# Zadání: Z podily_druh_ostrov vytvořte pomocí barplot() skládané
# sloupce pro ostrovy. Použijte barvy_druhu, přidejte legendu druhů
# a označte svislou osu „Podíl“. Porovnejte sloupce s počty v
# tabulka_druh_ostrov: na kterém ostrově ve vzorku najdete všechny
# tři druhy? Co vyjadřuje celková výška každého sloupce?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Každý ostrovní sloupec má celkovou výšku 1.
# Ve vzorku není ostrov se všemi třemi druhy; na Biscoe chybí
# Chinstrap, na Dream Gentoo a na Torgersen jsou jen Adelie.
# Tabulka počtů a graf podílů odpovídají na odlišné otázky.
# Nápověda 1: Sloupce ostrovů již mají podíly připravené;
# barplot() zobrazí druhy uvnitř každého ostrova.
# Nápověda 2: V barplot() nastavte height = podily_druh_ostrov,
# col = barvy_druhu, legend.text = TRUE a args.legend = list(
# x = "top", horiz = TRUE, bty = "n"). Pro legendu nad sloupci
# zvětšete horní mez grafu pomocí ylim = c(0, 1.17).


#--------------------------------------------------#
## Souvisí délka zobáku s hmotností? -----
#--------------------------------------------------#

# Délka zobáku je v původním sloupci bill_length_mm. Počet úplných
# dvojic ověřte pro tuto otázku znovu; nepřebírejte jej bez kontroly.


#----------------------------------------#
### Úloha | L02-U08 -----
#----------------------------------------#

# Zadání: V data_tucnaci_raw vyberte jen řádky se známou
# bill_length_mm a body_mass_g. Zjistěte počet úplných dvojic,
# z těchto stejných řádků vytvořte dva české vektory a nakreslete
# bodový graf délky zobáku (mm) proti hmotnosti (g). Spočítejte
# Pearsonovu korelaci. Napište dvě věty: co vidíte v grafu a co
# z tohoto pozorovaného vztahu zatím nemůžete tvrdit?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 342 úplných dvojic, kladný, ale rozptýlený
# vztah; Pearson přibližně 0,595. Korelace sama neprokazuje,
# že změna délky zobáku způsobuje změnu hmotnosti.
# Nápověda 1: Zopakujte cestu od kontroly dvojice k grafu
# a číselnému souhrnu; obě proměnné filtrujte společně.
# Nápověda 2: V complete.cases() vyberte bill_length_mm a
# body_mass_g; podle výsledných řádků vytvořte oba vektory,
# které pak předáte plot() a cor().


#----------------------------------------------------------#
# Shrnutí a sebekontrola -----
#----------------------------------------------------------#

# Společnou trasu jste dokončili, pokud umíte vlastními slovy říct:
# 1. Proč délka ploutve a hmotnost jednoho tučňáka musí zůstat párem?
# 2. Co ukázal bodový graf, co z něj nevyčtete jedinou korelací?
# 3. Co přidalo rozlišení druhů v původním bodovém grafu?
# 4. Proč pro dvě čísla, druh × hmotnost a druh × ostrov volíme
#    různé první grafy?
# 5. Co znamená kladná korelace a proč to ještě není důkaz příčiny?
# Pokud si nejste jistí, vraťte se k příslušné úloze a nápovědám.


#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Tyto úlohy jsou dobrovolné. Společná trasa skončila u sebekontroly.


#--------------------------------------------------#
## Stejná korelace, jiné obrázky -----
#--------------------------------------------------#

# R obsahuje čtyři malé datové dvojice známé jako Anscombův kvartet.
# První dvojici zobrazíme samostatně; další grafy si můžete prohlížet
# postupně pomocí šipek v Plots.
data_anscombe <- anscombe

plot(
  x = data_anscombe$x1,
  y = data_anscombe$y1,
  xlab = "Hodnota x (soubor 1)",
  ylab = "Hodnota y (soubor 1)",
  pch = 16
)


#----------------------------------------#
### Úloha navíc | L02-N01 -----
#----------------------------------------#

# Zadání: Z data_anscombe zobrazte zvlášť dvojice x2/y2,
# x3/y3 a x4/y4 pomocí plot(). Pro každou ze čtyř dvojic
# spočítejte Pearsonovu korelaci. Porovnejte tvar všech čtyř
# grafů a vysvětlete, proč podobná čísla nestačí k popisu vztahu.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Všechny čtyři korelace jsou přibližně 0,816,
# ale obrázky ukazují přibližně přímkový vztah, zakřivení a případy
# s výrazně odlehlými body. Graf ukazuje, co jedno číslo skrývá.
# Nápověda 1: Každá dvojice má stejné číslo v názvu obou sloupců;
# grafy sledujte po jednom, ne jako dvě nezávislé řady.
# Nápověda 2: Opakujte zobrazený plot() a v názvech sloupců měňte
# číslo; stejné dvojice předejte cor() s method = "pearson".


#--------------------------------------------------#
## Jiná dvojice měření -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L02-N02 -----
#----------------------------------------#

# Zadání: V data_tucnaci_raw použijte bill_depth_mm (hloubka zobáku
# v mm) a body_mass_g (hmotnost v g). Zkontrolujte počet úplných
# dvojic, zachovejte jejich společné řádky, nakreslete bodový graf
# a spočítejte Pearsonovu korelaci. Jak se směr liší od U08?
#
# Vaše řešení:
#
#
# Očekávaný výsledek: 342 úplných dvojic; celkový vztah je
# záporný a Pearsonova korelace přibližně -0,472. Jde o popis
# těchto měřených jedinců, který je vhodné číst i po druzích.
# Nápověda 1: Stejně jako v U08 začněte kontrolou obou proměnných
# ve stejných řádcích, pak porovnejte graf a korelaci.
# Nápověda 2: Pro complete.cases() vyberte bill_depth_mm a
# body_mass_g; z vybraných řádků vezměte oba sloupce pro plot()
# a cor(method = "pearson").


#--------------------------------------------------#
## Co korelace nevysvětluje -----
#--------------------------------------------------#


#----------------------------------------#
### Úloha navíc | L02-N03 -----
#----------------------------------------#

# Zadání: Vraťte se ke vztahu délky ploutve a hmotnosti v U02–U05.
# Napište jednu větu, kterou data podporují, a jednu příliš silnou
# příčinnou větu, kterou samotná korelace nepodporuje. Uveďte dva
# možné zdroje společného vzoru, například druh a celkovou velikost
# těla. Žádný z nich neoznačujte za prokázanou příčinu.
#
# Vaše odpověď:
#
#
# Očekávaný výsledek: Bezpečný závěr popisuje souvislost v měřených
# datech; silnější tvrzení o přímém účinku délky ploutve z grafu
# a korelace neplyne. Možná vysvětlení jsou hypotézy k prověření.
# Nápověda 1: Rozlišujte společný výskyt dvou hodnot od zásahu,
# který by jednu hodnotu změnil a ukázal účinek na druhou.
# Nápověda 2: Porovnejte graf U02 s rozlišením druhů v U03;
# formulujte „souvisí“ místo „způsobuje“.


#--------------------------------------------------#
## Tři grafy znovu pomocí ggplot2 -----
#--------------------------------------------------#

# Balíček {ggplot2} nabízí modernější způsob tvorby grafů v R.
# Graf skládáme z datové tabulky, přiřazení proměnných k osám či barvám
# a vrstvy, která určí, zda uvidíme body, krabice nebo sloupce.
# Další vrstvy mohou měnit popisky a vzhled bez změny původních dat.
# V L02 jsme volili první graf podle typů proměnných; stejné otázky
# si zde vyzkoušíte vyjádřit tímto vrstvovým zápisem.
#
# Kurzová skripta L02, část „Jak typ proměnných určuje výběr grafu“:
# https://cuni-natur-biostatistics.github.io/L02/current/learning/
# Stručný úvod do syntaxe a vrstev (anglicky) v dokumentaci ggplot2:
# https://ggplot2.tidyverse.org/articles/ggplot2.html
#
# Následující tři úlohy jsou dobrovolné. Ověříme dostupnost balíčku,
# aniž bychom jej instalovali nebo připojovali.
je_ggplot2 <-
  requireNamespace(
    package = "ggplot2",
    quietly = TRUE
  )

if (
  !je_ggplot2
) {
  message(
    "Úlohy L02-N04 až N06 vyžadují balíček {ggplot2}; hlavní úlohy jsou hotové."
  )
}

# Pokud chcete tyto dobrovolné úlohy řešit a balíček chybí,
# můžete jednou spustit v Console:
# install.packages(pkgs = "ggplot2")
# Po instalaci znovu spusťte kontrolu je_ggplot2 výše.
# Dvojtečka :: v ggplot2::ggplot() volá funkci z balíčku bez library().
# ggplot2::ggplot() určí datovou tabulku; ggplot2::aes() přiřadí
# sloupce k osám nebo barvám. Znak + spojuje části jednoho grafu,
# nesčítá naměřené hodnoty. Funkce se jménem geom_* vytvářejí vrstvy
# grafu; ggplot2::labs() doplní názvy os.
#
# Příklad navazuje na sloupcové grafy četností z L01. Zde jeden
# řádek představuje jednoho tučňáka, takže ggplot2::geom_bar()
# spočítá jedince každého druhu do sloupců.
# Příkaz print() zobrazí hotový graf i při spuštění celého skriptu.
if (
  je_ggplot2
) {
  graf_pocty_druhu <-
    ggplot2::ggplot(
      data = data_tucnaci,
      mapping = ggplot2::aes(x = species)
    ) +
    ggplot2::geom_bar() +
    ggplot2::labs(
      x = "Druh tučňáka",
      y = "Počet jedinců"
    )

  print(x = graf_pocty_druhu)
}

# Ve třech následujících úlohách použijte stejných 342 jedinců
# z data_tucnaci, stejné dvojice proměnných a jednotky jako
# v hlavních úlohách. Výše uvedený příklad slouží jen k seznámení
# se zápisem; žádný z trojice grafů za vás nevytváří.


#----------------------------------------#
### Úloha navíc | L02-N04 -----
#----------------------------------------#

# Zadání: Z data_tucnaci vytvořte pomocí ggplot2 bodový graf
# flipper_length_mm proti body_mass_g. Vycházejte z U02, ponechte
# stejné osy a jejich české popisky s mm a g. Porovnejte, co se
# oproti plot() zapisuje jako data, přiřazení os a vrstva bodů.
# Úlohu řešte pouze tehdy, když je_ggplot2 má hodnotu TRUE.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Stejný rostoucí oblak 342 bodů a stejné
# jednotky jako v U02; mění se způsob sestavení grafu, ne data.
# Nápověda 1: V ggplot2 oddělíte zdrojovou tabulku a osy od vrstvy,
# která vykreslí jednotlivé body.
# Nápověda 2: Použijte ggplot2::ggplot() s data = data_tucnaci,
# ggplot2::aes() pro obě osy, ggplot2::geom_point() a ggplot2::labs().


#----------------------------------------#
### Úloha navíc | L02-N05 -----
#----------------------------------------#

# Zadání: Z týchž jedinců v data_tucnaci znovu zobrazte hmotnost
# body_mass_g podle species pomocí ggplot2. Zachovejte otázku
# a české popisky s jednotkou g z U06. Porovnejte s boxplot(),
# kde se v kódu určuje skupina a způsob vykreslení krabic.
# Úlohu řešte pouze tehdy, když je_ggplot2 má hodnotu TRUE.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Tři krabice nad stejnými 342 jedinci
# a stejná interpretace skupin jako v U06.
# Nápověda 1: Druh určuje skupinu na vodorovné ose, hmotnost
# číselnou hodnotu na svislé ose.
# Nápověda 2: V ggplot2::aes() přiřaďte x = species a
# y = body_mass_g; přidejte ggplot2::geom_boxplot() a ggplot2::labs().


#----------------------------------------#
### Úloha navíc | L02-N06 -----
#----------------------------------------#

# Zadání: Z data_tucnaci znovu zobrazte složení druhů podle
# ostrovů jako skládané podílové sloupce pomocí ggplot2. Ponechte
# stejné 342 jedince, barvy z barvy_druhu a svislou osu pro podíl.
# Porovnejte s barplot(), jak se nastavuje ostrov, barva druhu
# a převod sloupců na podíly. Úlohu řešte pouze tehdy,
# když je_ggplot2 má hodnotu TRUE.
#
# Vaše řešení:
#
#
# Očekávaný výsledek: Každý ostrovní sloupec má výšku 1
# a složení odpovídá U07. Žádný další jedinec nepřibyl.
# Nápověda 1: Ostrov určuje sloupec a druh jeho barevné části;
# graf musí ukázat podíly uvnitř každého ostrova.
# Nápověda 2: V ggplot2::aes() použijte x = island a
# fill = species, poté ggplot2::geom_bar(position =
# ggplot2::position_fill(reverse = TRUE)), aby pořadí barevných částí
# odpovídalo U07. Barvy nastavte pomocí ggplot2::scale_fill_manual(
# values = barvy_druhu) a popisky pomocí ggplot2::labs().
