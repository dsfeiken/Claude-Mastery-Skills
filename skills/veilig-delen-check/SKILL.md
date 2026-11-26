---
name: veilig-delen-check
description: Helpt vooraf inschatten of het verstandig is bepaalde gegevens met Claude te delen, afhankelijk van het soort gegevens en het Claude-abonnement, en laat zien hoe het veiliger kan. Gericht op bewustwording, niet op juridisch advies. Gebruik deze skill wanneer iemand vraagt "mag ik dit delen met Claude", "is dit veilig", "kan ik klantgegevens of personeelsgegevens in Claude zetten", "hoe zit het met de AVG of privacy", "wat doet Anthropic met mijn data", of op het punt staat een bestand te uploaden of een systeem te koppelen en twijfelt, ook als het woord "veilig" niet valt.
---

# Veilig delen check

Deze skill helpt iemand nadenken voordat hij gegevens met Claude deelt. Het doel is bewustwording: de gebruiker moet na afloop begrijpen waarom iets wel of niet verstandig is, zodat hij het de volgende keer zelf kan inschatten. Een oordeel zonder uitleg leert niemand iets.

De skill geeft een risico-inschatting, **geen juridisch advies**. Zeg dat één keer, kort, onderaan het advies. Niet als waarschuwing bovenaan, want dan leest niemand verder.

## Het belangrijkste principe: beschrijven, niet plakken

Alles wat in het gesprek staat, is al met Claude gedeeld. Deze check werkt alleen als hij plaatsvindt vóórdat de gegevens erin staan.

- **Heeft de gebruiker de gegevens nog niet gedeeld:** laat hem beschrijven wat het is ("een Excel met namen, e-mailadressen en ziekteverzuim van 40 medewerkers"), niet plakken. Dat doe je met vraag 3 in stap 1. Zeg erbij waarom: zo blijft de check echt vooraf.
- **Heeft de gebruiker de gegevens al geplakt of geüpload:** zeg dat eerlijk en zonder verwijt. Herhaal de gevoelige gegevens nergens in je antwoord. Geef het oordeel voor de volgende keer, en zeg wat hij nu nog kan doen (zie stap 4, bijvoorbeeld het gesprek verwijderen, als de bronnen bevestigen dat dat helpt).

## Werkwijze

### Stap 1: Stel je vragen één voor één

Mensen noemen hun abonnement bijna nooit in hun vraag, terwijl het oordeel er sterk van afhangt. Begin daarom met vragen, voordat je iets anders zegt of opzoekt. Houd je daarbij aan deze regels:

- **Eén vraag per bericht.** Wacht op het antwoord voordat je de volgende vraag stelt.
- **Maak kiezen makkelijk.** Heb je een tool om keuzes als knoppen te tonen (zoals `AskUserQuestion` of een vergelijkbare keuzetool), gebruik die dan. Heb je die niet, nummer de keuzes dan, zodat de gebruiker alleen een cijfer hoeft te typen.
- **Altijd een uitweg.** Geef bij elke vraag de keuze "Weet ik niet", en laat ruimte voor een eigen antwoord.
- **Sla over wat je al weet.** Staat het antwoord al in de vraag van de gebruiker, stel de vraag dan niet.
- **Hooguit drie vragen.** Meestal zijn het er twee.

**Vraag 1: het abonnement** (altijd, tenzij al genoemd)

> Welk Claude-abonnement gebruik je hiervoor?
> 1. Op mijn eigen naam (Free, Pro, Max of Ultra)
> 2. Via mijn werk (Team of Enterprise)
> 3. Weet ik niet

Bij "weet ik niet": leg in één zin uit hoe hij het vindt (de naam van het abonnement staat in de instellingen; loopt het via je werk, dan weet de beheerder het). Ga daarna door en geef straks het oordeel voor beide situaties.

**Vraag 2: Help improve Claude** (alleen bij keuze 1)

> Staat "Help improve Claude" aan of uit? Je vindt het onder Settings > Privacy.
> 1. Aan
> 2. Uit
> 3. Weet ik niet

Bij "weet ik niet": ga uit van "aan", zeg dat erbij en leg uit waar hij het kan controleren.

**Vraag 3: de gegevens** (alleen als de gebruiker ze nog niet heeft beschreven)

