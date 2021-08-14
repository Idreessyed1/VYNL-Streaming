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
            width: 880
            height: 100

            property string ytID: yt_id


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
                        onClicked: con.add_to_queue(searchResult.ytID)
                    }
                }

                Column{
                    id: textColumn
                    width: 425
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: searchImage.right
                    anchors.leftMargin: 20

                    Text {
                        id: resultTitleText
                        text: titleText
                        elide: Text.ElideRight
                        anchors.left: parent.left
                        anchors.right: parent.right
                        fontSizeMode: Text.FixedSize
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                        font.pixelSize: 25
                        font.family: foundry.name
                        color: secondaryColor

                        MouseArea{
                            anchors.fill: parent
                            onClicked: con.add_to_queue(searchResult.ytID)
                        }
                    }


                    Text {
                        id: resultChannelText
                        text: channelText
                        elide: Text.ElideRight
                        anchors.left: parent.left
                        anchors.right: parent.right
                        fontSizeMode: Text.FixedSize
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                        font.pixelSize: 22
                        font.family: foundry.name
                        color: secondaryColor

                        MouseArea{
                            anchors.fill: parent
                            onClicked: con.add_to_queue(searchResult.ytID)
                        }
                    }

                }

                Text{
                    id: resultTimeText
                    text: "3:54"
                    elide: Text.ElideRight
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: searchFavBtn.left
                    fontSizeMode: Text.FixedSize
                    anchors.rightMargin: 30
                    font.family: foundry.name
                    font.pixelSize: 25
                    color: secondaryColor

                    MouseArea{
                        anchors.fill: parent
                        onClicked: con.add_to_queue(searchResult.ytID)
                    }
                }

                MiniButton {
                    id: searchFavBtn
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: searchAddBtn.left
                    anchors.rightMargin: 20
                    size: 30
                    regImg: regStar
                    pressedImg: pressStar
                    colorDefault: secondaryColor
                    colorMouseOver: mainColor
                    colorMousePressed: mainColor
                    onClicked: con.save_delete_stream(searchResult.ytID)

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
                    onClicked: con.add_to_queue(searchResult.ytID)

                }
            }
        }

        add: Transition {
                NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 400 }
                NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 400 }
            }

        remove: Transition {
                NumberAnimation { property: "opacity"; from: 1.0; to: 0; duration: 400 }
                NumberAnimation { property: "scale"; from: 1.0; to: 0; duration: 400 }
            }

        displaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.InOutQuint }
        }

    }

    ListModel {
        id: listModel

//        ListElement{
//            titleText: "Thriller this is a test to see how long the thing is"
//            channelText: "Michael Jackson Topic"
//            thumb: "../../images/temp_image.jpg"
//        }
    }

    Connections{
        target: con

        function onSearchResult(yt_id, title, channel, thumb, regStar, pressStar){
            listModel.append({yt_id: yt_id, titleText: title, channelText: channel, thumb: thumb, regStar: regStar, pressStar: pressStar});
        }

//        function onSearchResult(index, thumb, title, channel){
//            listModel.append({index: index, titleText: title, channelText: channel, thumb: thumb});
//        }

        function onClearSearch(){
            listModel.clear();
        }

    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.25}
}
##^##*/
