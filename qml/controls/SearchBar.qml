import QtQuick 2.0
import QtQuick.Controls 2.15




Rectangle{
    id: searchBar
    x: 0
    y: 0
    width: 820
    height: 75
    color: mainColor
    radius: 20

    Keys.onPressed: {
        if (event.key === Qt.Key_Return){
            con.search(search_query.text);
        }
    }

    FontLoader {
        id: radnika;
        source: "../../fonts/Arquitec.ttf"
    }

    Row{
        id: row
        anchors.fill: parent

        TextInput {
            id: search_query
            width: 700
            text: qsTr("Search...")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            font.pixelSize: 30
            anchors.leftMargin: 20
            font.family: foundry.name
            color: secondaryColor
        }

        Button {
            id: searchBtn
            width: 40
            height: 40
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 20
            onClicked: {
                con.search(search_query.text)
            }

            background: {
                color: "#00000000"
            }

            Image {
                id: searchIcon
                anchors.fill: parent
                source: "../../images/svg_images/searchIcon.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