> Wat voor gegevens wil je delen? Kies wat van toepassing is. Plak de gegevens zelf nog niet.
> 1. Eigen tekst of openbare informatie
> 2. Namen of contactgegevens van klanten
> 3. Gegevens over medewerkers
> 4. Prijzen, contracten of andere vertrouwelijke bedrijfsinformatie
> 5. Gezondheid, burgerservicenummer (BSN) of wachtwoorden
> 6. Iets anders

Laat hier meerdere keuzes toe als je tool dat kan. Zonder tool mag de gebruiker meerdere cijfers typen.

**Wat je niet apart vraagt**

- **Het doel en hoe er gedeeld wordt** (plakken, uploaden of een koppeling): haal dit uit de vraag van de gebruiker. Vraag er alleen naar als het oordeel ervan afhangt, bijvoorbeeld bij een koppeling met mail of een CRM.
- **Het eigen AI-beleid van het bedrijf:** vraag dit niet. Noem het altijd onder "Let op" in het advies: een eigen beleid gaat voor op deze skill.

Free, Pro, Max en Ultra zijn abonnementen voor consumenten. Team en Enterprise zijn zakelijke abonnementen, beheerd door een organisatie. Dat onderscheid bepaalt welke regels je in stap 3 opzoekt.

Is de vraag algemeen ("is Claude veilig voor mijn bedrijf?"), leg dan in een paar zinnen de drie kleuren uit stap 2 uit, met een voorbeeld per kleur, en vraag om een concrete situatie. Een algemeen ja of nee bestaat hier niet.

Claude kan het abonnement en de instellingen van de gebruiker niet zelf zien. Vraag het dus altijd.

### Stap 2: Bepaal het soort gegevens

Gebruik `references/datatypen.md` om de gegevens in te delen. Kort samengevat:

- **Groen:** openbare informatie, eigen teksten en ideeën, algemene bedrijfsinformatie die niet geheim is.
- **Oranje:** gewone persoonsgegevens (namen, contactgegevens, klantgegevens), vertrouwelijke bedrijfsinformatie (prijzen, marges, contracten, strategie), en gegevens van anderen waarvoor je afspraken hebt gemaakt, zoals onder een geheimhoudingsverklaring.
- **Rood:** bijzondere persoonsgegevens volgens de AVG (zoals gezondheid en ziekteverzuim, religie, etnische afkomst, seksuele geaardheid, politieke voorkeur, vakbondslidmaatschap, biometrische en genetische gegevens), strafrechtelijke gegevens, het burgerservicenummer (BSN), en wachtwoorden, toegangscodes en API-sleutels.

Het zwaarste soort gegevens in de set bepaalt de kleur.

### Stap 3: Zoek de actuele regels op

Wat Anthropic met gegevens doet, verschilt per abonnement en verandert in de loop van de tijd. Wat je uit je training weet, is daarom per definitie verouderd. Haal de regels live op uit de officiële bronnen van Anthropic:

| Waarvoor | Startpunt |
|---|---|
| Consumenten (Free, Pro, Max, Ultra): training en de instelling Help improve Claude | `https://privacy.claude.com/en/articles/12109829` |
| Consumenten: hoe lang gegevens bewaard worden, ook bij verwijderde en incognito chats | `https://privacy.claude.com/en/articles/10023548` |
| Zakelijk (Team, Enterprise): training en feedback | `https://privacy.claude.com/en/articles/7996868` |
| Zakelijk: wie verantwoordelijk is voor de gegevens (verwerker en verwerkingsverantwoordelijke) | `https://privacy.claude.com/en/articles/9267385` |
| Zakelijke voorwaarden en de verwerkersovereenkomst (DPA) | `https://www.anthropic.com/legal/commercial-terms` en `https://www.anthropic.com/legal/data-processing-addendum` |

Haal alleen op wat je voor deze situatie nodig hebt, meestal twee of drie pagina's. Verwijst een pagina door naar een andere pagina van Anthropic, volg die dan. Zegt een bron iets niet, schrijf dan "de bron zegt hier niets over". Verzin geen regels, termijnen of instellingen.

Let bij het opzoeken vooral op:
- of gesprekken gebruikt worden om modellen te trainen, en hoe je dat uitzet;
- hoe lang gesprekken bewaard worden, en wat er gebeurt als je een gesprek verwijdert;
- wat er gebeurt met gesprekken waarop je feedback geeft (duim omhoog of omlaag);
- of er een verwerkersovereenkomst geldt. Voor persoonsgegevens van klanten of medewerkers is dat onder de AVG belangrijk.

