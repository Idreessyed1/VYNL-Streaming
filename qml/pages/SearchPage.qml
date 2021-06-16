import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../controls"
import QtGraphicalEffects 1.0

Rectangle {

    id: searchPage
    width: 980
    height: 1230
    color: thirdColor
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.leftMargin: 0
    clip: true
    anchors.topMargin: 0
    anchors.bottomMargin: 0

    Text {
        id: titleTxt
        x: 100
        y: 100
        width: 260
        height: 72
        color: secondaryColor
        text: qsTr("Search")
        elide: Text.ElideNone
        font.pixelSize: 60
        clip: true
        font.capitalization: Font.AllUppercase
        fontSizeMode: Text.FixedSize
        font.family: proximaNovaBold.name
    }

    SearchBar{
        id:searchBar
        x: 80
        y: 250
    }

    ListView {
        id: listView
        x: 80
        y: 375
        width: 820
        height: 803
        clip: true
        model: listModel
        spacing: 10

        delegate: Item {
            x: 5
            width: 680
            height: 100

            Row {
                id: row1
                objectName: index
                spacing: 10

                Image {
                    width: 178
                    height: 100
                    source: thumb
                    fillMode: Image.PreserveAspectCrop
                    MouseArea{
                        anchors.fill: parent
                        onClicked: con.add_to_queue(index)
                    }
                }

                Text {
                    text: name
                    elide: Text.ElideRight
                    width: 540
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 10
                    font.family: foundry.name
                    color: secondaryColor

                    MouseArea{
                        anchors.fill: parent
                        onClicked: con.add_to_queue(index)
                    }
                }

                MiniButton {
                    id: searchFavBtn
                    anchors.verticalCenter: parent.verticalCenter
                    size: 30
                    regImg: "star_icon.png"
                    pressedImg: "star_icon_pressed.png"
                    colorDefault: secondaryColor
                    colorMouseOver: mainColor
                    colorMousePressed: mainColor
                    onClicked: con.save_stream(index)

                }

                MiniButton {
                    id: searchAddBtn
                    anchors.verticalCenter: parent.verticalCenter
                    size: 30
                    regImg: "add_icon.png"
                    pressedImg: "add_icon.png"
                    colorDefault: secondaryColor
                    colorMouseOver: mainColor
                    colorMousePressed: mainColor
                    onClicked: con.add_to_queue(index)

                }
            }
        }

    }

    ListModel {
        id: listModel
    }

    Connections{
        target: con

        function onSearchResult(index, thumb, title){
            listModel.append({index: index, name: title, thumb: thumb});

        }

        function onClearSearch(){
            listModel.clear();
        }

    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
