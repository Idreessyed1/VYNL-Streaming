import QtQuick 2.0

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0


Button{
    id: titleBarBtn

    property string titleBarBtnIcon: ""
    property string titleBarBtnPressed: ""

    //Custom Properties
    property color colorDefault: "#ffffff"
    property color colorMouseOver: "#0092CA"
    property color colorMousePressed: "#0092CA"

    QtObject{
        id: internal

        property var dynamicColor: if(titleBarBtn.down){
                                       titleBarBtn.down ? colorMousePressed : colorDefault
                                   }
                                   else{
                                       titleBarBtn.hovered ? colorMouseOver: colorDefault
                                   }
    }

    height: 30
    width: 30
    autoRepeat: false
    implicitWidth: 200
    implicitHeight: 40


    background: Rectangle{
        color: "#00000000"
    }

    Item {
        anchors.fill: parent

            Image {
                id: btnImg
                anchors.fill: parent
                source: "../../images/svg_images/" + titleBarBtnIcon
                smooth: true
                fillMode: Image.PreserveAspectFit
            }

            ColorOverlay {
                anchors.fill: btnImg
                source: btnImg
                clip: true
                color: internal.dynamicColor
                antialiasing: false
            }
         }

}


