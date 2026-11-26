---
name: connector-kansen-zoeker
description: "Doorzoekt de chatgeschiedenis, project-geschiedenis en het geheugen van de gebruiker en levert een top 10 van persoonlijke connector-kansen - terugkerende klussen waarbij Claude nu handmatig moet schakelen met een extern systeem, en die met een MCP-connector rechtstreeks gekoppeld zouden kunnen worden. Gebruik deze skill ALTIJD wanneer iemand vraagt \"welke connectoren moet ik maken\", \"waar kan ik een MCP-connector voor bouwen\", \"zoek connector-kansen in mijn chats\", \"welke systemen zou ik moeten koppelen\", \"analyseer mijn geschiedenis op koppelingen\", of wil weten welke systemen hij steeds handmatig aan Claude voert of eruit haalt - ook als het woord \"connector\" of \"MCP\" niet valt maar de vraag gaat over terugkerend kopieer-plakwerk tussen Claude en een ander systeem. De skill analyseert alleen en bouwt zelf geen connector."
---

# Connector-kansen zoeker

Deze skill kijkt terug in iemands chatgeschiedenis, project-geschiedenis en geheugen, en zoekt momenten waarop Claude eigenlijk met een ander systeem had moeten praten, maar dat niet kon - waardoor de gebruiker zelf de brug moest zijn. Steeds hetzelfde exportbestand plakken, steeds vragen "check dit even in [systeem]", steeds Claudes antwoord met de hand overtypen in een ander scherm. Dat is precies het werk dat een MCP-connector overneemt.

Het doel is tweeledig. De gebruiker krijgt een concrete top 10, én leert zien hoe zo'n kans eruitziet, zodat hij ze later zelf herkent - ook los van deze skill. Schrijf daarom in gewone taal, zonder jargon, en laat bij elke kans zien wáárom het een kans is.

Deze skill bouwt geen connectoren. Hij levert alleen de analyse. Wie een kans wil uitwerken, kan daarna de startzin uit het rapport gebruiken.

## Stap 1 - Controleer waar je bij kunt

Deze skill draait op verschillende plekken (claude.ai, een project, Cowork), en niet elke plek heeft dezelfde tools. Ga na wat er beschikbaar is, en gebruik alles wat je hebt:

- **Chatgeschiedenis** (`recent_chats`, `conversation_search`) - meestal beschikbaar in claude.ai chat.
- **Project-geschiedenis** (een Projects-tool met `project_search`/`project_info`, of vergelijkbaar) - beschikbaar als er een project aan het gesprek gekoppeld is.
- **Geheugen** (`memory_list`/`memory_read` of vergelijkbaar) - vaak de beste bron in Cowork: het geheugen bevat blijvende feiten die over meerdere sessies en omgevingen heen zijn opgebouwd, dus ook uit Cowork-taken die je anders niet meer kunt terugzien.

**Niets van dit alles beschikbaar?** Stop en leg uit wat er ontbreekt: in claude.ai chat moet de instelling "Search and reference chats" aan staan (in Settings > Memory, in de nieuwere indeling Settings > Your Claude), en zoeken in eerdere chats werkt alleen met een betaald abonnement; in Cowork/een project heb je in elk geval het geheugen nodig. Verzin geen patronen op basis van alleen dit gesprek.

**Heb je er maar één?** Ga gewoon door, maar meld in één zin aan het begin van het rapport welke bronnen je kon gebruiken en welke niet - zodat duidelijk is dat de analyse vollediger wordt zodra er meer bronnen bij komen.

## Stap 2 - Verzamel materiaal

Doe voor elke beschikbare bron het volgende:

1. **Chatgeschiedenis, breed:** haal recente chats op met `recent_chats` (maximaal 20 per keer). Blader terug met de `before`-parameter, tot ongeveer 5 rondes of tot de chats op zijn.
2. **Chatgeschiedenis, gericht:** zoek met `conversation_search` op woorden die op een koppelingsbehoefte wijzen. Kies er 8 tot 12 uit deze lijst, aangevuld met systeemnamen die je al vaak zag terugkomen:
   - overdrachtssignalen: export, CSV, Excel-bestand, plak, kopieer, upload, download
   - actiesignalen: zet dit in, haal dit op uit, check even in, log dit in, werk bij in
   - veelvoorkomende systeemtypes: CRM, ERP, boekhoudpakket, voorraadsysteem, planning, ticketsysteem, mailprogramma, projecttool
