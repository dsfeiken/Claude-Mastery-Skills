---
name: skill-kansen-zoeker
description: Doorzoekt de chatgeschiedenis van de gebruiker en levert een top 10 van persoonlijke skill-kansen - klussen die de gebruiker steeds opnieuw met Claude doet en die in een skill vastgelegd kunnen worden. Gebruik deze skill ALTIJD wanneer iemand vraagt "welke skills moet ik maken", "wat doe ik steeds opnieuw", "waar kan ik een skill voor bouwen", "zoek skill-kansen in mijn chats", "analyseer mijn chatgeschiedenis", of wil weten welk herhaalwerk hij kan automatiseren of vastleggen - ook als het woord "skill" niet valt maar de vraag over terugkerende taken, herhaalwerk of efficiënter werken met Claude gaat. De skill analyseert alleen en bouwt zelf geen skills.
---

# Skill-kansen zoeker

Deze skill kijkt terug in iemands chatgeschiedenis en zoekt klussen die telkens terugkomen en telkens op ongeveer dezelfde manier worden aangepakt. Dat is precies het werk dat in een skill thuishoort: een vaste werkwijze die je nu elke keer opnieuw uitlegt.

Het doel is tweeledig. De gebruiker krijgt een concrete top 10, én leert zien hoe zo'n kans eruitziet, zodat hij ze later zelf herkent. Schrijf daarom in gewone taal, zonder jargon, en laat bij elke kans zien wáárom het een kans is.

Deze skill bouwt geen skills. Hij levert alleen de analyse. Wie een kans wil uitwerken, kan daarna de startzin uit het rapport gebruiken.

## Stap 1 - Controleer of je bij de chatgeschiedenis kunt

Je hebt tools nodig om eerdere gesprekken op te halen (in claude.ai heten die meestal `recent_chats` en `conversation_search`).

- **Geen toegang?** Stop en leg uit dat de instelling "Search and reference chats" aan moet staan (in Settings > Memory, in de nieuwere indeling Settings > Your Claude). Zoeken in eerdere chats werkt alleen met een betaald abonnement. Verzin geen patronen op basis van alleen dit gesprek.
- **Werkt de gebruiker in een project?** Dan zie je alleen de chats van dat project. Meld dat in één zin aan het begin van het rapport, en noem dat de analyse vollediger wordt als hij de skill in een gewone chat buiten een project draait.

## Stap 2 - Verzamel materiaal

Doe twee dingen, zodat je zowel breed als gericht kijkt:

1. **Breed:** haal recente chats op met `recent_chats` (maximaal 20 per keer). Blader terug met de `before`-parameter, tot ongeveer 5 rondes of tot de chats op zijn. Zo krijg je een beeld van de laatste circa 100 gesprekken.
2. **Gericht:** zoek met `conversation_search` op woorden die bij herhaalwerk horen. Gebruik korte zoektermen, één onderwerp per zoekopdracht. Kies er zo'n 8 tot 12 uit deze lijst, aangevuld met onderwerpen die je in stap 1 al vaak zag terugkomen:
   - soorten output: mail, offerte, voorstel, samenvatting, notulen, rapport, post, blog, vacature, factuur, planning
   - soorten bewerking: herschrijf, vertaal, korter, controleer, vergelijk
   - herhaalsignalen: zoals vorige keer, zelfde als, in onze toon, onze huisstijl, dit format

Lees alleen verder in een gesprek (`read_conversation`) als een fragment te kort is om te begrijpen wat de gebruiker vroeg. Eén pagina per gesprek is genoeg.

## Stap 3 - Herken de patronen

Groepeer gesprekken die in de kern dezelfde klus zijn, ook als de woorden verschillen. "Maak een offerte voor Jansen" en "zet dit om in een voorstel voor de klant" kunnen dezelfde klus zijn.

Let vooral op deze signalen. Hoe meer ervan bij een klus terugkomen, hoe sterker de kans:

| Signaal | Hoe herken je het | Waarom het telt |
|---|---|---|
| Hetzelfde soort verzoek | Minstens 3 gesprekken met dezelfde soort taak | Eén keer is toeval, drie keer is een patroon |
| Steeds dezelfde uitleg | De gebruiker plakt telkens dezelfde context, voorwaarden of achtergrond | Dat is precies wat een skill onthoudt |
| Terugkerende correcties | "Korter", "minder formeel", "nee, zoals vorige keer", "zonder opsommingen" | Deze correcties zijn de regels die in de skill moeten staan |
| Vaste vorm van het eindproduct | De uitkomst heeft elke keer dezelfde opbouw of hetzelfde format | Een vaste vorm is makkelijk vast te leggen |
| Meerdere stappen | De gebruiker loodst Claude elke keer door dezelfde volgorde | Een skill kan die volgorde zelf aanhouden |

Tel alleen wat je echt in de chats ziet. Is iets maar één of twee keer voorgekomen, dan telt het niet mee voor de top 10.

**Wat geen skill-kans is.** Sla deze over, want ze horen ergens anders:
- Kennis over het bedrijf zelf (producten, klanten, prijzen) zonder vaste werkwijze. Dat hoort in een project.
- Losse vragen die elke keer anders zijn, ook al gaan ze over hetzelfde onderwerp.
- Eenmalige grote klussen, hoe lang ze ook duurden.

## Stap 4 - Rangschik

Geef elke kans een score van 1 tot 3 op drie punten en tel ze op (maximaal 9):

- **Hoe vaak:** 1 = 3 keer, 2 = 4 tot 6 keer, 3 = 7 keer of vaker
- **Hoeveel herhaalde uitleg of correcties:** 1 = weinig, 2 = soms, 3 = bijna elke keer
- **Hoe vast de vorm is:** 1 = wisselend, 2 = grotendeels hetzelfde, 3 = steeds hetzelfde

Sorteer van hoog naar laag. Bij gelijke score gaat de klus die vaker voorkomt voor.

**Kom je niet aan 10 kansen, lever er dan minder.** Vul de lijst nooit aan met zwakke of verzonnen kansen. Een eerlijke top 4 is waardevoller dan een opgevulde top 10. Leg in één zin uit waarom het er minder zijn, bijvoorbeeld omdat de geschiedenis kort is.

## Stap 5 - Schrijf het rapport

Gebruik de opbouw uit `references/voorbeeldrapport.md`. Lees dat bestand voordat je schrijft.

Houd je aan deze afspraken:

- **Parafraseer voorbeelden, citeer niet.** Oude chats bevatten vaak klantnamen, bedragen en persoonlijke gegevens. Beschrijf een voorbeeld in algemene termen ("een offerte voor een installatieklant"), zonder namen, bedragen of contactgegevens.
- **Geen verzonnen tijdwinst.** Noem geen minuten of uren. Gebruik alleen de indicatie laag, midden of hoog, en baseer die op hoe vaak de klus voorkomt en hoeveel heen-en-weer er elke keer nodig was.
- **Datums alleen als je ze hebt.** Noem de periode waarin je de klus zag, op basis van de datums van de gesprekken. Weet je het niet, laat het weg.
- **Leg het waarom uit.** Noem bij elke kans welk signaal uit stap 3 de doorslag gaf. Zo leert de gebruiker het patroon zelf herkennen.
- **Sluit af met één zin** waarin je aanbiedt om de nummer 1 samen uit te werken. Begin daar niet zelf aan.
