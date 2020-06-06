# frontend

Das Flutter Frontend der Vegan Klischee Ade app.

## How to run

Wenn ein Android oder iOS Emulator auf dem Rechner läuft, kann mittels 'flutter run' die Applikation gestartet werden.

## Architektur
main.dart ist der Entry Point der App.
In ./views sind die einzelnen übergeordneten Komponenten zu finden.
Jede Komponente kann Unterkomponenten haben. Hierbei ist die generelle Ordnerstruktur: <KomponentenName>/components/<KomponentenName>/...
