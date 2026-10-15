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
import org.kde.plasma.welcome

// Use Kirigami.Page directly (not plasma-welcome's Page) for the same reason as
// 02-about-evernight.qml: this page is pushed by URL as a Kirigami layer
// sub-page at runtime, and Kirigami.Page's title is a plain property that
// StackView/Layers can always satisfy.
Kirigami.Page {
    id: root

    readonly property int cardHeight: Kirigami.Units.gridUnit * 10

    // The title is shown in the Kirigami layer header together with an
    // automatically-provided back button, just like the "About Evernight Vista"
    // sub-page, so no manual back button is needed.
    title: i18ndc("plasma-welcome-evernight", "@title", "Gaming Support")

    // Launches a terminal emulator that runs the dnf command installing the
    // official Fedora kernel. Konsole is preferred; if it is not available,
    // other common terminal emulators are tried in turn. Utils.runCommand()
    // reports a program that could not be found with an exit code of -1, which
    // is what triggers the fallback.
    function installFedoraKernel() {
        const command = "sudo dnf install -y kernel kernel-core kernel-modules kernel-modules-core kernel-modules-extra";
        const terminalCommands = [
            "konsole --hold -e " + command,
            "gnome-terminal --wait -- " + command,
            "xterm -hold -e " + command
        ];

        function tryNext(index) {
            if (index >= terminalCommands.length) {
                return;
            }
            Utils.runCommand(terminalCommands[index], function (exitCode) {
                if (exitCode === -1) {
                    tryNext(index + 1);
                }
            });
        }

        tryNext(0);
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: Kirigami.Units.largeSpacing
        anchors.rightMargin: Kirigami.Units.largeSpacing
        anchors.topMargin: Kirigami.Units.largeSpacing
        anchors.bottomMargin: Kirigami.Units.largeSpacing
        spacing: Kirigami.Units.largeSpacing

        QQC2.Label {
            Layout.fillWidth: true
            text: xi18ndc("plasma-welcome-evernight", "@info", "Evernight Vista supports most Wine and Steam games. With Wine and Steam Proton, you can easily play Windows games. However, some games may not run properly under Evernight Vista because of their anti-cheat systems. Or some games' anti-cheat systems use Epic EAC Linux v2, which may also fail to run properly under Evernight Vista, because you may receive an anti-cheat error prompt.")
            wrapMode: Text.WordWrap
        }

        QQC2.Label {
            Layout.fillWidth: true
            textFormat: Text.RichText
            wrapMode: Text.WordWrap
            onLinkActivated: Qt.openUrlExternally(link)
            text: xi18ndc("plasma-welcome-evernight", "@info", "Related Links: <a href=\"%1\">Epic's Linux Anti-Cheat System</a>", "https://onlineservices.epicgames.com/news/introducing-easy-anti-cheat-linux-v2")
        }

        Kirigami.CardsLayout {
            Layout.fillWidth: true
            implicitHeight: root.cardHeight

            RowLayout {
                Layout.fillWidth: true
                Layout.margins: Kirigami.Units.largeSpacing
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Icon {
                    source: "distributor-logo-fedora"
                    Layout.preferredWidth: Kirigami.Units.iconSizes.huge
                    Layout.preferredHeight: Kirigami.Units.iconSizes.huge
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: Kirigami.Units.smallSpacing

                    Kirigami.Heading {
                        text: i18ndc("plasma-welcome-evernight", "@title:row", "Install the Official Fedora Kernel")
                        level: 3
                        wrapMode: Text.WordWrap
                    }

                    QQC2.Label {
                        text: xi18ndc("plasma-welcome-evernight", "@info", "If some games' anti-cheat systems use Epic EAC Linux v2 and the games fail to start, try installing the official Fedora kernel, then boot from the official Fedora kernel and try to launch games that use the Epic EAC Linux v2 anti-cheat system again.")
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }

                QQC2.Button {
                    text: i18ndc("plasma-welcome-evernight", "@action:button", "Install")
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: root.installFedoraKernel()
                }
            }
        }

        QQC2.Label {
            Layout.fillWidth: true
            Layout.topMargin: Kirigami.Units.largeSpacing
            text: xi18ndc("plasma-welcome-evernight", "@info", "Note: If you boot from the official Fedora kernel, some driver support may be missing, which may cause some hardware to stop working. It is recommended to boot from the official Fedora kernel only when playing games that use the Epic EAC Linux v2 anti-cheat system.")
            wrapMode: Text.WordWrap
        }
    }
}
