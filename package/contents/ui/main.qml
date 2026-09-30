import QtQuick
import QtQuick.Layouts
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore

PlasmoidItem {
    id: root

    // Deutsche Wochentags- und Monatsnamen, unabhängig von der Systemsprache
    readonly property var locale: Qt.locale("de_DE")

    // Aktuelle Uhrzeit, nur bei Minutenwechsel aktualisiert
    property date now: new Date()

    // setting background as transparent with a drop shadow
    Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

    // Jede Sekunde prüfen, aber nur bei neuer Minute neu zeichnen. Das bleibt
    // auch nach Suspend/Resume oder Zeitzonenwechsel sofort korrekt.
    Timer {
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            const current = new Date()
            if (current.getMinutes() !== root.now.getMinutes()
                    || current.getHours() !== root.now.getHours()
                    || current.getDate() !== root.now.getDate()) {
                root.now = current
            }
        }
    }

    // loading fonts
    FontLoader {
        id: font_anurati
        source: "../fonts/Anurati.otf"
    }
    FontLoader {
        id: font_poppins
        source: "../fonts/Poppins.ttf"
    }

    preferredRepresentation: fullRepresentation
    fullRepresentation: Item {

        // applet default size
        Layout.minimumWidth: container.implicitWidth
        Layout.minimumHeight: container.implicitHeight
        Layout.preferredWidth: Layout.minimumWidth
        Layout.preferredHeight: Layout.minimumHeight

        // Main Content
        Column {
            id: container

            anchors.centerIn: parent
            spacing: 5

            // Der Wochentag ("MONTAG", "DIENSTAG" usw.)
            PlasmaComponents.Label {
                id: display_day

                visible: Plasmoid.configuration.show_day
                text: root.locale.toString(root.now, "dddd").toUpperCase()

                font.pixelSize: Plasmoid.configuration.day_font_size
                font.letterSpacing: Plasmoid.configuration.day_letter_spacing
                font.family: Plasmoid.configuration.day_font_family || font_anurati.name
                font.weight: Plasmoid.configuration.day_font_weight
                color: Plasmoid.configuration.day_font_color
                anchors.horizontalCenter: parent.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
            }

            // Das Datum
            PlasmaComponents.Label {
                id: display_date

                visible: Plasmoid.configuration.show_date
                text: root.locale.toString(root.now, Plasmoid.configuration.date_format).toUpperCase()

                font.pixelSize: Plasmoid.configuration.date_font_size
                font.letterSpacing: Plasmoid.configuration.date_letter_spacing
                font.family: Plasmoid.configuration.date_font_family || font_poppins.name
                font.weight: Plasmoid.configuration.date_font_weight
                color: Plasmoid.configuration.date_font_color
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Die Uhrzeit
            PlasmaComponents.Label {
                id: display_time

                readonly property string timeFormat: Plasmoid.configuration.use_24_hour_format ? "HH:mm" : "h:mm AP"
                readonly property string timeCharacter: Plasmoid.configuration.time_character

                visible: Plasmoid.configuration.show_time
                text: [timeCharacter, root.locale.toString(root.now, timeFormat), timeCharacter]
                    .filter(s => s.length > 0).join(" ")

                font.pixelSize: Plasmoid.configuration.time_font_size
                font.family: Plasmoid.configuration.time_font_family || font_poppins.name
                font.weight: Plasmoid.configuration.time_font_weight
                color: Plasmoid.configuration.time_font_color
                font.letterSpacing: Plasmoid.configuration.time_letter_spacing
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
