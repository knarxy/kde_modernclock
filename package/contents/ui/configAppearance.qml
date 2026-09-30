import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM
import org.kde.kquickcontrols as KQControls

KCM.SimpleKCM {
    id: appearancePage

    property alias cfg_show_day: showDay.checked
    property alias cfg_show_date: showDate.checked
    property alias cfg_show_time: showTime.checked
    property alias cfg_day_font_size: dayFontSize.value
    property alias cfg_date_font_size: dateFontSize.value
    property alias cfg_time_font_size: timeFontSize.value
    property alias cfg_day_letter_spacing: dayLetterSpacing.value
    property alias cfg_date_letter_spacing: dateLetterSpacing.value
    property alias cfg_time_letter_spacing: timeLetterSpacing.value
    property alias cfg_day_font_color: dayFontColor.color
    property alias cfg_date_font_color: dateFontColor.color
    property alias cfg_time_font_color: timeFontColor.color
    property alias cfg_use_24_hour_format: use24HourFormat.checked
    property alias cfg_time_character: timeCharacter.text
    property alias cfg_date_format: dateFormat.text

    Kirigami.FormLayout {

        // Wochentag
        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Wochentag")
        }
        QQC2.CheckBox {
            id: showDay
            Kirigami.FormData.label: i18n("Anzeigen:")
        }
        QQC2.SpinBox {
            id: dayFontSize
            Kirigami.FormData.label: i18n("Schriftgröße:")
            from: 1; to: 999
            enabled: showDay.checked
        }
        QQC2.SpinBox {
            id: dayLetterSpacing
            Kirigami.FormData.label: i18n("Zeichenabstand:")
            from: 0; to: 999
            enabled: showDay.checked
        }
        KQControls.ColorButton {
            id: dayFontColor
            Kirigami.FormData.label: i18n("Schriftfarbe:")
            showAlphaChannel: true
            enabled: showDay.checked
        }

        // Datum
        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Datum")
        }
        QQC2.CheckBox {
            id: showDate
            Kirigami.FormData.label: i18n("Anzeigen:")
        }
        QQC2.SpinBox {
            id: dateFontSize
            Kirigami.FormData.label: i18n("Schriftgröße:")
            from: 1; to: 999
            enabled: showDate.checked
        }
        QQC2.SpinBox {
            id: dateLetterSpacing
            Kirigami.FormData.label: i18n("Zeichenabstand:")
            from: 0; to: 999
            enabled: showDate.checked
        }
        QQC2.TextField {
            id: dateFormat
            Kirigami.FormData.label: i18n("Datumsformat:")
            placeholderText: "dd. MMMM yyyy"
            enabled: showDate.checked
            QQC2.ToolTip.visible: hovered
            QQC2.ToolTip.text: i18n("Qt-Datumsformat, z. B. „dd. MMMM yyyy“ oder „dd.MM.yyyy“")
        }
        KQControls.ColorButton {
            id: dateFontColor
            Kirigami.FormData.label: i18n("Schriftfarbe:")
            showAlphaChannel: true
            enabled: showDate.checked
        }

        // Uhrzeit
        Kirigami.Separator {
            Kirigami.FormData.isSection: true
            Kirigami.FormData.label: i18n("Uhrzeit")
        }
        QQC2.CheckBox {
            id: showTime
            Kirigami.FormData.label: i18n("Anzeigen:")
        }
        QQC2.SpinBox {
            id: timeFontSize
            Kirigami.FormData.label: i18n("Schriftgröße:")
            from: 1; to: 999
            enabled: showTime.checked
        }
        QQC2.SpinBox {
            id: timeLetterSpacing
            Kirigami.FormData.label: i18n("Zeichenabstand:")
            from: 0; to: 999
            enabled: showTime.checked
        }
        QQC2.CheckBox {
            id: use24HourFormat
            Kirigami.FormData.label: i18n("24-Stunden-Format:")
            enabled: showTime.checked
        }
        QQC2.TextField {
            id: timeCharacter
            Kirigami.FormData.label: i18n("Zierzeichen:")
            maximumLength: 1
            enabled: showTime.checked
        }
        KQControls.ColorButton {
            id: timeFontColor
            Kirigami.FormData.label: i18n("Schriftfarbe:")
            showAlphaChannel: true
            enabled: showTime.checked
        }
    }
}
