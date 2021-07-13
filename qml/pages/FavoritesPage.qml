import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../controls"
import QtGraphicalEffects 1.0

Rectangle {
    id: favoritesPage
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
        id: searchTitleTxt
        x: 100
        y: 100
        width: 450
        height: 72
        color: secondaryColor
        text: qsTr("FAVORITES")
        elide: Text.ElideNone
        font.pixelSize: 60
        clip: true
        font.capitalization: Font.AllUppercase
        fontSizeMode: Text.FixedSize
        font.family: proximaNovaBold.name
    }

    SearchBar{
        id:searchBar
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
            id: favorite
            x: 5
            width: 880
            height: 100
            property string ytID: yt_id


            Row {
                id: row1
                anchors.fill: parent
                objectName: index2
                spacing: 10

                Image {
                    id: favoriteImage
                    height: 100
                    width: 100
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    source: thumb
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    anchors.leftMargin: 0

                    property bool rounded: true
                    property bool adapt: true

                    layer.enabled: rounded
                    layer.effect: OpacityMask {
                        maskSource: Item {
                            width: favoriteImage.width
                            height: favoriteImage.height
                            Rectangle {
                                anchors.centerIn: parent
                                width: favoriteImage.adapt ? favoriteImage.width : Math.min(favoriteImage.width, favoriteImage.height)
                                height: favoriteImage.adapt ? favoriteImage.height : width
                                radius: 50
                            }
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: con.add_fav_queue(row1.objectName)
                    }
                }

                Column{
                    id: textColumn
                    width: 425
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: favoriteImage.right
                    anchors.leftMargin: 20

                    Text {
                        id: favoriteTitleText
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
                            onClicked: con.add_to_queue(index)
                        }
                    }


                    Text {
                        id: favoriteChannelText
                        text: artistText
                        elide: Text.ElideRight
                        anchors.left: parent.left
                        anchors.right: parent.right
                        fontSizeMode: Text.FixedSize
                        anchors.leftMargin: 0
                        anchors.rightMargin: 0
                        font.pixelSize: 22
                        font.family: foundry.name
                        color: secondaryColor
                    }

                }

                Text{
                    id: favoriteTimeText
                    text: timeText
                    elide: Text.ElideRight
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: favoriteFavBtn.left
                    fontSizeMode: Text.FixedSize
                    anchors.rightMargin: 30
                    font.family: foundry.name
                    font.pixelSize: 25
                    color: secondaryColor

                }

                MiniButton {
                    id: favoriteFavBtn
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: favoriteAddBtn.left
                    anchors.rightMargin: 20
                    size: 30
                    regImg:"star_icon_pressed.png"
                    pressedImg:"star_icon.png"
                    colorDefault: secondaryColor
                    colorMouseOver: mainColor
                    colorMousePressed: mainColor
                    onClicked: {
                        listView.model.remove(index)
                        con.delete_stream(ytID)
                    }

                }

                MiniButton {
                    id: favoriteAddBtn
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 15
                    size: 30
                    regImg: "add_icon.png"
                    pressedImg: "add_icon.png"
                    colorDefault: secondaryColor
                    colorMouseOver: mainColor
                    colorMousePressed: mainColor
                    onClicked: con.add_fav_queue(row1.objectName)
                }
            }
        }

        add: Transition {
                NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 200 }
                NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 200 }
            }

        remove: Transition {
                NumberAnimation { property: "opacity"; from: 1.0; to: 0; duration: 600 }
                NumberAnimation { property: "scale"; from: 1.0; to: 0; duration: 600 }
            }

        displaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 600; easing.type: Easing.InOutQuint }
        }
    }


    ListModel {
        id: listModel

        ListElement{
            yt_id:"123"
            index2: "3232"
            thumb: "../../images/temp_image.jpg"
            titleText: "This is a Test"
            artistText: "Micheal jackson"
        }
    }

    Connections{
        target: con
        function onSetFavorites(yt_id1, track, artist, album_art, time){
            listModel.append({yt_id: yt_id1, index2: yt_id1, titleText: track, artistText: artist, thumb: album_art, timeText: time});
        }

        function onClearFavorites(){
            listModel.clear();
        }

    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}
}
##^##*/
