# Dhikr Counter

A simple, offline Android app for daily dhikr, built with Flutter. It has a tasbih counter that saves your count, daily azkar with their sources, and the Names of Allah (Asma ul Husna).

> **Status:** In development. Not yet published on Google Play.

## Features

- **Tasbih counter:** tap the big button to count, and the count is saved even after you close the app.
- **Sets of 33:** shows how many sets of 33 you have completed, with a stronger vibration on every 33rd tap.
- **Vibration switch:** turn the tap vibration on or off, and the choice is remembered.
- **Dua of the day:** one dua shown on the home screen, changing each day.
- **Azkar page:** four duas with the Arabic, the English meaning and the source of each.
- **Asma ul Husna:** a grid of the Names of Allah. Tap a name to see its number (for example "92 of 100"), the Arabic, the spelling and the meaning, and move with Previous and Next.
- **Light and dark mode:** follows your phone's setting.
- **Works offline:** no login, no internet needed.

## Built with

- [Flutter](https://flutter.dev) and Dart
- [shared_preferences](https://pub.dev/packages/shared_preferences) to save the count and settings
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) for the app icon

## Run it locally

1. Install [Flutter](https://docs.flutter.dev/install) and Android Studio.
2. Clone this repository and open the folder.
3. Run `flutter pub get`.
4. Connect an Android phone with USB debugging on, then run `flutter run`.

## Content and accuracy

The duas come from Sahih al-Bukhari 6324, Jami at-Tirmidhi 3458 and Quran 2:201. The list of Names has 100 entries (it includes "Allah"), and the English meanings are plain wording written for this app. Religious content should be checked against trusted sources and by a knowledgeable person. If you find a mistake, please open an issue.

## Roadmap

- Names of the Prophet ﷺ (Asma un Nabi)
- Google Play release

## License

_Choose a license for your project (for example MIT) and add it here._
