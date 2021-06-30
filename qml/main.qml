import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "controls"
import QtGraphicalEffects 1.0

Window {
    id: mainWindow

    property color mainColor: "#fbfbfb"//"#121212" //"#13181B"
    property color secondaryColor: "#4e4e4c"//"#171616"
    property color thirdColor: "#a1a1a1"

    width: 2200
    height: 1250
    visible: true
    color: "#00000000"
    title: qsTr("VYNL")

    //Removing title bar
    flags: {
        Qt.Window | Qt.FramelessWindowHint;
        Qt.Window | Qt.MSWindowsFixedSizeDialogHint;
    }

    Rectangle {
        id: mainBackground
        x: 0
        y: 0
        color: "#00000000"
        border.color: "#383e4c"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10

        Rectangle {
            id: appContainer
            anchors.fill: parent
            color: mainColor
            radius: 20
            
            FontLoader {
                id: radnika;
                source: "../fonts/radnika-medium-webfont.ttf"
            }

            FontLoader {
                id: proximaNovaBold
                source: "../fonts/ProximaNova-Black.ttf"
            }

            FontLoader {
                id: foundry
                source: "../fonts/SVN-Foundry Context Medium.ttf"
            }

            Rectangle {
                id: leftContentPanel
                width: 600
                height: 1230
                color: "#00000000"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Row {
                    id: logoRow
                    width: 340
                    height: 100
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 95
                    anchors.topMargin: 95

                    Text {
                        id: titleTxt
                        width: 250
                        height: 100
                        color: secondaryColor
                        text: qsTr("VYNL")
                        elide: Text.ElideNone
                        font.pixelSize: 90
                        font.weight: Font.Normal
                        font.capitalization: Font.AllUppercase
                        font.family: proximaNovaBold.name
                        fontSizeMode: Text.FixedSize
                    }

                    Item{
                        width: logoRow.width
                        height: logoRow.height

                        Image {
                            id: vynlImg
                            width: 60
                            height: 60
                            anchors.bottom: parent.bottom
                            source: "../images/svg_images/record.png"
                            anchors.bottomMargin: 15
                            fillMode: Image.PreserveAspectFit

                        }

                        ColorOverlay {
                            anchors.fill: vynlImg
                            source: vynlImg
                            clip: true
                            color: secondaryColor
                        }
                    }
                }

                Row {
                    id: greetRow
                    x: 95
                    y: 300
                    width: 300
                    height: 100

                    Image {
                        id: profileImg
                        width: 70
                        height: 70
                        anchors.verticalCenter: parent.verticalCenter
                        source: "../images/svg_images/userIcon.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Column {
                        id: greetingColumn
                        width: 200
                        height: 100
                        leftPadding: 25

                        Text {
                            id: nameTxt
                            color: secondaryColor
                            text: qsTr("Welcome")
                            font.pixelSize: 40
                            font.family: foundry.name
                        }

                        Text {
                            id: userNameTxt
                            color: secondaryColor
                            text: qsTr("Idrees")
                            font.pixelSize: 35
                            font.family: foundry.name
                        }
                    }
                }

                Column {
                    id: exploreColumn
                    x: 95
                    y: 450
                    width: 350
                    height: 370

                    Text {
                        id: exploreTxt
                        color: secondaryColor
                        text: "Explore Music"
                        font.pixelSize: 35
                        font.capitalization: Font.MixedCase
                        fontSizeMode: Text.FixedSize
                        font.family: foundry.name
                        bottomPadding: 10
                    }

                    MenuButton{
                        id: homeBtn
                        menuBtnTxt: "Home"
                        menuBtnIcon: "home_icon.svg"
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        onClicked: {
                            searchPageLoader.visible = true
                            trendingPageLoader.visible = false
                            favoritesPageLoader.visible = false
                            middleContentPanelAnimation.running = true
                            mediaPlayerAnimation.running = true
                            playerTxtAnimation.running = true
                        }
                    }

                    MenuButton{
                        id: playerBtn
                        menuBtnTxt: "Player"
                        menuBtnIcon: "musicIcon1.png"
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        onClicked: {
                            middleContentPanelAnimation.running = true
                            mediaPlayerAnimation.running = true
                            playerTxtAnimation.running = true
                            //queueRowAnimation.running = true
                            //queueTxtSlideAnimation.running = true
                            //queueTxtFontAnimation.running = true
                            //mediaPlayerHeightAnimation.running = true
                            //mediaPlayerWidthAnimation.running = true

                        }
                    }

                    MenuButton{
                        id: searchBtn
                        menuBtnTxt: "Search"
                        menuBtnIcon: "searchIcon.png"
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        onClicked: {
                            searchPageLoader.visible = true
                            trendingPageLoader.visible = false
                            favoritesPageLoader.visible = false
                            middleContentPanelAnimation.running = true
                            mediaPlayerAnimation.running = true
                            playerTxtAnimation.running = true
                            //queueRowAnimation.running = true
                           // queueTxtSlideAnimation.running = true
                            //queueTxtFontAnimation.running = true
                        }
                    }

                    MenuButton{
                        id: trendingBtn
                        menuBtnTxt: "Trending"
                        menuBtnIcon: "fire_icon.png"
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        onClicked: {
                            searchPageLoader.visible = false
                            trendingPageLoader.visible = true
                            favoritesPageLoader.visible = false
                            middleContentPanelAnimation.running = true
                            mediaPlayerAnimation.running = true
                            playerTxtAnimation.running = true
                            //queueRowAnimation.running = true
                            //queueTxtSlideAnimation.running = true
                            //queueTxtFontAnimation.running = true
                        }
                    }

                    MenuButton{
                        id: favoritesBtn
                        menuBtnTxt: "Favorites"
                        menuBtnIcon: "star_icon.png"
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        onClicked: {
                            con.get_favorites()
                            searchPageLoader.visible = false
                            trendingPageLoader.visible = false
                            favoritesPageLoader.visible = true
                            middleContentPanelAnimation.running = true
                            mediaPlayerAnimation.running = true
                            playerTxtAnimation.running = true
                            //queueRowAnimation.running = true
                            //queueTxtSlideAnimation.running = true
                            //queueTxtFontAnimation.running = true
                        }

                    }
                }


                Column {
                    id: accountColumn
                    x: 95
                    y: 870
                    width: 350
                    height: 200

                    Text {
                        id: accountTxt
                        color: secondaryColor
                        text: qsTr("My Account")
                        font.pixelSize: 35
                        font.capitalization: Font.MixedCase
                        bottomPadding: 10
                        font.family: radnika.name
                    }

                    MenuButton {
                        id: accountBtn
                        menuBtnTxt: "Account"
                        menuBtnIcon: "userIcon.png"
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                    }

                    MenuButton {
                        id: settingsBtn
                        menuBtnTxt: "Settings"
                        menuBtnIcon: "settingsIcon.png"
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                    }

                }
            }

            Rectangle {
                id: rightContentPanel
                x: 650
                width: 1550
                height: 1230
                color: "#00000000"
                radius: 20
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                clip: false
                anchors.topMargin: 0

                Text {
                    id: playerTxt
                    x: 100
                    y: 100
                    width: 472
                    height: 72
                    color: secondaryColor
                    text: qsTr("NOW PLAYING...")
                    elide: Text.ElideNone
                    font.pixelSize: 60
                    font.capitalization: Font.AllUppercase
                    font.family: proximaNovaBold.name
                    fontSizeMode: Text.FixedSize

                    PropertyAnimation{
                        id: playerTxtAnimation
                        target: playerTxt
                        property: "x"
                        to: if(playerTxt.x == 1000) return 100; else return 1000;
                        duration: 1000
                        easing.type: Easing.InOutQuint
                    }

                }

                Column {
                    id: mediaPlayerColumn
                    x: 100
                    y: 220
                    width: 500
                    height: 750

                    PropertyAnimation{
                        id: mediaPlayerAnimation
                        target: mediaPlayerColumn
                        property: "x"
                        to: if(mediaPlayerColumn.x == 1000) return 100; else return 1000;
                        duration: 1000
                        easing.type: Easing.InOutQuint
                    }

                    PropertyAnimation{
                        id: mediaPlayerHeightAnimation
                        target: mediaPlayerColumn
                        property: "height"
                        to: if(mediaPlayerColumn.height == 800) return 750; else return 800;
                        duration: 1000
                        easing.type: Easing.InOutQuint
                    }

                    PropertyAnimation{
                        id: mediaPlayerWidthAnimation
                        target: mediaPlayerColumn
                        property: "width"
                        to: if(mediaPlayerColumn.x == 550) return 500; else return 550;
                        duration: 1000
                        easing.type: Easing.InOutQuint
                    }

                    Image {
                        id: albumImg
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/default_album.jpg" //"https://i.ytimg.com/vi/WlTlUseVt7E/maxresdefault.jpg"
                        anchors.bottomMargin: 250
                        anchors.topMargin: 0
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        fillMode: Image.PreserveAspectCrop

                        property bool rounded: true
                        property bool adapt: true

                        layer.enabled: rounded
                        layer.effect: OpacityMask {
                           maskSource: Item {
                               width: albumImg.width
                               height: albumImg.height
                               Rectangle {
                                   anchors.centerIn: parent
                                   width: albumImg.adapt ? albumImg.width : Math.min(albumImg.width, albumImg.height)
                                   height: albumImg.adapt ? albumImg.height : width
                                   radius: 250
                               }
                           }
                        }

                    }

                    Text {
                        id: trackTxt
                        width: 490
                        color: secondaryColor
                        text: qsTr("VYNL")
                        elide: Text.ElideRight
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: albumImg.bottom
                        font.family: foundry.name
                        font.pixelSize: 35
                        horizontalAlignment: Text.AlignHCenter
                        wrapMode: Text.NoWrap
                        font.bold: false
                        fontSizeMode: Text.FixedSize
                        anchors.topMargin: 50
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10
                        font.capitalization: Font.AllUppercase
                        topPadding: 3

                    }

                    Text {
                        id: artistTxt
                        width: 480
                        color: secondaryColor
                        text: qsTr("VYNL")
                        elide: Text.ElideRight
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: trackTxt.bottom
                        font.family: foundry.name
                        font.pixelSize: 25
                        horizontalAlignment: Text.AlignHCenter
                        anchors.topMargin: 10
                        anchors.rightMargin: 15
                        anchors.leftMargin: 15
                        bottomPadding: 5
                    }

//                    Column {
//                        id: progressRow
//                        height: 100
//                        anchors.left: parent.left
//                        anchors.right: parent.right
//                        anchors.top: artistTxt.bottom
//                        anchors.bottom: controlRow.top
//                        anchors.rightMargin: 0
//                        anchors.leftMargin: 0
//                        anchors.bottomMargin: 0
//                        anchors.topMargin: 0


//                        Slider{
//                            // Add style
//                            id: progressBar
//                            anchors.left: parent.left
//                            anchors.right: parent.right
//                            anchors.top: parent.top
//                            anchors.topMargin: 0
//                            anchors.leftMargin: 0
//                            anchors.rightMargin: 0
//                            value: .5
//                            topPadding: 0
//                            bottomPadding: 0

//                            onMoved: {
//                                con.seek(progressBar.value)
//                            }
//                        }

                        Row {
                            id: timeRow
                            width: 130
                            height: 30
                            anchors.top: artistTxt.bottom
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.topMargin: 10

                            Text {
                                id: currTimeTxt
                                text: qsTr("0:00")
                                color: secondaryColor
                                anchors.left: parent.left
                                font.pixelSize: 25
                                anchors.leftMargin: 0
                                font.family: foundry.name

                            }

                            Text {
                                id: divideTimeTxt
                                text: qsTr("|")
                                color: secondaryColor
                                font.pixelSize: 25
                                horizontalAlignment: Text.AlignHCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: foundry.name

                            }

                            Text {
                                id: runTimeTxt
                                text: qsTr("0:00")
                                color: secondaryColor
                                anchors.right: parent.right
                                font.pixelSize: 25
                                anchors.rightMargin: 0
                                font.family: foundry.name

                            }
                        }
                   // }

                    Row {
                        id: controlRow
                        y: 670
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: -20

                        MiniButton {
                            id: repeatBtn
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: prevBtn.left
                            anchors.rightMargin: 20
                            antialiasing: false
                            highlighted: false
                            size: 40
                            regImg: "repeat_icon.png"
                            pressedImg: "repeat_icon.png"
                            colorDefault: secondaryColor
                            colorMouseOver: thirdColor
                            colorMousePressed: thirdColor
                            onClicked: con.prev_stream()
                        }

                        MiniButton {
                            id: prevBtn
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: playBtn.left
                            anchors.rightMargin: 0
                            antialiasing: false
                            highlighted: false
                            size: 100
                            regImg: "prev_icon.png"
                            pressedImg: "prev_icon.png"
                            colorDefault: secondaryColor
                            colorMouseOver: thirdColor
                            colorMousePressed: thirdColor
                            onClicked: con.prev_stream()
                        }

                        PlayButton {

                            id: playBtn
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            antialiasing: false
                            colorDefault: secondaryColor
                            colorMouseOver: thirdColor
                            colorMousePressed: thirdColor
                            image1: "pause_icon.png"
                            onClicked: { con.pause_stream()}
                        }

                        MiniButton {
                            id: nextBtn
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: playBtn.right
                            anchors.leftMargin: 0
                            antialiasing: false
                            highlighted: false
                            size: 100
                            regImg: "next_icon.png"
                            pressedImg: "next_icon.png"
                            colorDefault: secondaryColor
                            colorMouseOver: thirdColor
                            colorMousePressed: thirdColor
                            onClicked: con.next_stream()
                        }

                        MiniButton {
                            id: shuffleBtn
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: nextBtn.right
                            anchors.leftMargin: 15
                            antialiasing: false
                            highlighted: false
                            size: 60
                            regImg: "shuffle_icon.png"
                            pressedImg: "shuffle_icon.png"
                            colorDefault: secondaryColor
                            colorMouseOver: thirdColor
                            colorMousePressed: thirdColor
                            onClicked: con.prev_stream()
                        }

                    }

                    CircularSlider {
                        id: circularSlider
                        x: -25
                        y: -25
                        width: 550
                        height: 550
                        startAngle: 0
                        endAngle: 360
                        hideTrack: true
                        rotation: 180
                        trackColor: thirdColor// "#db4141"//"#00000000"
                        progressColor: secondaryColor
                        trackWidth: 10
                        progressWidth: 10
                        handleWidth: 12

//                        pressed: {
//                            con.seek(circularSlider.value)
//                        }

                    }
                }

                Text {
                    id: queueTxt
                    x: 900//1000
                    y: 100
                    width: 265
                    height: 80

                    color: secondaryColor
                    text: qsTr("UP NEXT")
                    elide: Text.ElideNone
                    font.pixelSize: 60
                    lineHeightMode: Text.ProportionalHeight
                    textFormat: Text.AutoText
                    font.capitalization: Font.AllUppercase
                    font.family: proximaNovaBold.name
                    fontSizeMode: Text.FixedSize

                    NumberAnimation {
                            id: queueTxtFadeOut
                            target: queueTxt
                            property: "opacity"
                            duration: 500
                            from: 1
                            to: 0
                    }

                    NumberAnimation {
                            id: queueTxtFadeIn
                            target: queueTxt
                            property: "opacity"
                            duration: 500
                            from: 0
                            to: 1
                    }
                }

                ListView {
                    id: queueListView
                    x: 900
                    y: 210
                    width: 600
                    height: 970
                    boundsBehavior: Flickable.StopAtBounds
                    clip: true
                    spacing: 20
                    snapMode: ListView.SnapToItem
                    maximumFlickVelocity: 10000
                    cacheBuffer:1000

                    model: queueListModel

                    NumberAnimation {
                            id: listViewFadeOut
                            target: queueListView
                            property: "opacity"
                            duration: 500
                            from: 1
                            to: 0
                    }

                    NumberAnimation {
                            id: listViewFadeIn
                            target: queueListView
                            property: "opacity"
                            duration: 500
                            from: 0
                            to: 1
                    }

                    ScrollBar.vertical: ScrollBar {
                                    id: verticalScrollBar
                                    orientation: Qt.Vertical
                                    opacity: active ? 1:0
                                    Behavior on opacity {NumberAnimation {duration: 500}}
                                    contentItem: Rectangle {
                                        implicitWidth: 4
                                        radius:2
                                        implicitHeight: parent.height
                                        color: accentColor
                                    }
                                }

                    delegate: Rectangle{
                        id: queueRect2
                        property var queueId: trackId
                        property bool currentTrack: trackStatus
                        width: 600
                        height: 120
                        color: mainColor
                        border.width: 0//5
                        radius: 20

                        MouseArea{
                            id: queueMA
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.rightMargin: 60
                            onClicked: con.play_selected(index)
                        }

//                        states: [ "mouseIn", "mouseOut" ]
//                        state: "mouseOut"

//                        transitions: [
//                            Transition {
//                                from: "*"
//                                to: "mouseIn"
//                                NumberAnimation {
//                                    target: queueRect2
//                                    properties: "scale"
//                                    from: 0.95
//                                    to: 1
//                                    duration: 400
//                                    easing.type: Easing.amplitude
//                                }
//                            }
//                        ]

//                        MouseArea{
//                                id: im1MouseArea
//                                hoverEnabled: true
//                                anchors.fill: parent

//                                onContainsMouseChanged: {
//                                    queueRect2.state = containsMouse ? "mouseIn" : "mouseOut"
//                                }
//                            }

                        Row {
                            id: queueRow2
                            anchors.fill: parent

                            Image {
                                id: queueImg2
                                width: 100
                                height: 100
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                source: queueImg
                                anchors.leftMargin: 10
                                fillMode: Image.PreserveAspectCrop

                                property bool rounded: true
                                property bool adapt: true

                                layer.enabled: rounded
                                layer.effect: OpacityMask {
                                    maskSource: Item {
                                        width: queueImg2.width
                                        height: queueImg2.height
                                        Rectangle {
                                            anchors.centerIn: parent
                                            width: queueImg2.adapt ? queueImg2.width : Math.min(queueImg2.width, queueImg2.height)
                                            height: queueImg2.adapt ? queueImg2.height : width
                                            radius: 50
                                        }
                                    }
                                }
                            }

                            Column {
                                id: column2
                                width: 300
                                height: 80
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: queueImg2.right
                                anchors.rightMargin: 15
                                anchors.leftMargin: 15

                                Text {
                                    id: songQueTxt2
                                    width: 300
                                    height: 40
                                    text: track
                                    elide: Text.ElideRight
                                    anchors.left: parent.left
                                    font.pixelSize: 30
                                    horizontalAlignment: Text.AlignLeft
                                    anchors.leftMargin: 0
                                    font.styleName: "Bold"
                                    font.weight: Font.Thin
                                    font.family: foundry.name
                                    color: secondaryColor
                                }

                                Text {
                                    id: artistQueText2
                                    width: 300
                                    height: 40
                                    text: artist
                                    elide: Text.ElideRight
                                    anchors.left: parent.left
                                    font.pixelSize: 25
                                    horizontalAlignment: Text.AlignLeft
                                    anchors.leftMargin: 0
                                    font.family: foundry.name
                                    color: secondaryColor
                                }
                            }

                                Text {
                                    id: queueRunTimeTxt
                                    width: 50
                                    text: runtime
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: column2.right
                                    anchors.right: queueFavImg.left
                                    verticalAlignment: Text.AlignVCenter
                                    anchors.leftMargin: 40
                                    font.pixelSize: 30
                                    color: secondaryColor
                                    anchors.rightMargin: 20
                                    font.family: foundry.name
                                }

                                MiniButton {
                                    id: queueRemoveBtn
                                    size: 35
                                    regImg: "minimize_icon.png"
                                    pressedImg: "minimize_icon.png"
                                    colorDefault: secondaryColor
                                    colorMouseOver: mainColor
                                    colorMousePressed: mainColor
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.right: parent.right
                                    anchors.rightMargin: 15
                                    onClicked: {
                                        con.remove_queue(index)
                                        queueListView.model.remove(index)

                                    }

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
                    id: queueListModel
//                    ListElement{
//                        queueImg: "../images/thriller.jpg"
//                        track: "Dressed for Success"
//                        artist: "Michael Jackson"
//                        runtime: "1:30"
//                    }
                }

                Text {
                    id: upNextTxt
                    x: 1000
                    y: 1020
                    width: 226
                    height: 52
                    color: secondaryColor
                    text: qsTr("NEXT")
                    elide: Text.ElideNone
                    font.pixelSize: 40
                    font.capitalization: Font.AllUppercase
                    font.family: proximaNovaBold.name
                    fontSizeMode: Text.VerticalFit
                    visible: false

                    NumberAnimation {
                            id: upNextTxtFadeOut
                            target: queueTxt
                            property: "opacity"
                            duration: 500
                            from: 1
                            to: 0
                    }

                    NumberAnimation {
                            id: upNextTxtFadeIn
                            target: queueTxt
                            property: "opacity"
                            duration: 500
                            from: 0
                            to: 1
                    }

                }

                Rectangle{
                    id: upNextRect
                    x: 1000
                    y: 1080
                    property var queueId: trackId
                    property bool currentTrack: trackStatus
                    width: 500
                    height: 120
                    color: mainColor
                    border.width: 0//5
                    radius: 20
                    visible: false

                    NumberAnimation {
                            id: upNextRectFadeOut
                            target: queueTxt
                            property: "opacity"
                            duration: 500
                            from: 1
                            to: 0
                    }

                    NumberAnimation {
                            id: upNextRectFadeIn
                            target: queueTxt
                            property: "opacity"
                            duration: 500
                            from: 0
                            to: 1
                    }

                    Row {
                        id: upNextRow
                        anchors.fill: parent

                        Image {
                            id: upNextImg
                            width: 100
                            height: 100
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            source: "../images/default_album.jpg"
                            anchors.leftMargin: 10
                            fillMode: Image.PreserveAspectCrop

                            property bool rounded: true
                            property bool adapt: true

                            layer.enabled: rounded
                            layer.effect: OpacityMask {
                                maskSource: Item {
                                    width: upNextImg.width
                                    height: upNextImg.height
                                    Rectangle {
                                        anchors.centerIn: parent
                                        width: upNextImg.adapt ? upNextImg.width : Math.min(upNextImg.width, upNextImg.height)
                                        height: upNextImg.adapt ? upNextImg.height : width
                                        radius: 50
                                    }
                                }
                            }
                        }

                        Column {
                            id: upNextCol
                            width: 300
                            height: 80
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: upNextImg.right
                            anchors.rightMargin: 15
                            anchors.leftMargin: 15

                            Text {
                                id: upNextTrackTxt
                                width: 300
                                height: 40
                                elide: Text.ElideRight
                                anchors.left: parent.left
                                font.pixelSize: 30
                                horizontalAlignment: Text.AlignLeft
                                anchors.leftMargin: 0
                                font.styleName: "Bold"
                                font.weight: Font.Thin
                                font.family: foundry.name
                                color: secondaryColor
                                text: "#track#"
                            }

                            Text {
                                id: upNextArtistText
                                width: 300
                                height: 40
                                elide: Text.ElideRight
                                anchors.left: parent.left
                                font.pixelSize: 25
                                horizontalAlignment: Text.AlignLeft
                                anchors.leftMargin: 0
                                font.family: foundry.name
                                color: secondaryColor
                                text: "#artist#"
                            }
                        }
                    }

                }

                Text {
                    id: controlsTxt
                    x: 100
                    y: 1045
                    width: 269
                    height: 60
                    color: secondaryColor
                    text: qsTr("Controls")
                    elide: Text.ElideNone
                    font.pixelSize: 45
                    font.capitalization: Font.AllUppercase
                    font.family: proximaNovaBold.name
                    fontSizeMode: Text.VerticalFit

                    NumberAnimation {
                            id: controlsTxtFadeOut
                            target: queueTxt
                            property: "opacity"
                            duration: 500
                            from: 1
                            to: 0
                    }

                    NumberAnimation {
                            id: controlsTxtFadeIn
                            target: queueTxt
                            property: "opacity"
                            duration: 500
                            from: 0
                            to: 1
                    }

                }

                Column {
                    id: controlColumn
                    x: 100
                    y: 1095
                    width: 500
                    height: 72

                    MiniButton {
                        id: controlFavBtn
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        regImg: "star_icon.png"
                        pressedImg: "star_icon_pressed.png"
                        size: 40
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        //onClicked: con.f
                    }

                    MiniButton {
                        id: controlPlaylistBtn
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: controlFavBtn.right
                        anchors.leftMargin: 40
                        regImg: "playlist_icon.svg"
                        pressedImg: "playlist_icon.svg"
                        size: 40
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        //onClicked: con.f
                    }

                    MiniButton {
                        id: controlDownloadBtn
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: controlPlaylistBtn.right
                        anchors.leftMargin: 40
                        regImg: "downloadIcon.png"
                        pressedImg: "downloadIcon.png"
                        size: 40
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        //onClicked: con.f
                    }

                    MiniButton {
                        id: controlQueueBtn
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: controlDownloadBtn.right
                        anchors.leftMargin: 40
                        regImg: "queue_icon.svg"
                        pressedImg: "queue_icon.svg"
                        size: 40
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        //onClicked: con.f
                    }

                    MiniButton {
                        id: controlLyricsBtn
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: controlQueueBtn.right
                        anchors.leftMargin: 40
                        regImg: "lyrics_icon.svg"
                        pressedImg: "lyrics_icon.svg"
                        size: 40
                        colorDefault: secondaryColor
                        colorMouseOver: thirdColor
                        colorMousePressed: thirdColor
                        //onClicked: con.f
                    }

                }



            }

            Rectangle {
                // ADD TIME TO SEARCH RESULTS
                id: middleContentPanel
                x: 600
                width: 50
                color: thirdColor
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 600
                clip: true
                anchors.topMargin: 0
                anchors.bottomMargin: 0

                Loader{
                    id: searchPageLoader
                    anchors.fill: parent
                    source: Qt.resolvedUrl("pages/SearchPage.qml")
                    visible: true
                }

                Loader{
                    id: trendingPageLoader
                    anchors.fill: parent
                    source: Qt.resolvedUrl("pages/TrendingPage.qml")
                    visible: false
                }

                Loader{
                    id: favoritesPageLoader
                    anchors.fill: parent
                    source: Qt.resolvedUrl("pages/FavoritesPage.qml")
                    visible: false

                }

                PropertyAnimation{
                    id: middleContentPanelAnimation
                    target: middleContentPanel
                    property: "width"
                    to: {
                        if(middleContentPanel.width == 50){
                            listViewFadeIn.running = true;
                            queueTxtFadeIn.running = true;
                            controlsTxtFadeIn.running = true;
                            //upNextTxtFadeOut.running = true;
                            //upNextRectFadeOut.running = true;
                            queueListView.visible = true;
                            queueTxt.visible = true;
                            controlsTxt.visible = true;
                            upNextTxt.visible = false;
                            upNextRect.visible = false;
                            return 980;
                        }

                        else{
                            upNextTxt.visible = true;
                            upNextRect.visible = true;
                            listViewFadeOut.running = true;
                            queueTxtFadeOut.running = true;
                            controlsTxtFadeOut.running = true;
                            //upNextTxtFadeIn.running = true;
                            //upNextRectFadeIn.running = true;
                            queueListView.visible = false;
                            queueTxt.visible = false;
                            controlsTxt.visible = false;
                            return 50;
                        }
                    }
                    duration: 1000
                    easing.type: Easing.InOutQuint
                }
            }
            
            Row {
                id: row
                width: 110
                height: 30
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.rightMargin: 20
                spacing: 10

                TittleBarButtons {
                    id: minimizeBtn
                    anchors.verticalCenter: parent.verticalCenter
                    titleBarBtnIcon: "minimize_icon.png"
                    colorDefault: secondaryColor
                    colorMouseOver: thirdColor
                    colorMousePressed: thirdColor

                }

                TittleBarButtons {
                    id: maximizeBtn
                    anchors.verticalCenter: parent.verticalCenter
                    titleBarBtnIcon: "maximize_icon.png"
                    colorDefault: secondaryColor
                    colorMouseOver: thirdColor
                    colorMousePressed: thirdColor
                }

                TittleBarButtons {
                    id: closeBtn
                    anchors.verticalCenter: parent.verticalCenter
                    titleBarBtnIcon: "close_icon.png"
                    colorDefault: secondaryColor
                    colorMouseOver: thirdColor
                    colorMousePressed: thirdColor
                }
                

            }
        }
    }

    Connections{
        target: con

        function onSearchResult(index, thumb, title){
            //listModel.append({index: index, name: title, thumb: thumb})

        }

        function onUpdateQueue(albumArt, track, artist, time){
            queueListModel.append({queueImg: albumArt, track: track, artist: artist, runtime: time});
        }

        function onSetPlayer(albumArt, track, artist, length, color1, color2, color3, upNextTrack, upNextArtist, upNextArt){
            albumImg.source = albumArt;
            trackTxt.text = track;
            artistTxt.text = artist;
            runTimeTxt.text = length;
            mainColor = color1;
            secondaryColor = color2;
            thirdColor = color3;
            upNextTrackTxt.text = upNextTrack;
            upNextArtistText.text = upNextArtist;
            upNextImg.source = upNextArt;
        }

        function onSetProgress(time, precentage){
            currTimeTxt.text = time;
            //progressBar.value = precentage;
            circularSlider.value = precentage;
        }

        function onClearSearch(){
            //listModel.clear();
        }

        function onUpDatePlayImg(imgPath){
            playBtn.image1 = imgPath;
        }

        function onSetFavorites(yt_id, track, artist, album_art){
            //listModel.append({index: yt_id, name: track, thumb: album_art});
        }

        function onClearFavorites(){
            //listModel.clear();
        }

    }
}






/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:41}
}
##^##*/
