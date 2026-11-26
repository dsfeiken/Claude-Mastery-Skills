---
name: "hulpvraag-wegwijzer"
description: "Adviseert bij elke hulpvraag welke mogelijkheid van Claude de beste aanpak is en welk model daarbij past, met één alternatief en wat je eerst moet regelen. Zoekt live in de officiële Anthropic-documentatie, zodat nieuwe functies en modellen meetellen."
---

# Hulpvraag-wegwijzer

Claude krijgt elke maand nieuwe mogelijkheden. Daardoor weten veel mensen niet welke weg ze moeten kiezen om iets met Claude voor elkaar te krijgen. Deze skill geeft bij een hulpvraag één aanbevolen aanpak, één alternatief en wat er eerst moet gebeuren.

De skill **adviseert alleen**. Voer de taak zelf niet uit. Bied na het advies aan om ermee te beginnen.

Wat je uit je training weet over Claude-functies is per definitie verouderd. Behandel het als vermoeden en controleer het in de bronnen.

## Werkwijze

### Stap 1 — Begrijp de hulpvraag

Haal uit de vraag:
- **Wat moet het resultaat zijn:** het doel, niet de techniek.
- **Hoe vaak:** eenmalig, terugkerend of continu.
- **Waar staat de informatie:** in een app (mail, agenda, CRM, Google Drive), in een bestand, op de eigen computer, op internet, of in het hoofd van de gebruiker.
- **Wie gebruikt het resultaat:** de gebruiker zelf eenmalig, de gebruiker herhaaldelijk, of anderen (team, klanten).
- **Moet er iets gebeuren buiten Claude:** iets versturen, publiceren of bijwerken in een systeem.

Ontbreekt iets wat de aanpak echt verandert, stel dan één vraag met keuzes erbij ("Gaat het om één keer of elke maand?"). Kun je redelijk gokken, ga dan door en zeg welke aanname je doet.

Schat ook in hoeveel uitleg de gebruiker nodig heeft. Uit de vraag blijkt meestal of iemand Claude net kent of er al veel mee werkt. Bij twijfel: leg elke functie die je noemt in één gewone zin uit.

### Stap 2 — Kijk wat de gebruiker al heeft

De documentatie vertelt wat er bestaat. Alleen de sessie vertelt wat deze gebruiker heeft. Vraag op wat er al is, voor zover de tools daarvoor aanwezig zijn:
- **Skills en plugins:** ListSkills, ListPlugins (laden via ToolSearch).
- **Gekoppelde connectors:** ListConnectors. Voor apps die nog niet gekoppeld zijn: SearchMcpRegistry.
- **Artifact-typen:** Artifact met `action: list`, `scope: types`.

Zijn deze tools er niet, sla de stap dan over en zeg in het advies dat je niet hebt kunnen zien wat de gebruiker al heeft ingesteld.

Iets wat al bestaat en het doel dekt, gaat vóór iets nieuws bouwen. Spreken de docs en de sessie elkaar tegen, dan wint de sessie.

### Stap 3 — Zoek live in de officiële bronnen

Gebruik alleen bronnen van Anthropic:

| Bron | Waarvoor | Startpunt |
|---|---|---|
| support.claude.com | Functies in de Claude-apps (web, desktop, mobiel), abonnementen, release notes | `https://support.claude.com/en/articles/12138966-release-notes` |
| claude.com/docs | Productdocumentatie van apps en integraties (o.a. Claude in Excel, Word, PowerPoint, Outlook) | `https://claude.com/docs/llms.txt` |
| code.claude.com | Claude Code, plugins, hooks, subagents | `https://code.claude.com/docs/llms.txt` |
| platform.claude.com | Claude API, Agent Skills, MCP, release notes van het platform | `https://platform.claude.com/llms.txt` |
| docs.claude.com | Oudere en doorverwijzende pagina's | Alleen als een zoekresultaat ernaar verwijst |
| anthropic.com | Aankondigingen (`/news`) en best practices (`/engineering`) | Gericht zoeken |
| github.com/anthropics/claude-code | Officiële changelog van Claude Code | `CHANGELOG.md` |
| platform.claude.com (modellen) | Huidige modellen, waarvoor elk model bedoeld is, welke binnenkort stoppen | `https://platform.claude.com/docs/en/about-claude/models/overview.md` en `https://platform.claude.com/docs/en/about-claude/models/choosing-a-model.md` |

Zoek in deze volgorde:
1. **Release notes van de apps.** Scan de laatste drie maanden op functies die met de hulpvraag te maken hebben.
2. **De helpartikelen of docs-pagina's** van de twee à drie kandidaat-aanpakken. Gebruik de `llms.txt`-indexen om de juiste pagina te vinden. Veel pagina's zijn ook als `.md` op te halen.
3. **Alleen bij een vraag over werkwijze of kwaliteit:** de best practices op anthropic.com/engineering.

Verwijst een pagina door naar een ander domein van Anthropic dat niet in de tabel staat, gebruik het dan wel en meld het onder "Let op".

Stop met zoeken zodra elke aanpak in je advies op een opgehaalde bron rust. Mik op drie tot zes ophaalacties. Meer dan acht betekent dat de vraag te breed is: vraag de gebruiker dan om het doel af te bakenen.

### Stap 4 — Kies de aanpak

Gebruik dit denkkader. Het kader veroudert nauwelijks. De functienamen zijn voorbeelden die je in stap 3 moet bevestigen, geen vaste lijst.

