import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: rootwin
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    ListModel {
        id: recordsModel

        ListElement { name: "2domains" }
        ListElement { name: "3d-mapper.com" }
        ListElement { name: "3ddd" }
        ListElement { name: "4pda" }
        ListElement { name: "AliExpress" }
        ListElement { name: "EkfvjhmzLe," }
        ListElement { name: "Father" }
        ListElement { name: "Habr" }
        ListElement { name: "Hugging Face" }
        ListElement { name: "Postshot" }
        ListElement { name: "Skype" }
        ListElement { name: "V-play" }
        ListElement { name: "adobe" }
        ListElement { name: "aftershock" }
        ListElement { name: "alfaFile" }
        ListElement { name: "avito" }
        ListElement { name: "bonus" }
        ListElement { name: "bt.astralinux.ru" }
        ListElement { name: "bytesbox.ru" }
        ListElement { name: "circuits.io" }
        ListElement { name: "citylink" }
        ListElement { name: "cjaym" }
        ListElement { name: "discord" }
        ListElement { name: "dmkpress" }
        ListElement { name: "dropbox" }
        ListElement { name: "fusionbrain.ai" }
        ListElement { name: "github" }
    }


    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal

        Item {
            SplitView.minimumWidth: 25
            SplitView.preferredWidth: 250
            SplitView.maximumWidth: 600

            ListView{
                id: listView
                anchors.fill: parent
                model: recordsModel
                spacing:  0
                focus: true
                clip: true


                ScrollBar.vertical: ScrollBar {
                    id: bar
                    policy: ScrollBar.AlwaysOn
                    active: ScrollBar.AlwaysOn
                }

                highlightMoveDuration: 100
                highlight: Rectangle
                  {
                       color:"black"
                       radius: 5
                       opacity: 0.7
                       focus: true
                  }


                delegate: Item{
                    height: 30
                    width: parent ? parent.width - bar.width : 10


                    Rectangle{
                        anchors.fill: parent
                        anchors.margins: 2
                        color: "lightgray"

                        Text{
                            text: name
                            x: 20
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: listView.currentIndex = index
                            cursorShape: "PointingHandCursor"
                        }
                    }
                }
            }
        }
        Item {
            Rectangle{
                width: 100
                height: 100
                color: "pink"
            }
        }

    }

}
