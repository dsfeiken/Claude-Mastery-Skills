# Claude Mastery skills

Gratis Nederlandstalige skills voor Claude, gemaakt door het team van [Claude Mastery](https://claudemastery.nl).

Een skill is een vaste werkinstructie die je één keer aan Claude geeft. Daarna weet Claude bij elke vergelijkbare vraag hoe jij het wilt hebben. Je hoeft het niet steeds opnieuw uit te leggen.

## Wat zit erin

| Skill | Wat het doet | Zeg bijvoorbeeld | Download |
|---|---|---|---|
| **hulpvraag-wegwijzer** | Adviseert welke mogelijkheid van Claude het beste past bij je vraag, en wat je eerst moet regelen. | "Wat is de beste aanpak om elke maandag mijn agenda samen te vatten?" | [hulpvraag-wegwijzer.zip](https://github.com/dsfeiken/Claude-Mastery-Skills/raw/main/downloads/hulpvraag-wegwijzer.zip) |

## Installeren in de Claude-app

Duurt ongeveer 5 minuten. Je hebt geen technische kennis nodig. Werkt op claude.ai en in de desktop-app, ook met een gratis account. Gebruik hiervoor een computer, niet je telefoon.

### 1. Zet twee instellingen aan

- Klik in Claude linksonder op je naam en kies **Settings**. Ga naar **Capabilities** en zet **Create and edit files** aan. Op sommige schermen heet dit "Code execution and file creation". Zonder deze instelling kun je geen skills gebruiken.
- De hulpvraag-wegwijzer zoekt op internet naar de nieuwste informatie over Claude. Klik in een nieuw gesprek op het **+** onder het invoerveld en kijk of **Web search** aan staat.

### 2. Download de skill

Klik op de link [hulpvraag-wegwijzer.zip](https://github.com/dsfeiken/Claude-Mastery-Skills/raw/main/downloads/hulpvraag-wegwijzer.zip). Het bestand komt in je map Downloads.

> **Werk je op een Mac met Safari?** Dan pakt Safari het bestand soms vanzelf uit, en zie je een map in plaats van een ZIP-bestand. Klik dan met de rechtermuisknop op de map en kies **Comprimeer**. Zo heb je weer een ZIP-bestand.

### 3. Upload de skill

Ga naar [claude.ai/customize/skills](https://claude.ai/customize/skills), klik op **+**, dan op **Create skill** en daarna op **Upload a skill**. Kies het ZIP-bestand uit je map Downloads.

### 4. Zet de skill aan

De skill staat nu in je lijst. Zet het schuifje erachter aan.

### 5. Test of het werkt

Open een nieuw gesprek en typ:

> Wat is de beste manier om elke maandag een overzicht van mijn afspraken te krijgen?

Je krijgt een advies met de kopjes **Aanbevolen aanpak**, **Alternatief** en **Eerst regelen**. Zie je die kopjes, dan werkt de skill.

### Lukt het niet?

- **Je ziet geen Skills-menu.** Dan staat de instelling uit stap 1 nog uit.
- **Het uploaden mislukt.** Dan heb je waarschijnlijk een map geüpload in plaats van een ZIP-bestand. Zie de tip bij stap 2.
- **Je werkt via je werkgever (Team of Enterprise) en ziet geen uploadknop.** Dan heeft de beheerder eigen skills uitgezet. Vraag hem of haar om dit aan te zetten.

## Een nieuwe versie

Als we een skill verbeteren, vervangen we het ZIP-bestand. De downloadlink blijft hetzelfde. Verwijder in Claude de oude versie en upload de nieuwe, zoals in stap 3.

## Gebruik en licentie

Je mag deze skills gratis gebruiken, aanpassen en delen, ook zakelijk. Vermeld dan wel Claude Mastery als bron. Zie [LICENSE](LICENSE).

De skills zijn met zorg gemaakt en getest. Claude kan zich anders gedragen dan je verwacht. Controleer de uitkomst daarom voordat je erop vertrouwt.

## Meer halen uit Claude

Deze skills komen uit de trainingen van Claude Mastery. Daar leer je in twee dagen hoe je Claude gebruikt zoals het bedoeld is, inclusief het maken van je eigen skills. Kijk op [claudemastery.nl](https://claudemastery.nl).

## Voor ontwikkelaars: installeren in Claude Code

Werk je met Claude Code? Dan installeer je alle skills in één keer:

```
/plugin marketplace add dsfeiken/Claude-Mastery-Skills
/plugin install ondernemers-toolkit@mastery-skills
```

Nieuwe versies haal je op met `/plugin marketplace update`.
