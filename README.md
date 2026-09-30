<p align="center">
  <img src="https://github.com/Prayag2/kde_modernclock/blob/main/assets/logo.jpg" width=100/>
  <h2 align="center">Modern Clock for KDE</h2>
  <p align="center">A modern looking clock widget!</center>
</p>

<p align="center">
<a href="https://github.com/prayag2/kde_modernclock/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/prayag2/kde_modernclock?color=%233DAEE9&style=for-the-badge"></a>
<a href="https://github.com/prayag2/kde_modernclock/network"><img alt="GitHub forks" src="https://img.shields.io/github/forks/prayag2/kde_modernclock?color=%233DAEE9&style=for-the-badge"></a>
<a href="https://github.com/prayag2/kde_modernclock/issues"><img alt="GitHub issues" src="https://img.shields.io/github/issues/prayag2/kde_modernclock?color=%233DAEE9&style=for-the-badge"></a>
</p>

<p align="center">
  <img src="https://github.com/Prayag2/kde_modernclock/blob/main/assets/ss.png"/>
</p>

## Deutscher Fork

Dieser Fork von [prayag2/kde_modernclock](https://github.com/prayag2/kde_modernclock) ist für Plasma 6 optimiert:

- Wochentage und Monatsnamen immer auf Deutsch (z. B. „DIENSTAG“, „30. SEPTEMBER 2026“), unabhängig von der Systemsprache
- 24-Stunden-Format standardmäßig aktiv
- Kein veraltetes `plasma5support`-Datenmodul mehr – die Uhrzeit wird per QML-Timer aktualisiert (korrekt auch nach Standby oder Zeitzonenwechsel)
- Einstellungsdialog im aktuellen Plasma-6-Stil (`KCM.SimpleKCM`, `Kirigami.FormLayout`) mit deutschen Texten und „Standardwerte“-Unterstützung
- Schriftart und -stärke für Wochentag, Datum und Uhrzeit frei wählbar (Standard: Anurati bzw. Poppins)
- Eigene Plugin-ID `com.github.knarxy.modernclock`, damit der Fork parallel zum Original installiert werden kann

## Installation

```sh
git clone https://github.com/knarxy/kde_modernclock && cd kde_modernclock/
kpackagetool6 -t Plasma/Applet -i package     # erstmalig
kpackagetool6 -t Plasma/Applet -u package     # Update
```

Danach auf dem Desktop „Widgets hinzufügen…“ → „Moderne Uhr“.