- **Eenmalig, resultaat lees je één keer:** gewoon in het gesprek.
- **Een bestand bekijken of bewerken:** het bestand uploaden in het gesprek, of een integratie in het programma zelf (bv. Claude in Excel).
- **Resultaat bewaar je, deel je of bewerk je later:** een artifact, of een bestand als een bepaald formaat nodig is.
- **Moet op een vast moment terugkomen:** een scheduled task.
- **Dezelfde werkwijze komt steeds terug:** een skill.
- **Meerdere skills en koppelingen horen bij elkaar, of een team moet ze ook gebruiken:** een plugin.
- **Informatie staat in een app:** een connector. Bestaat die niet, dan een browser.
- **Bestanden of programma's op de eigen computer:** de desktop-app.
- **Achtergrond en documenten moeten in veel gesprekken terugkomen:** een project, eventueel met memory.
- **Software bouwen of met code werken:** Claude Code.

Weeg bij twijfel af op:
- wat de gebruiker al heeft;
- hoeveel insteltijd het kost;
- hoe goed het daarna zonder hem draait;
- hoe makkelijk het terug te draaien is.

### Stap 4b — Kies het model

Haal de huidige modellen op uit de modellenpagina (zie de tabel in stap 3). Schrijf nooit modelnamen uit je geheugen op: er komen elke paar maanden nieuwe modellen bij en oude verdwijnen.

Kies het model op basis van de taak, met de omschrijvingen die Anthropic zelf op die pagina geeft:
- **Eenvoudig, veel herhaling of snelheid belangrijk** (sorteren, samenvatten, gegevens uit tekst halen): het kleinste, snelste model.
- **Gewoon werk** (schrijven, analyseren, een bestand doorlopen): het model dat Anthropic aanraadt als je twijfelt.
- **Zwaar denkwerk of lange, zelfstandige taken** (complexe analyse, iets wat Claude lang zelf moet uitzoeken): het zwaarste model dat de gebruiker kan kiezen.

Houd er rekening mee dat:
- niet elk abonnement alle modellen heeft. Controleer dit op support.claude.com en zeg het als het onbekend is;
- sommige plekken een beperkte keuze hebben (bv. de Office-integraties tonen een selectie van modellen);
- de gebruiker het model niet overal zelf kiest. Zegt de bron niet of je bij de aanbevolen aanpak een model kunt kiezen, meld dat dan;
- een zwaarder model niet altijd beter is: het is trager. Of het je gebruikslimiet sneller verbruikt, zeg je alleen als een bron dat bevestigt.

Raad een zwaarder model alleen aan als de taak dat echt nodig heeft.

### Stap 5 — Geef het advies

Gebruik dit sjabloon:

```
**Aanbevolen aanpak:** [functie(s), in één regel]
[Twee à drie zinnen waarom dit het beste past. Leg de functie in gewone woorden uit als de gebruiker die mogelijk niet kent.]

**Alternatief:** [functie(s)]
- Voordeel: ...
- Nadeel: ...
- Kies dit als: [de situatie waarin het alternatief beter is]

**Aanbevolen model:** [modelnaam] — [één zin waarom dit model past bij deze taak. Noem een lichter of zwaarder model alleen als dat duidelijk verschil maakt. Kan de gebruiker hier geen model kiezen, zeg dat dan.]

**Eerst regelen:**
1. [Wat instellen, koppelen of bouwen, concreet en in volgorde.]

**Wat je al hebt:** [relevante skills, connectors of artifact-typen uit stap 2, of "niets relevants gevonden", of "niet kunnen controleren"]

**Let op:** [beta, research preview, Labs, alleen voor bepaalde abonnementen, risico's, of "de bronnen zeggen hier niets over". Laat weg als er niets is.]

**Nagekeken op:** [datum van vandaag]
Bronnen:
- [Titel](URL)
```

Sluit af met één zin waarin je aanbiedt om met de aanbevolen aanpak te beginnen.

## Regels die het advies betrouwbaar houden

- **Verzin geen functies, namen of mogelijkheden.** Zegt de bron iets niet, schrijf dan "de documentatie zegt hier niets over". Een gok die als feit leest, is precies wat deze skill moet voorkomen.
- **Noem een functie alleen als je hem in een opgehaalde bron of in de sessie hebt gezien.**
- **Abonnement telt mee.** Werkt een functie alleen op bepaalde abonnementen, zeg dat. Weet je het abonnement van de gebruiker niet, noem dan voor welke abonnementen het werkt.
- **Status telt mee.** Beta, research preview of Labs staat altijd onder "Let op".
- **Eén aanbeveling, één alternatief.** Een lijst van vijf opties schuift de keuze terug naar de gebruiker.
- **Gewone taal.** Geen jargon zonder uitleg.
- **Antwoord in de taal van de gebruiker. Conclusie eerst.**

## Voorbeeld

Hulpvraag: "Ik wil elke maandag een overzicht van mijn afspraken van die week."

In het kort:
- **Stap 1:** terugkerend, informatie staat in de agenda, resultaat is voor de gebruiker zelf.
- **Stap 2:** is er een agenda-connector gekoppeld?
- **Stap 3:** helpartikelen over scheduled tasks en connectors, plus de release notes.
- **Stap 4:** kandidaten zijn een scheduled task met een agenda-connector, of als alternatief elke maandag zelf de vraag stellen in een project.