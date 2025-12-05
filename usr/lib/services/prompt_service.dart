import 'dart:async';
import '../models/task_prompt.dart';

class PromptService {
  // Simuloidaan tekoälyn viivettä
  Future<TaskPrompt> generatePrompt(String userInput) async {
    await Future.delayed(const Duration(seconds: 2));

    final input = userInput.toLowerCase();

    if (input.contains('sähköposti') || input.contains('email')) {
      return TaskPrompt(
        title: 'Sähköpostin Automaatio',
        description: 'Automaattinen sähköpostien lajittelu ja vastaaminen.',
        aiPrompt: 'Toimi kokeneena virtuaaliavustajana. Analysoi saapuvat sähköpostit ja luokittele ne seuraaviin kategorioihin: "Kiireellinen", "Lasku", "Uutiskirje", "Roskaposti". Luonnostele lyhyet, kohteliaat vastausluonnokset "Kiireellinen"-kategorian viesteihin ja luo yhteenveto muista.',
        steps: [
          '1. Kopioi yllä oleva kehote tekoälytyökaluun (esim. ChatGPT tai Claude).',
          '2. Liitä mukaan esimerkkejä sähköposteistasi (poista arkaluontoiset tiedot).',
          '3. Määritä sähköpostiohjelmasi säännöt tekoälyn antamien ohjeiden mukaan.',
          '4. Testaa automaatiota ensin yhdellä viestillä.'
        ],
        advice: [
          'Älä koskaan anna automaation lähettää viestejä suoraan ilman ihmisen tarkistusta.',
          'Varmista tietoturva: älä syötä salasanoja tai henkilötunnuksia kehotteeseen.',
          'Päivitä sääntöjä säännöllisesti, jos huomaat vääriä luokitteluja.'
        ],
      );
    } else if (input.contains('koodi') || input.contains('ohjelmointi') || input.contains('bungi')) {
      return TaskPrompt(
        title: 'Koodin Refaktorointi ja Optimointi',
        description: 'Komentosarja koodin laadun parantamiseen.',
        aiPrompt: 'Toimi Senior Software Engineerinä. Analysoi seuraava koodinpätkä. Etsi siitä suorituskykyongelmia, tietoturvariskejä ja "code smells". Ehdota parannuksia noudattaen Clean Code -periaatteita ja kirjoita optimoitu versio koodista selityksineen.',
        steps: [
          '1. Valitse koodinpätkä, jonka haluat optimoida.',
          '2. Syötä kehote ja koodi tekoälylle.',
          '3. Käy läpi ehdotetut muutokset rivi riviltä.',
          '4. Aja yksikkötestit varmistaaksesi, ettei toiminnallisuus muuttunut.'
        ],
        advice: [
          'Tekoäly voi joskus hallusinoida kirjastoja, joita ei ole olemassa. Tarkista riippuvuudet.',
          'Ymmärrä aina koodi, jonka kopioit tuotantoon.',
          'Pyydä tekoälyä lisäämään kommentit monimutkaisiin kohtiin.'
        ],
      );
    } else if (input.contains('aikataulu') || input.contains('kalenteri')) {
      return TaskPrompt(
        title: 'Älykäs Aikataulutus',
        description: 'Päivän tai viikon aikataulun optimointi.',
        aiPrompt: 'Toimi tuottavuusvalmentajana. Tässä on lista tehtävistäni tälle viikolle ja arvioitu kesto kullekin: [LISTA]. Järjestä nämä tehtävät tehokkaaseen järjestykseen käyttäen Time Blocking -menetelmää. Ota huomioon, että olen tehokkaimmillani aamupäivisin. Jätä tilaa lounaalle ja tauoille.',
        steps: [
          '1. Listaa kaikki tehtäväsi ranskalaisilla viivoilla.',
          '2. Lisää jokaiseen tehtävään arvioitu kesto.',
          '3. Syötä kehote ja lista tekoälylle.',
          '4. Siirrä ehdotettu aikataulu kalenterisovellukseesi.'
        ],
        advice: [
          'Ole realistinen aikarajoissa. Lisää aina 15-30min puskuriaikaa.',
          'Muista merkitä kalenteriin myös vapaa-aika.',
          'Jos jokin tehtävä venyy, siirrä loppupäivän aikataulua joustavasti.'
        ],
      );
    } else {
      // Oletusvastaus
      return TaskPrompt(
        title: 'Yleinen Tehtävän Hallinta',
        description: 'Yleispätevä kehote monimutkaisten tehtävien pilkkomiseen.',
        aiPrompt: 'Toimi projektipäällikkönä. Minulla on seuraava monimutkainen tavoite: "$userInput". Pilko tämä tavoite pieniin, konkreettisiin ja toteutettavissa oleviin osatehtäviin. Luo jokaiselle osatehtävälle prioriteetti (Korkea/Keski/Matala) ja arvioitu resurssitarve.',
        steps: [
          '1. Määrittele tavoitteesi mahdollisimman tarkasti.',
          '2. Käytä yllä olevaa kehotetta.',
          '3. Vie luotu tehtävälista projektinhallintatyökaluun (esim. Trello, Jira, Notion).',
          '4. Aloita korkean prioriteetin tehtävistä.'
        ],
        advice: [
          'Isojen kokonaisuuksien pilkkominen vähentää aloittamisen vaikeutta.',
          'Tarkista lista: onko jokainen kohta oikeasti "tehtävä" vai "projekti"?',
          'Pyydä tekoälyä tarkentamaan, jos jokin kohta on liian abstrakti.'
        ],
      );
    }
  }
}