3. **Project-geschiedenis:** doorzoek de projectdocumenten en kennisbank op terugkerende vermeldingen van een extern systeem of tool, vooral waar staat dat iets "handmatig", "nog niet gekoppeld" of "elke keer opnieuw" gebeurt.
4. **Geheugen:** loop de bestandenlijst door en lees bestanden waarvan de beschrijving een tool, systeem of terugkerende taak noemt. Dit vangt patronen op die zich over meerdere sessies hebben herhaald, ook als de losse gesprekken zelf niet meer te doorzoeken zijn.

Lees alleen een heel gesprek of document als een fragment te kort is om te begrijpen wat er precies gebeurde. Eén pagina is meestal genoeg.

## Stap 3 - Herken de patronen

Groepeer momenten die in de kern dezelfde koppelingsbehoefte zijn, ook als de woorden verschillen. "Zet dit klantcontact in ons CRM" en "kun je dit in [systeemnaam] loggen" kunnen dezelfde kans zijn.

Let vooral op deze signalen. Hoe meer ervan bij een klus terugkomen, hoe sterker de kans:

| Signaal | Hoe herken je het | Waarom het telt |
|---|---|---|
| Handmatige overdracht | De gebruiker plakt een export, tabel of screenshot uit hetzelfde systeem in het gesprek | Dat is precies de stap die een connector overbodig maakt |
| Terug de andere kant op | De gebruiker typt Claudes antwoord met de hand over in een ander scherm | Een connector kan daar direct schrijven |
| "Check dit even in ..." | De gebruiker vraagt Claude iets na te kijken of op te zoeken in een systeem waar Claude niet bij kan | Zonder koppeling moet de gebruiker zelf de boodschapper zijn |
| Vaste, benoembare bron | Het gaat steeds om hetzelfde, met naam te noemen systeem (niet "iets opzoeken" in het algemeen) | Een connector koppelt aan één specifiek systeem met een API |
| Twee systemen overbruggen | De gebruiker haalt iets uit systeem A om het in systeem B te zetten, en doet dat steeds zo | Dat is de brugfunctie die een connector automatiseert |

Tel alleen wat je echt terugziet. Is iets maar één of twee keer voorgekomen, dan telt het niet mee voor de top 10.

**Wat geen connector-kans is.** Sla deze over, want ze horen ergens anders:
- Puur tekstuele klussen zonder extern systeem (herschrijven, samenvatten, in een vaste toon zetten) - dat zijn skill-kansen. Verwijs er in het rapport kort naar als je ze tegenkomt.
- Kennis over een systeem die maar één keer nodig was, zonder dat het patroon terugkeert.
- Systemen die in de chats al via een actieve MCP-connector gebruikt worden - die kans is al verzilverd, dus geen kans meer.
- Vage, wisselende behoeften ("iets opzoeken op internet") zonder één aanwijsbaar systeem.

## Stap 4 - Rangschik en check wat er al bestaat

Geef elke kans een score van 1 tot 3 op drie punten en tel ze op (maximaal 9):

- **Hoe vaak:** 1 = 3 keer, 2 = 4 tot 6 keer, 3 = 7 keer of vaker
- **Hoe omslachtig het nu gaat:** 1 = kost weinig moeite, 2 = merkbaar vervelend, 3 = duidelijk tijdrovend of foutgevoelig (bijvoorbeeld door handmatig overtypen)
- **Hoe herkenbaar het systeem is:** 1 = wisselend of vaag, 2 = meestal hetzelfde systeem maar onduidelijk of het een API heeft, 3 = één specifiek, met naam te noemen systeem

Sorteer van hoog naar laag. Bij gelijke score gaat de klus die vaker voorkomt voor.

Check voor de kansen die de top 10 halen of er al een kant-en-klare connector bestaat, via de connector-registry (zoek deze op met de daarvoor bedoelde tool, laad hem eerst als dat nodig is). Meld per kans het resultaat:
- **Bestaat al:** er is een connector gevonden die dit systeem dekt - de kans is dan vooral "aanzetten", niet bouwen.
- **Niet gevonden:** er is geen kant-en-klare connector - dat betekent niet automatisch dat zelf bouwen mogelijk of makkelijk is, alleen dat je verder onderzoek nodig hebt.

