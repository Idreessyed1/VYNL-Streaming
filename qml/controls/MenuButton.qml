import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0


Button{
    id: menuBtn

    property string menuBtnIcon: ""
    property string menuBtnIconPressed: ""
    property string menuBtnTxt: ""

    //Custom Properties
    property color colorDefault: "#ffffff"
    property color colorMouseOver: "#0092CA"
    property color colorMousePressed: "#0092CA"

    QtObject{
        id: internal

        property var dynamicColor: if(menuBtn.down){
                                       menuBtn.down ? colorMousePressed : colorDefault
                                   }
                                   else{
                                       menuBtn.hovered ? colorMouseOver: colorDefault
                                   }
    }

    height: 60
    font.family: "Arial"
    autoRepeat: false
    leftPadding: 0
    topPadding: 0
    implicitWidth: 200
    implicitHeight: 40

    background: Rectangle{
        color: "#00000000"
    }

    Row {
        id: row
        x: 0
        y: 0
        width: 200
        height: 60

        Item {
            width: row.width
            height: row.height

            Image {
                id: btnImg
                width: 30
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: "../../images/svg_images/" + menuBtnIcon
                anchors.leftMargin: 10
                smooth: true
                fillMode: Image.PreserveAspectFit
            }

            ColorOverlay {
                anchors.fill: btnImg
                source: btnImg
                clip: true
                color: internal.dynamicColor
            }
         }


        FontLoader {
            id: radnika;
            source: "../../fonts/SVN-Foundry Context Medium.ttf"
        }

        Text {
            id: buttonTxt
            color: internal.dynamicColor
            text: menuBtnTxt
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            font.pixelSize: 30
            font.family: radnika.name
            anchors.leftMargin: 80
            font.kerning: true
            font.preferShaping: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}
}
##^##*/
