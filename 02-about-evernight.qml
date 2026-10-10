/*
 *  SPDX-FileCopyrightText: 2026 The Evernight Vista Team
 *
 *  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
 */

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.ki18n

// Use Kirigami.Page directly (not plasma-welcome's Page). The plasma-welcome
// Page base declares `required title` / `required property string description`,
// which QML's StackView/Layers can fail to satisfy when the page is pushed by
// URL at runtime (the required-property check fires before bindings resolve).
// Kirigami.Page's title is a plain (non-required) property, so pushing this
// page as a layer sub-page works reliably.
Kirigami.Page {
    id: root

    // The title is shown in the Kirigami layer header together with an
    // automatically-provided back button (just like the upstream
    // "Supporting Members" sub-page), so no manual back button is needed.
    title: i18ndc("plasma-welcome-evernight", "@title", "About Evernight Vista")

    // No custom background and no custom text colors: let everything follow
    // the plasma-welcome theme, matching every other page.

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: Kirigami.Units.largeSpacing
        anchors.rightMargin: Kirigami.Units.largeSpacing
        anchors.topMargin: Kirigami.Units.largeSpacing
        anchors.bottomMargin: Kirigami.Units.largeSpacing
        spacing: Kirigami.Units.largeSpacing

        Kirigami.Heading {
            Layout.fillWidth: true
            text: i18ndc("plasma-welcome-evernight", "@title:row", "What is Evernight Vista?")
            level: 2
            wrapMode: Text.WordWrap
        }

        QQC2.Label {
            Layout.fillWidth: true
            Layout.maximumWidth: Math.round(root.width * 0.9)
            text: xi18ndc("plasma-welcome-evernight", "@info", "Evernight Vista is a Linux distribution built on Fedora, for every beginner and global user.")
            wrapMode: Text.WordWrap
            font.pointSize: Kirigami.Theme.defaultFont.pointSize + 2
        }

        // "Related Links" heading sits on its own line right after the
        // description, instead of being pushed to the bottom of the page.
        Kirigami.Heading {
            Layout.fillWidth: true
            text: i18ndc("plasma-welcome-evernight", "@title:row", "Related Links")
            level: 2
            wrapMode: Text.WordWrap
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: Kirigami.Units.largeSpacing * 3

            ColumnLayout {
                Layout.fillWidth: true
                spacing: Kirigami.Units.largeSpacing

                Repeater {
                    model: [
                        {
                            label: i18ndc("plasma-welcome-evernight", "@action:link", "Evernight Vista Official Website"),
                            url: "https://evernightfedora.github.io/evernight-vista"
                        },
                        {
                            label: i18ndc("plasma-welcome-evernight", "@action:link", "Support Us on Distrowatch"),
                            url: "https://distrowatch.com/table.php?distribution=evernight"
                        }
                    ]

                    delegate: QQC2.Button {
                        Layout.fillWidth: true
                        text: modelData.label
                        flat: true
                        display: QQC2.AbstractButton.TextOnly
                        onClicked: Qt.openUrlExternally(modelData.url)
                    }
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: Kirigami.Units.largeSpacing

                Repeater {
                    model: [
                        {
                            label: i18ndc("plasma-welcome-evernight", "@action:link", "Evernight Vista Project"),
                            url: "https://github.com/evernightvista"
                        },
                        {
                            label: i18ndc("plasma-welcome-evernight", "@action:link", "Fedora Linux Official Website"),
                            url: "https://fedoraproject.org"
                        }
                    ]

                    delegate: QQC2.Button {
                        Layout.fillWidth: true
                        text: modelData.label
                        flat: true
                        display: QQC2.AbstractButton.TextOnly
                        onClicked: Qt.openUrlExternally(modelData.url)
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
