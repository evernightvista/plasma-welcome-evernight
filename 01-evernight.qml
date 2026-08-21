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

    ColumnLayout {
        anchors.fill: parent
        spacing: Kirigami.Units.largeSpacing

        // ----- 1. 驱动管理器 -----
        Kirigami.CardsLayout {
            Layout.fillWidth: true
            implicitHeight: root.cardHeight

            RowLayout {
                Layout.fillWidth: true
                Layout.margins: Kirigami.Units.largeSpacing
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Icon {
                    source: "nvidia"
                    Layout.preferredWidth: Kirigami.Units.iconSizes.huge
                    Layout.preferredHeight: Kirigami.Units.iconSizes.huge
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: Kirigami.Units.smallSpacing

                    Kirigami.Heading {
                        text: i18ndc("plasma-welcome-evernight", "@title:row", "Nvidia Driver Manager")
                        level: 3
                        wrapMode: Text.WordWrap
                    }

                    QQC2.Label {
                        text: i18ndc("plasma-welcome-evernight", "@info", "If you have an NVIDIA graphics card, use the NVIDIA Driver Manager to install drivers. The Evernight Vista kernel can recognize most hardware drivers, and these drivers can work automatically without installing extra drivers, but NVIDIA drivers need proprietary ones to work properly or to get better performance.")
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }

                QQC2.Button {
                    text: i18ndc("plasma-welcome-evernight", "@action:button", "Start")
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        Controller.launchApp("nvidia-driver-manager");
                    }
                }
            }
        }

        // ----- 2. Miryu Package Manager (更新系统) -----
        Kirigami.CardsLayout {
            Layout.fillWidth: true
            implicitHeight: root.cardHeight

            RowLayout {
                Layout.fillWidth: true
                Layout.margins: Kirigami.Units.largeSpacing
                spacing: Kirigami.Units.largeSpacing

                Kirigami.Icon {
                    source: "system-software-install"
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
                        text: xi18ndc("plasma-welcome-evernight", "@info", "Miryu Package Manager can provide security updates, feature updates, and kernel updates for the Evernight Vista operating system, helping to maintain its security, boost performance, and add support for new hardware. In addition, you can also install software from flatpak and linyaps in the Miryu Package Manager.")
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }

                QQC2.Button {
                    text: i18ndc("plasma-welcome-evernight", "@action:button", "Start")
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        Controller.launchApp("org.miryu.PackageManager");
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
                    source: "gpk-repo"   // 图标表示软件源/包管理
                    Layout.preferredWidth: Kirigami.Units.iconSizes.huge
                    Layout.preferredHeight: Kirigami.Units.iconSizes.huge
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: Kirigami.Units.smallSpacing

                    Kirigami.Heading {
                        text: i18ndc("plasma-welcome-evernight", "@title:row", "Repository Manager")
                        level: 3
                        wrapMode: Text.WordWrap
                    }

                    QQC2.Label {
                        text: i18ndc("plasma-welcome-evernight", "@info", "Changing the software source can get you faster download speeds, which can help reduce update time.")
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                    }
                }

                QQC2.Button {
                    text: i18ndc("plasma-welcome-evernight", "@action:button", "Start")
                    Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                    onClicked: {
                        Controller.launchApp("evernight-vista-repo-gui");
                    }
                }
            }
        }
    }
}
