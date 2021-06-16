import QtQuick 2.0
import QtQuick.Controls 2.15

Rectangle{
    id: tempRect
    width: 700

    height: 400
    color: "#ffffff"

    Row {
        id: queueRow
        x: 50
        y: 39
        width: 500
        height: 100

        Image {
            id: image1
            width: 100
            height: 100
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "../../images/thriller.jpg"
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            fillMode: Image.PreserveAspectFit
        }

        Column {
            id: column
            width: 400
            height: 100

            Text {
                id: songQueTxt
                text: qsTr("Thriller")
                font.pixelSize: 40
            }

            Text {
                id: artistQuetxt
                text: qsTr("Micheal Jackson")
                font.pixelSize: 30
            }
        }

    }
}
