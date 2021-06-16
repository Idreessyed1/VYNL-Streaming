import QtQuick 2.4
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: playButton

    //Custom Properties
    property int size: 100

    property string regImg: "play_icon.png"
    property string pressedImg: "pause_icon.png"

    property string image1: ""

    property color colorDefault: "#0092CA"
    property color colorMouseOver: "#ffffff"
    property color colorMousePressed: "#0092CA"

    QtObject{
        id: internal

        property var dynamicColor: if(playButton.down){
                                       playButton.down ? colorMousePressed : colorDefault
                                        btnImg.source = "../../images/svg_images/" + image1
                                   }
                                   else{
                                       playButton.hovered ? colorMouseOver: colorDefault
                                   }
    }

    width: size
    height: size
    background: Rectangle{
        color: "#00000000"
    }

    Item {
        anchors.fill: parent
        antialiasing: true

        Image {
            id: btnImg
            anchors.fill: parent
            source: btnImg.source = "../../images/svg_images/" + image1
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay {
            id: colorOverlay
            anchors.fill: btnImg
            source: btnImg
            color: internal.dynamicColor
        }
    }
}





