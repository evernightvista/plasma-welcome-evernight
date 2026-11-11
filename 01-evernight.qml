/*
 *  SPDX-FileCopyrightText: 2026 Your Name <your.email@example.com>
 *
 *  SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
 */

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.ki18n
import org.kde.plasma.welcome

Page {
    id: root
    readonly property int cardHeight: Kirigami.Units.gridUnit * 8

    heading: i18ndc("plasma-welcome-evernight", "@info:window", "Evernight Vista New User Guide")
    description: xi18ndc("plasma-welcome-evernight", "@info:usagetip", "The following tools can help you get started quickly and enhance your system experience.")

    // The "About Evernight Vista" sub-page, opened as a Kirigami layer
    // (sub-page) within the same window — not as a separate new page —
    // exactly mirroring how the upstream Enjoy.qml page opens its
    // "Supporting Members" sub-page via pageStack.layers.push().
    //
    // Enjoy.qml can write `Supporters {}` because Supporters.qml is shipped
    // inside the plasma-welcome QML module and registered as a QML type.
    // The Evernight extra-page is loaded from the filesystem at runtime, so
    // it is not a registered type; we therefore push it by URL instead,
    // resolving the path relative to this page so it works regardless of
    // the install prefix.
    //
    // 02-about-evernight.qml and 03-gaming-support.qml live in the evernight/
    // sub-directory of extra-pages/ so the distro-page scanner (which only
    // lists top-level files) never picks them up as standalone pages, leaving
    // them available to be pushed on demand here.
    readonly property url aboutPageUrl: Qt.resolvedUrl("evernight/02-about-evernight.qml")
    readonly property url gamingSupportPageUrl: Qt.resolvedUrl("evernight/03-gaming-support.qml")

    // "Gaming Support" and "About Evernight Vista" buttons, shown in the
    // top-right corner of the toolbar.
    actions: [
        Kirigami.Action {
            text: i18ndc("plasma-welcome-evernight", "@action:button", "Gaming Support")
            icon.name: "input-gaming"
            displayHint: Kirigami.DisplayHint.KeepVisible
            onTriggered: pageStack.layers.push(root.gamingSupportPageUrl)
        },
        Kirigami.Action {
            text: i18ndc("plasma-welcome-evernight", "@action:button", "About Evernight Vista")
            icon.name: "help-about"
            displayHint: Kirigami.DisplayHint.KeepVisible
            onTriggered: pageStack.layers.push(root.aboutPageUrl)
        }
    ]

    ColumnLayout {
        anchors.fill: parent
        spacing: Kirigami.Units.largeSpacing

        // ----- 1. Miryu 硬件管理器 -----
        Kirigami.CardsLayout {
            Layout.fillWidth: true
            implicitHeight: root.cardHeight

            RowLayout {
                Layout.fillWidth: true
                Layout.margins: Kirigami.Units.largeSpacing
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Icon {
                    source: "yast-hardware"
                    Layout.preferredWidth: Kirigami.Units.iconSizes.huge
                    Layout.preferredHeight: Kirigami.Units.iconSizes.huge
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: Kirigami.Units.smallSpacing

                    Kirigami.Heading {
                        text: i18ndc("plasma-welcome-evernight", "@title:row", "Miryu Hardware Manager")
                        level: 3
                        wrapMode: Text.WordWrap
                    }

                    QQC2.Label {
                        text: i18ndc("plasma-welcome-evernight", "@info", "View Miryu Hardware Manager's driver management to see if your computer needs any additional drivers installed. Most hardware drivers can be recognized by the Evernight Vista kernel, and these drivers work automatically without installation. However, some drivers may require additional installation to work properly or get better performance.")
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }

                QQC2.Button {
                    text: i18ndc("plasma-welcome-evernight", "@action:button", "Start")
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        Controller.launchApp("miryu-hardware-manager");
                    }
                }
            }
        }

        // ----- 2. Miryu Software Center (更新系统) -----
        Kirigami.CardsLayout {
            Layout.fillWidth: true
            implicitHeight: root.cardHeight

            RowLayout {
                Layout.fillWidth: true
                Layout.margins: Kirigami.Units.largeSpacing
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Icon {
                    source: "miryu-package-manager"
                    Layout.preferredWidth: Kirigami.Units.iconSizes.huge
                    Layout.preferredHeight: Kirigami.Units.iconSizes.huge
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: Kirigami.Units.smallSpacing

                    Kirigami.Heading {
                        text: i18ndc("plasma-welcome-evernight", "@title:row", "Install Software & Update System")
                        level: 3
                        wrapMode: Text.WordWrap
                    }

                    QQC2.Label {
                        text: xi18ndc("plasma-welcome-evernight", "@info", "Miryu Software Center can provide security updates, feature updates, and kernel updates for the Evernight Vista operating system, helping to maintain its security, boost performance, and add support for new hardware. In addition, you can also install software from flatpak and linyaps in the Miryu Software Center.")
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }

                QQC2.Button {
                    text: i18ndc("plasma-welcome-evernight", "@action:button", "Start")
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        Controller.launchApp("org.miryugaming.PackageManager");
                    }
                }
            }
        }

        // ----- 3. 系统设置 -----
        Kirigami.CardsLayout {
            Layout.fillWidth: true
            implicitHeight: root.cardHeight

            RowLayout {
                Layout.fillWidth: true
                Layout.margins: Kirigami.Units.largeSpacing
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Icon {
                    source: "preferences-system"
                    Layout.preferredWidth: Kirigami.Units.iconSizes.huge
                    Layout.preferredHeight: Kirigami.Units.iconSizes.huge
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: Kirigami.Units.smallSpacing

                    Kirigami.Heading {
                        text: i18ndc("plasma-welcome-evernight", "@title:row", "System Settings")
                        level: 3
                        wrapMode: Text.WordWrap
                    }

                    QQC2.Label {
                        text: xi18ndc("plasma-welcome-evernight", "@info", "Open the KDE system settings, and you can set up your Evernight Vista operating system your way, like configuring peripherals and appearance.")
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }

                QQC2.Button {
                    text: i18ndc("plasma-welcome-evernight", "@action:button", "Start")
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        Controller.launchApp("systemsettings");
                    }
                }
            }
        }

        // ----- 4. 软件源 (新增) -----
        Kirigami.CardsLayout {
            Layout.fillWidth: true
            implicitHeight: root.cardHeight

            RowLayout {
                Layout.fillWidth: true
                Layout.margins: Kirigami.Units.largeSpacing
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Icon {
                    source: "btrfs-assistant"   // 图标表示软件源/包管理
                    Layout.preferredWidth: Kirigami.Units.iconSizes.huge
                    Layout.preferredHeight: Kirigami.Units.iconSizes.huge
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: Kirigami.Units.smallSpacing

                    Kirigami.Heading {
                        text: i18ndc("plasma-welcome-evernight", "@title:row", "Btrfs Assistant")
                        level: 3
                        wrapMode: Text.WordWrap
                    }

                    QQC2.Label {
                        text: i18ndc("plasma-welcome-evernight", "@info", "Using the Btrfs assistant to set up Snapper and create Btrfs snapshots can help you easily roll back the system in case of problems after updating or other issues.")
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }

                QQC2.Button {
                    text: i18ndc("plasma-welcome-evernight", "@action:button", "Start")
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        Controller.launchApp("btrfs-assistant");
                    }
                }
            }
        }
    }
}