Verzin nooit of een koppeling technisch haalbaar is. Zeg wat de registry-check opleverde, niet meer.

**Kom je niet aan 10 kansen, lever er dan minder.** Vul de lijst nooit aan met zwakke of verzonnen kansen. Een eerlijke top 4 is waardevoller dan een opgevulde top 10. Leg in één zin uit waarom het er minder zijn, bijvoorbeeld omdat de geschiedenis kort is of omdat er weinig bronnen beschikbaar waren.

## Stap 5 - Schrijf het rapport

Volg de opbouw hieronder. De inhoud in het voorbeeld is **verzonnen** en dient alleen om de vorm te laten zien - neem er niets van over.

```
# Jouw top 10 connector-kansen

Bekeken: chatgeschiedenis (94 gesprekken, maart-september 2026), project "Klantenservice", geheugen.
(Alleen als het speelt:) Ik kon [bron] niet raadplegen, dus de analyse wordt vollediger zodra die erbij komt.

## In één oogopslag

| # | Kans (systeem) | Gezien | Score | Tijdwinst | Status |
|---|---|---|---|---|---|
| 1 | Voorraadstand overtypen vanuit het boekhoudpakket | 11x | 9/9 | hoog | geen kant-en-klare connector gevonden |
| 2 | Nieuwe leads uit het contactformulier in het CRM zetten | 7x | 8/9 | midden | connector bestaat al |
| 3 | Facturen controleren tegen het projectsysteem | 5x | 6/9 | midden | geen kant-en-klare connector gevonden |
| ... | ... | ... | ... | ... | ... |

## De kansen uitgelegd

### 1. Voorraadstand overtypen vanuit het boekhoudpakket

Wat je steeds opnieuw doet: je plakt een exportje uit het boekhoudpakket in het gesprek en laat Claude er een overzicht van maken.

Voorbeelden uit je geschiedenis:
- Een export uit het boekhoudpakket, geplakt om een voorraadoverzicht te maken (mei)
- Dezelfde export nogmaals geplakt, nu voor een andere periode (juli)

Waarom dit een connector-kans is: het gaat steeds om hetzelfde, met naam te noemen systeem, en je doet zelf de overdracht met een export. Dat is precies wat een connector rechtstreeks zou kunnen ophalen.

Registry-check: geen kant-en-klare connector voor dit systeem gevonden. Dat wil niet zeggen dat er geen te bouwen is - alleen dat er nog niets bestaat om zo aan te zetten.

Startzin als je dit wilt uitwerken:
> Zoek uit wat er nodig is om Claude rechtstreeks te koppelen aan [systeem]. Stel me eerst vragen.

---

### 2. ...

(zelfde opbouw voor elke kans)

---

## Zo herken je een kans voortaan zelf

Merk je dat je voor de derde keer hetzelfde exportje plakt, of dezelfde vraag "check dit even in ..." stelt? Dan is dat een koppeling die er nog niet is.

(Als er minder dan 10 kansen zijn:) Ik vond er 6 die sterk genoeg waren. Met meer geschiedenis of meer bronnen komen er waarschijnlijk meer boven.

Wil je de nummer 1 samen uitwerken?
```

Houd je bij het schrijven aan deze afspraken:

- **Parafraseer voorbeelden, citeer niet.** Oude chats en documenten bevatten vaak klantnamen, bedragen en persoonlijke gegevens. Beschrijf een voorbeeld in algemene termen ("een export uit het boekhoudpakket"), zonder namen, bedragen of contactgegevens.
- **Geen verzonnen tijdwinst of techniek.** Noem geen minuten, uren of technische details die je niet hebt gecontroleerd. Gebruik voor tijdwinst alleen laag, midden of hoog, gebaseerd op hoe vaak de klus voorkomt en hoe omslachtig het nu gaat.
- **Datums alleen als je ze hebt.** Noem de periode waarin je het patroon zag, op basis van de data die je terugvond. Weet je het niet, laat het weg.
- **Leg het waarom uit.** Noem bij elke kans welk signaal uit stap 3 de doorslag gaf, en het resultaat van de registry-check. Zo leert de gebruiker het patroon zelf herkennen.
- **Sluit af met één zin** waarin je aanbiedt om de nummer 1 samen uit te werken. Begin daar niet zelf aan.