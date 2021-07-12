import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../../images"
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
        x: 50
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
        id: searchBar
        x: 50
        y: 250
    }

    ListView {
        id: listView
        x: 50
        y: 375
        width: 880
        height: 800
        clip: true
        model: listModel
        spacing: 10

        delegate: Item {
            id: searchResult
            x: 5
            width: 820
            height: 100

            Row {
                id: row1
                anchors.fill: parent
                objectName: index
                spacing: 10

                Image {
                    id: searchImage
                    width: 178
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    source: thumb
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    anchors.leftMargin: 0
                    fillMode: Image.PreserveAspectCrop
                    MouseArea{
                        anchors.fill: parent
                        onClicked: con.add_to_queue(index)
                    }
                }

                Column{
                    id: textColumn
                    width: 400
                    spacing: 20
                    anchors.left: searchImage.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 20
                    anchors.bottomMargin: 50
                    anchors.topMargin: 50

                    Text {
                        id: resultTitleText
                        text: titleText
                        elide: Text.ElideRight
                        width: 400
                        font.pointSize: 10
                        font.family: foundry.name
                        color: secondaryColor

                        MouseArea{
                            anchors.fill: parent
                            onClicked: con.add_to_queue(index)
                        }
                    }


                    Text {
                        id: resultChannelText
                        text: channelText
                        elide: Text.ElideRight
                        width: 400
                        font.pointSize: 10
                        font.family: foundry.name
                        color: secondaryColor

                        MouseArea{
                            anchors.fill: parent
                            onClicked: con.add_to_queue(index)
                        }
                    }

                }

                Text{
                    id: resultTimeText
                    text: "3:54"
                    elide: Text.ElideRight
                    height: 30
                    width: 50
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: searchFavBtn.left
                    anchors.rightMargin: 30
                    font.pointSize: 20
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
                    anchors.right: searchAddBtn.left
                    anchors.rightMargin: 20
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
                    anchors.right: parent.right
                    anchors.rightMargin: 15
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

        ListElement{
            titleText: "Thriller this is a test to see how long the thing is"
            channelText: "Michael Jackson Topic"
            thumb: "../../images/temp_image.jpg"
        }
    }

    Connections{
        target: con

        function onSearchResult(index, thumb, title){
            listModel.append({index: index, resultTitleText: title, thumb: thumb});

        }

        function onClearSearch(){
            listModel.clear();
        }

    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:6}
}
##^##*/
