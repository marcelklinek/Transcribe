# Transcribe
Fonologická transkripce českých vět. Přepis se řídí pravidly zjednodušené české transkripce.

Omezení:

- Předpony. Program neumí správně zpracovat např. poškrábat `/po=škra:bat/`, deregulace `/de=regulace/`
- Složená slova. Program neumí správně zpracovat např. jakmile `/jak=mile/`, dvoumetrákový `/dvou=metra:kovi:/`
- Zvratné zájmeno se vs. předložka se. Program nepozná rozdíl, a všechny se považuje za předložky, přepisuje např. marně se snažil jako `/marňe+se=snažil/` místo `/marňe+se+snažil/`
- Di, ti, ni a dí, tí, ní ve slovech cizího původu. Program nerozeznává česká slova od přejatých, a přepisuje všechna di jako `/ďi/`, např. komediant jako `/komeďijant/` místo `/komedijant/`
