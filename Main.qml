import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: rootwin
    width: 640
    height: 480
    visible: true
    title: qsTr("NoPassaran")

    required property var recordsModel

    header: ToolBar{
        Rectangle{
            property int padding: 8

            width: filterEdit.width - padding
            height: filterEdit.contentHeight
            x: filterEdit.x + padding/2
            anchors.verticalCenter: parent.verticalCenter
            color: "pink"
        }

        Row{
            anchors.fill: parent

            Text{
                text: "Поиск:"
                anchors.verticalCenter: parent.verticalCenter
            }

            TextInput{
                id: filterEdit
                width: 150
                cursorVisible: true
                padding: 10
                focus: true
                activeFocusOnPress: true
                leftPadding: 10

                text: "asd"
                clip: true
                anchors.verticalCenter: parent.verticalCenter
            }
            ToolButton{
                text: "Добавить"
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    console.log(recordsModel);
                }
            }
        }

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
                    policy: ScrollBar.AsNeeded
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
                    required property string name
                    required property var index

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

                onCurrentItemChanged: changeCurrentRecord(listView.currentIndex)
            }
        }

        // second view
        Item {
            ColumnLayout{
                anchors.fill: parent
                Text{
                    id: infoPanelCaption
                    text:"Не выбран элемент"
                    Layout.alignment: Qt.AlignHCenter
                }

                TextEdit{
                    id: textEdit
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                }

                ToolButton{
                    id: btnDelete
                    text: "Удалить"
                    Layout.alignment: Qt.AlignRight
                }
            }
        }
    }

    function changeCurrentRecord(index){
        if (index < 0){
            infoPanelCaption.text = "Не выбран элемент";
            return;
        }

        var item = recordsModel[index];
        infoPanelCaption.text = item.name
    }

}
