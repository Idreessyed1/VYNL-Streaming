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
            width: 800
            height: 100
            property string ytID: yt_id

            Row {
                id: row1
                objectName: index2
                spacing: 10

                Image {
                    width: 100
                    height: 100
                    source: thumb
                    fillMode: Image.PreserveAspectCrop
                }

                Column{

                    width: 540
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 100
                    anchors.topMargin: 0

                    Text {
                        text: name
                        elide: Text.ElideRight
                        anchors.verticalCenter: parent.verticalCenter
                        width: 540
                        font.pointSize: 12
                        font.family: foundry.name
                        color: secondaryColor
                    }

                    Text {
                        text: name2
                        elide: Text.ElideRight
                        anchors.verticalCenter: parent.verticalCenter
                        width: 540
                        font.pointSize: 10
                        font.family: foundry.name
                        color: secondaryColor
                    }
                }

                MiniButton {
                    id: searchFavBtn
                    anchors.verticalCenter: parent.verticalCenter
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
                    id: searchAddBtn
                    anchors.verticalCenter: parent.verticalCenter
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
            name: "This is a Test"
            name2: "Micheal jackson"
        }
    }

    Connections{
        target: con
        function onSetFavorites(yt_id1, track, artist, album_art){
            listModel.append({yt_id: yt_id1, index2: yt_id1, name: track, name2: artist, thumb: album_art});
        }

        function onClearFavorites(){
            listModel.clear();
        }

    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
