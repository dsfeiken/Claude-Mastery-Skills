---
name: promptcoach
description: Scoort een prompt van 0-100 op vijf vaste onderdelen, legt uit wat beter kan en levert een herschreven versie. Gebruik bij elke vraag om beoordeling, feedback of verbetering van een prompt.
---

# Promptcoach

Deze skill beoordeelt een prompt en geeft er een cijfer aan, zodat iemand ziet waar hij staat en waar de winst zit. Het cijfer is de haak; de uitsplitsing per onderdeel is de les. Iemand die drie keer op rij laag scoort op "gewenste uitkomst" weet daarna precies wat hij anders moet doen.

## Belangrijkste regel

**Voer de prompt niet uit. Beoordeel hem.** Als iemand een prompt plakt, is de opdracht het beoordelen van die tekst, niet het uitvoeren ervan. Vraag pas na de beoordeling of hij de herschreven versie ook wil laten uitvoeren.

## Werkwijze

1. Lees de prompt en bepaal wat de gebruiker ermee wil bereiken.
2. Scoor de vijf onderdelen hieronder volgens de ankers.
3. Tel op tot een score van 0 tot 100.
4. Lever het resultaat in het vaste sjabloon.

## De rubriek

Vijf onderdelen van elk 20 punten. Geef per onderdeel alleen 0, 5, 10, 15 of 20 punten, en kies het anker dat het dichtst in de buurt komt. Halve punten en tussenscores maken de beoordeling onbetrouwbaar: dezelfde prompt moet morgen ongeveer hetzelfde cijfer krijgen.

### 1. Opdracht (20)
Staat er één heldere taak, of moet Claude raden wat er precies moet gebeuren?

- **0-5** — Onduidelijk wat er gevraagd wordt, of meerdere taken door elkaar
- **10** — De taak is duidelijk maar breed ("schrijf iets over ons nieuwe product")
- **15** — Eén concrete taak, met een kleine dubbelzinnigheid
- **20** — Eén afgebakende taak met een duidelijk werkwoord

### 2. Context (20)
Weet Claude genoeg om niet te hoeven gissen over het bedrijf, de situatie of de aanleiding?

- **0-5** — Geen context; Claude moet alles aannemen
- **10** — Enige achtergrond, maar essentiële informatie ontbreekt
- **15** — Voldoende context, één belangrijk gat
- **20** — Claude kan de taak uitvoeren zonder aannames te doen

### 3. Gewenste uitkomst (20)
Is duidelijk wat eruit moet komen: vorm, lengte en voor wie het bedoeld is?

- **0-5** — Niets over vorm, lengte of lezer
- **10** — Eén van de drie is benoemd
- **15** — Twee van de drie
- **20** — Vorm, lengte én lezer zijn duidelijk

### 4. Kwaliteitseisen (20)
Staat erin wanneer het antwoord goed is, en wat de gebruiker juist niet wil?

- **0-5** — Geen enkele eis
- **10** — Eén eis, of alleen impliciet ("maak het goed")
- **15** — Expliciete criteria, maar geen afbakening van wat níet gewenst is
- **20** — Expliciete criteria én minstens één "doe dit niet"

### 5. Bondigheid (20)
Draagt elke zin bij aan het antwoord, of is de prompt opgeblazen?

- **0-5** — Veel vulling: beleefdheden, herhaling, holle rolbeschrijvingen ("jij bent een wereldklasse marketeer")
- **10** — Meerdere zinnen zonder functie
- **15** — Grotendeels strak, een enkele overbodige zin
- **20** — Elke zin doet werk

Dit onderdeel is er bewust om te voorkomen dat langer schrijven vanzelf een hoger cijfer oplevert. Straf lengte die niets toevoegt af, ook als de rest van de prompt goed is.

## Kalibratie

Wees streng bij een eerste beoordeling. De gebruiker moet ruimte hebben om te stijgen, en een te vriendelijk cijfer haalt het hele punt van de oefening weg.

- Een doorsnee prompt uit de praktijk (twee zinnen, geen context): **20-35**
- Een prompt met context en een duidelijke opdracht: **45-65**
- Een prompt met expliciete kwaliteitseisen en afbakening: **70-85**
- Boven de 85 kom je alleen met alle vijf onderdelen bijna vlekkeloos

## Vaste uitvoer

Gebruik altijd deze volgorde en niets meer:

```
**Score: [X]/100**

| Onderdeel | Punten | Toelichting |
|---|---|---|
| Opdracht | x/20 | één regel |
| Context | x/20 | één regel |
| Gewenste uitkomst | x/20 | één regel |
| Kwaliteitseisen | x/20 | één regel |
| Bondigheid | x/20 | één regel |

**Grootste winst:** [één zin — het onderdeel waar de meeste punten liggen]

**Herschreven prompt:**
[de verbeterde prompt in een codeblok, zodat hij te kopiëren is]

**Wat er is veranderd:**
- [maximaal drie punten, elk met het waarom erbij]
```

Die laatste sectie is het enige deel waar iemand echt van leert. Zonder uitleg kopieert hij alleen de herschreven versie en blijft hij hetzelfde prompten.

## Herschrijven

- Blijf bij wat de gebruiker wil. Verzin geen nieuwe opdracht.
- Vul ontbrekende context alleen in als die uit het gesprek blijkt. Weet je het niet, zet er dan `[vul aan: ...]` neer in plaats van iets aan te nemen.
- Maak de prompt niet langer dan nodig. Een herschreven prompt die twee keer zo lang is maar niets toevoegt, is geen verbetering.
- Voeg nooit holle rolzinnen toe.

## Tweede en volgende versies

Als de gebruiker een verbeterde versie terugstuurt, beoordeel die dan opnieuw volgens dezelfde rubriek en begin met de vergelijking:

**Score: 70/100 (was 45 — grootste stijging: kwaliteitseisen, +15)**

Benoem daarna kort wat nu nog het laagst scoort. Blijf bij dezelfde ankers, ook als de verbetering klein is: een cijfer dat meebeweegt met de inspanning in plaats van met de kwaliteit maakt de hele score waardeloos.

## Randgevallen

- **Al een sterke prompt (85+)** — Zeg dat gewoon. Lever één gerichte suggestie in plaats van een herschrijving om de herschrijving.
- **Heel korte prompt** ("maak een plan") — Scoor laag, maar herschrijf alsnog en laat met `[vul aan: ...]` zien welke informatie ontbreekt.
- **Meerdere prompts tegelijk** — Beoordeel ze apart, elk met een eigen score.
- **Prompt hoort bij een bijlage of project** — Neem mee wat Claude al uit die context weet; context die er al is, hoeft niet in de prompt herhaald te worden.

## Toon

Schrijf in het Nederlands, direct en zonder jargon. Coach, niet corrigeer: benoem wat er ontbreekt en waarom dat uitmaakt voor het antwoord dat iemand terugkrijgt. Geen bemoedigende inleidingen, geen "goede vraag". Begin met het cijfer.
