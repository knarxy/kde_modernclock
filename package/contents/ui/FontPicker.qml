import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami

// Auswahl von Schriftfamilie und -stärke. Eine leere Familie steht für die
// mitgelieferte Standardschrift (defaultName).
RowLayout {
    id: root

    property string family
    property int weight: Font.Normal
    property string defaultName

    onFamilyChanged: familyBox.currentIndex = Math.max(0, familyBox.indexOfValue(family))
    onWeightChanged: weightBox.currentIndex = Math.max(0, weightBox.indexOfValue(weight))

    QQC2.ComboBox {
        id: familyBox
        Layout.minimumWidth: Kirigami.Units.gridUnit * 14
        textRole: "text"
        valueRole: "value"
        model: [{ text: i18n("Standard (%1)", root.defaultName), value: "" }].concat(
            Qt.fontFamilies()
                .filter((f, i, all) => all.indexOf(f) === i)
                .map(f => ({ text: f, value: f })))

        delegate: QQC2.ItemDelegate {
            required property var modelData
            required property int index
            width: ListView.view.width
            text: modelData.text
            font.family: modelData.value || root.defaultName
            highlighted: familyBox.highlightedIndex === index
        }

        onActivated: root.family = currentValue
        Component.onCompleted: currentIndex = Math.max(0, indexOfValue(root.family))
    }

    QQC2.ComboBox {
        id: weightBox
        textRole: "text"
        valueRole: "value"
        model: [
            { text: i18n("Dünn"), value: Font.Thin },
            { text: i18n("Extraleicht"), value: Font.ExtraLight },
            { text: i18n("Leicht"), value: Font.Light },
            { text: i18n("Normal"), value: Font.Normal },
            { text: i18n("Mittel"), value: Font.Medium },
            { text: i18n("Halbfett"), value: Font.DemiBold },
            { text: i18n("Fett"), value: Font.Bold },
            { text: i18n("Extrafett"), value: Font.ExtraBold },
            { text: i18n("Schwarz"), value: Font.Black }
        ]

        onActivated: root.weight = currentValue
        Component.onCompleted: currentIndex = Math.max(0, indexOfValue(root.weight))
    }
}
