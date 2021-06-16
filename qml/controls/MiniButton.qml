import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Button {
    id: miniButton

    //Custom Properties
    property int size: 30

    property string regImg: ""
    property string pressedImg: ""

    property color colorDefault: "#0092CA"
    property color colorMouseOver: "#ffffff"
    property color colorMousePressed: "#0092CA"

    QtObject{
        id: internal

        property var dynamicColor: if(miniButton.down){
                                       miniButton.down ? colorMousePressed : colorDefault
                                   }
                                   else{
                                       miniButton.hovered ? colorMouseOver: colorDefault
                                   }
    }



    width: size
    height: size
    background: Rectangle{
        color: "#00000000"
    }

    Item {
        width: size
        height: size
        antialiasing: true

        Image {
            id: btnImg
            anchors.fill: parent
            source: "../../images/svg_images/" + regImg
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay {
            anchors.fill: btnImg
            source: btnImg
            color: internal.dynamicColor
        }
     }

    onClicked: {
//        if(btnImg.source.localeCompare(regImg)){
            btnImg.source = "../../images/svg_images/" + pressedImg;
//            console.log("1")
//        }
//        else{
//            btnImg.source = regImg;
        //            console.log("2")
//            }
        }



}
