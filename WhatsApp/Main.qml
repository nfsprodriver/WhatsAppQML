import QtQuick 2.4
import Ubuntu.Components 1.3
//import WhatsApp 1.0
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    id: mainView

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "whatsapp.nfsprodriver"

    width: units.gu(50)
    height: units.gu(75)
    backgroundColor: UbuntuColors.porcelain

    Tabs {
        id: tabs
        Tab {
            title: "WhatsApp"
            page: Page {
                Column {
                    ActionBar {
                        id: actionBar
                        numberOfSlots: 3
                        actions: [
                            Action {
                                text: "Calls"
                                onTriggered: {
                                    mainStack.push(callsPage)
                                }
                            },
                            Action {
                                text: "Status"
                                onTriggered: {
                                    mainStack.push(statusPage)
                                }
                            },
                            Action {
                                text: "Chats"
                                onTriggered: {
                                    mainStack.push(chatsPage)
                                }
                            }
                        ]
                        delegate: Rectangle {
                            height: units.gu(4)
                            width: mainView.width/3
                            color: mainView.backgroundColor
                            Button {
                                height: parent.height
                                width: parent.width
                                action: modelData
                                color: parent.color
                            }
                        }
                    }
                }
                PageStack {
                    id: mainStack
                    anchors.topMargin: actionBar.height
                    Component.onCompleted:
                        [ push(callsPage),
                        push(statusPage),
                        push(chatsPage)
                    ]
                    Page {
                        id: chatsPage
                        Rectangle {
                            height: units.gu(6)
                            width: units.gu(6)
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: units.gu(3)
                            anchors.bottomMargin: units.gu(3)
                            color: mainView.backgroundColor
                            Item {
                                Action {
                                    id: newChat
                                    onTriggered: print("New Chat clicked.")
                                }
                                Button {
                                    height: units.gu(6)
                                    width: units.gu(6)
                                    action: newChat
                                    color: UbuntuColors.green
                                    Icon {
                                        anchors.centerIn: parent
                                        name: "message-new"
                                        height: units.gu(3)
                                        width: height
                                        color: "white"
                                    }
                                }
                            }
                        }
                        ListItem {
                            id: chats
                            height: chatLayout.height + (divider.visible ? divider.height : 0)
                            ListItemLayout {
                                id: chatLayout
                                title.text: "Contact's name"
                                subtitle.text: " "
                                Rectangle {
                                    SlotsLayout.position: SlotsLayout.Leading
                                    color: "grey"
                                    height: units.gu(7)
                                    width: height
                                    border.width: parent.activeFocus ? 1 : 2
                                    border.color: mainView.backgroundColor
                                    radius: width * 0.5
                                }
                                Item {
                                    id: chatsSlot
                                    width: secondLabelMain.width
                                    height: units.gu(7)
                                    SlotsLayout.overrideVerticalPositioning: true
                                    Label {
                                        id: firstLabelMain
                                        anchors.right: secondLabelMain.right
                                        text: "Last message"
                                        fontSize: "small"
                                        y: chatLayout.mainSlot.y + chatLayout.title.y
                                           + chatLayout.title.baselineOffset - baselineOffset
                                    }
                                    Label {
                                        id: secondLabelMain
                                        text: "Clocktime"
                                        fontSize: "small"
                                        y: chatLayout.mainSlot.y + chatLayout.subtitle.y
                                           + chatLayout.subtitle.baselineOffset - baselineOffset
                                    }
                                }
                            }
                            leadingActions: ListItemActions {
                                actions: [
                                    Action {
                                        iconName: "delete"
                                    }
                                ]
                            }
                            onClicked: console.log("Chat clicked.")
                        }
                    }
                    Page {
                        id: statusPage
                        Rectangle {
                            height: units.gu(6)
                            width: units.gu(6)
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: units.gu(3)
                            anchors.bottomMargin: units.gu(3)
                            color: mainView.backgroundColor
                            Item {
                                Action {
                                    id: newStatus
                                    onTriggered: print("New Status clicked.")
                                }
                                Button {
                                    height: units.gu(6)
                                    width: units.gu(6)
                                    action: newStatus
                                    color: UbuntuColors.green
                                    Icon {
                                        anchors.centerIn: parent
                                        name: "reminder-new"
                                        height: units.gu(3)
                                        width: height
                                        color: "white"
                                    }
                                }
                            }
                        }
                        Column {
                            anchors.fill: parent
                            ListItem {
                                id: myStatus
                                height: myStatusLayout.height + (divider.visible ? divider.height : 0)
                                ListItemLayout {
                                    id: myStatusLayout
                                    title.text: "My Status"
                                    subtitle.text: "Tap to create"
                                    Rectangle {
                                        SlotsLayout.position: SlotsLayout.Leading
                                        color: UbuntuColors.green
                                        height: units.gu(7)
                                        width: height
                                        border.width: parent.activeFocus ? 1 : 2
                                        border.color: mainView.backgroundColor
                                        radius: width * 0.5
                                        Icon {
                                            anchors.centerIn: parent
                                            name: "reminder-new"
                                            height: units.gu(4)
                                            width: height
                                            color: "white"
                                        }
                                    }
                                }
                                onClicked: console.log("My Status clicked.")
                            }
                            ListItem {
                                id: otherStatus
                                height: otherStatusLayout.height + (divider.visible ? divider.height : 0)
                                ListItemLayout {
                                    id: otherStatusLayout
                                    title.text: "Contact's name"
                                    subtitle.text: "Time"
                                    Rectangle {
                                        SlotsLayout.position: SlotsLayout.Leading
                                        color: "grey"
                                        height: units.gu(7)
                                        width: height
                                        border.width: parent.activeFocus ? 1 : 2
                                        border.color: mainView.backgroundColor
                                        radius: width * 0.5
                                    }
                                }
                                onClicked: console.log("Other's Status clicked.")
                            }
                        }
                    }
                    Page {
                        id: callsPage
                        Rectangle {
                            height: units.gu(6)
                            width: units.gu(6)
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: units.gu(3)
                            anchors.bottomMargin: units.gu(3)
                            color: mainView.backgroundColor
                            Item {
                                Action {
                                    id: newCall
                                    onTriggered: print("New Call clicked.")
                                }
                                Button {
                                    height: units.gu(6)
                                    width: units.gu(6)
                                    action: newCall
                                    color: UbuntuColors.green
                                    Icon {
                                        anchors.centerIn: parent
                                        name: "call-start"
                                        height: units.gu(3)
                                        width: height
                                        color: "white"
                                    }
                                }
                            }
                        }
                        ListItem {
                            id: calls
                            height: callsLayout.height + (divider.visible ? divider.height : 0)
                            ListItemLayout {
                                id: callsLayout
                                title.text: "Contact's name"
                                subtitle.text: "Direction and time"
                                Rectangle {
                                    SlotsLayout.position: SlotsLayout.Leading
                                    color: "grey"
                                    height: units.gu(7)
                                    width: height
                                    border.width: parent.activeFocus ? 1 : 2
                                    border.color: mainView.backgroundColor
                                    radius: width * 0.5
                                }
                            }
                            onClicked: console.log("Call clicked.")
                        }
                    }
                }
            }
        }
        Tab {
            title: "New group"
            page: Page {
                ListItem {
                    id: contactsGroup
                    height: groupLayout.height + (divider.visible ? divider.height : 0)
                    ListItemLayout {
                        id: groupLayout
                        title.text: "Contact's name"
                        subtitle.text: "Contact's status"
                        Rectangle {
                            SlotsLayout.position: SlotsLayout.Leading
                            color: "grey"
                            height: units.gu(7)
                            width: height
                            border.width: parent.activeFocus ? 1 : 2
                            border.color: mainView.backgroundColor
                            radius: width * 0.5
                        }
                    }
                    onClicked: console.log("Contact clicked.")
                }
            }
        }
        Tab {
            title: "New broadcast"
            page: Page {
                ListItem {
                    id: contactsBroadcast
                    height: broadcastLayout.height + (divider.visible ? divider.height : 0)
                    ListItemLayout {
                        id: broadcastLayout
                        title.text: "Contact's name"
                        subtitle.text: "Contact's status"
                        Rectangle {
                            SlotsLayout.position: SlotsLayout.Leading
                            color: "grey"
                            height: units.gu(7)
                            width: height
                            border.width: parent.activeFocus ? 1 : 2
                            border.color: mainView.backgroundColor
                            radius: width * 0.5
                        }
                    }
                    onClicked: console.log("Contact clicked.")
                }
            }
        }
        Tab {
            title: "Starred"
            page: Page {
                ListItem {
                    id: starred
                    height: starredLayout.height + (divider.visible ? divider.height : 0)
                    ListItemLayout {
                        id: starredLayout
                        title.text: "Contact's name"
                        subtitle.text: " "
                        Rectangle {
                            SlotsLayout.position: SlotsLayout.Leading
                            color: "grey"
                            height: units.gu(7)
                            width: height
                            border.width: parent.activeFocus ? 1 : 2
                            border.color: mainView.backgroundColor
                            radius: width * 0.5
                        }
                        Item {
                            id: starredSlot
                            width: secondLabelStarred.width
                            height: units.gu(7)
                            SlotsLayout.overrideVerticalPositioning: true
                            Label {
                                id: firstLabelStarred
                                anchors.right: secondLabelStarred.right
                                text: "Starred message"
                                fontSize: "small"
                                y: starredLayout.mainSlot.y + starredLayout.title.y
                                   + starredLayout.title.baselineOffset - baselineOffset
                            }
                            Label {
                                id: secondLabelStarred
                                text: "Clocktime"
                                fontSize: "small"
                                y: starredLayout.mainSlot.y + starredLayout.subtitle.y
                                   + starredLayout.subtitle.baselineOffset - baselineOffset
                            }
                        }
                    }
                    leadingActions: ListItemActions {
                        actions: [
                            Action {
                                iconName: "delete"
                            }
                        ]
                    }
                    onClicked: console.log("Message clicked.")
                }
            }
        }
        Tab {
            title: "Settings"
            page: Page {
                Column {
                    anchors.fill: parent
                    ListItem {
                        id: me
                        height: meLayout.height + (divider.visible ? divider.height : 0)
                        ListItemLayout {
                            id: meLayout
                            title.text: "My name"
                            subtitle.text: "My status"
                            Rectangle {
                                SlotsLayout.position: SlotsLayout.Leading
                                color: "grey"
                                height: units.gu(7)
                                width: height
                                border.width: parent.activeFocus ? 1 : 2
                                border.color: mainView.backgroundColor
                                radius: width * 0.5
                            }
                            Item {
                                id: meSlot
                                height: units.gu(7)
                                SlotsLayout.overrideVerticalPositioning: true
                            }
                        }
                        onClicked: console.log("Me clicked.")
                    }
                    ListItem {
                        id: accountSetting
                        height: accountSettingLayout.height + (divider.visible ? divider.height : 0)
                        ListItemLayout {
                            id: accountSettingLayout
                            title.text: "Account"
                            subtitle.text: " "
                            Rectangle {
                                SlotsLayout.position: SlotsLayout.Leading
                                height: units.gu(6)
                                width: height
                                color: mainView.backgroundColor
                                Icon {
                                    anchors.centerIn: parent
                                    name: "account"
                                    height: units.gu(4)
                                    width: height
                                    color: UbuntuColors.green
                                }
                            }
                        }
                        onClicked: console.log("Account clicked.")
                    }
                    ListItem {
                        id: chatsSetting
                        height: chatsSettingLayout.height + (divider.visible ? divider.height : 0)
                        ListItemLayout {
                            id: chatsSettingLayout
                            title.text: "Chats"
                            subtitle.text: " "
                            Rectangle {
                                SlotsLayout.position: SlotsLayout.Leading
                                height: units.gu(6)
                                width: height
                                color: mainView.backgroundColor
                                Icon {
                                    anchors.centerIn: parent
                                    name: "message"
                                    height: units.gu(4)
                                    width: height
                                    color: UbuntuColors.green
                                }
                            }
                        }
                        onClicked: console.log("Chats clicked.")
                    }
                    ListItem {
                        id: notifSetting
                        height: notifSettingLayout.height + (divider.visible ? divider.height : 0)
                        ListItemLayout {
                            id: notifSettingLayout
                            title.text: "Notifications"
                            subtitle.text: " "
                            Rectangle {
                                SlotsLayout.position: SlotsLayout.Leading
                                height: units.gu(6)
                                width: height
                                color: mainView.backgroundColor
                                Icon {
                                    anchors.centerIn: parent
                                    name: "notification"
                                    height: units.gu(4)
                                    width: height
                                    color: UbuntuColors.green
                                }
                            }
                        }
                        onClicked: console.log("Notifications clicked.")
                    }
                    ListItem {
                        id: dataSetting
                        height: dataSettingLayout.height + (divider.visible ? divider.height : 0)
                        ListItemLayout {
                            id: dataSettingLayout
                            title.text: "Data usage"
                            subtitle.text: " "
                            Rectangle {
                                SlotsLayout.position: SlotsLayout.Leading
                                height: units.gu(6)
                                width: height
                                color: mainView.backgroundColor
                                Icon {
                                    anchors.centerIn: parent
                                    name: "history"
                                    height: units.gu(4)
                                    width: height
                                    color: UbuntuColors.green
                                }
                            }
                        }
                        onClicked: console.log("Data usage clicked.")
                    }
                    ListItem {
                        id: contactsSetting
                        height: contactsSettingLayout.height + (divider.visible ? divider.height : 0)
                        ListItemLayout {
                            id: contactsSettingLayout
                            title.text: "Contacts"
                            subtitle.text: " "
                            Rectangle {
                                SlotsLayout.position: SlotsLayout.Leading
                                height: units.gu(6)
                                width: height
                                color: mainView.backgroundColor
                                Icon {
                                    anchors.centerIn: parent
                                    name: "contact-group"
                                    height: units.gu(4)
                                    width: height
                                    color: UbuntuColors.green
                                }
                            }
                        }
                        onClicked: console.log("Contacts clicked.")
                    }
                    ListItem {
                        id: helpSetting
                        height: helpSettingLayout.height + (divider.visible ? divider.height : 0)
                        ListItemLayout {
                            id: helpSettingLayout
                            title.text: "Help"
                            subtitle.text: " "
                            Rectangle {
                                SlotsLayout.position: SlotsLayout.Leading
                                height: units.gu(6)
                                width: height
                                color: mainView.backgroundColor
                                Icon {
                                    anchors.centerIn: parent
                                    name: "help"
                                    height: units.gu(4)
                                    width: height
                                    color: UbuntuColors.green
                                }
                            }
                        }
                        onClicked: console.log("Help clicked.")
                    }
                }
            }
        }
    }
}