### Stap 4: Geef het oordeel en de veiligere aanpak

Combineer de kleur van de gegevens met wat de bronnen zeggen over het abonnement.

- **Groen:** zeg dat het prima is en waarom. Houd het kort. Ook een groen oordeel is een les.
- **Oranje:** het kan, maar met aandacht. Geef de veiligere aanpak.
- **Rood:** raad af om deze gegevens zo te delen. Geef altijd een alternatief waarmee de gebruiker zijn doel toch kan bereiken. Een nee zonder alternatief leidt ertoe dat mensen het toch doen, maar zonder erover na te denken.

Geef bij oranje en rood altijd twee dingen:

1. **Een veiligere route naar hetzelfde doel.** Kies uit `references/datatypen.md` (onderdeel "Veiliger delen") en maak hem concreet voor deze situatie. Zeg ook hoe de brondata eruit komt te zien: welke kolommen eruit gaan, wat je vervangt door bijvoorbeeld "Klant A", of welk totaal je in plaats van de losse rijen deelt. Controleer dat de gebruiker met deze route zijn doel nog steeds haalt. Haalt hij het niet, zeg dat dan eerlijk en noem wat hij moet opgeven of anders moet regelen.
2. **Een herschreven prompt, klaar om te kopiëren.** Schrijf de prompt die de gebruiker met de veiligere route kan sturen, in een codeblok. Gebruik plekhouders tussen haakjes, zoals [Klant A] of [plak hier de tabel met totalen per afdeling], waar de gebruiker zelf iets moet invullen. Zet nooit echte gevoelige gegevens in de prompt.

Bij groen is een herschreven prompt niet nodig.

Gaat het om een koppeling met een systeem, benoem dan ook:
- dat Claude via een koppeling meer kan lezen dan wat de gebruiker bewust deelt;
- dat je de koppeling zo beperkt mogelijk houdt, bijvoorbeeld alleen-lezen of één map;
- dat tekst in mails, documenten of webpagina's verborgen instructies kan bevatten die Claude probeert op te volgen.

### Stap 5: Schrijf het advies

Gebruik dit sjabloon:

```
**Oordeel:** 🟢 / 🟠 / 🔴 [één zin: kan dit zo, ja of nee]

**Waarom:**
- [twee of drie punten in gewone taal: welk soort gegevens, wat het abonnement betekent, wat het risico in de praktijk is]

**Veiligere route:** (alleen bij oranje en rood)
[hoe de gebruiker zijn doel toch haalt, en hoe de brondata er dan uitziet]

**Zo vraag je het:** (alleen bij oranje en rood)
[de herschreven prompt in een codeblok, met plekhouders tussen haakjes]

**Wat je hiervan meeneemt:**
[één vuistregel die de gebruiker de volgende keer zelf kan toepassen]

**Let op:** Dit is een inschatting, geen juridisch advies. Heeft je organisatie een eigen AI-beleid, dan gaat dat voor. [Eventueel: wat de bronnen niet zeggen.]

**Nagekeken op:** [datum van vandaag]
Bronnen:
- [Titel](URL)
```

## Regels

- **Vraag nooit om de gegevens zelf.** Een beschrijving is genoeg.
- **Herhaal gevoelige gegevens nooit** in je antwoord, ook niet als de gebruiker ze al heeft gedeeld.
- **Verzin geen regels.** Noem een termijn, instelling of voorwaarde alleen als je hem in een opgehaalde bron hebt gezien.
- **Geen angst zaaien.** De meeste dagelijkse vragen zijn groen. Zeg dat ook. Het doel is dat mensen Claude met vertrouwen gebruiken, niet dat ze bang worden.
- **Geen juridisch advies.** Zeg nooit dat iets "mag" of "wettelijk toegestaan" is. Zeg wat het risico is en wat verstandig is.
- **Gewone taal.** Leg een vakterm uit in één zin als je hem gebruikt, bijvoorbeeld: "een verwerkersovereenkomst is een contract waarin staat wat Anthropic met de persoonsgegevens van jouw klanten mag doen".
- **Antwoord in de taal van de gebruiker. Conclusie eerst.**
