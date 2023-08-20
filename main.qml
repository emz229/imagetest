import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: primaryWindow
    color: "black"
    visible: true
    Component.onCompleted: {
        console.log("Display height:", Screen.height);
        console.log("Display width:", Screen.width);
    }

    Image {
        id: backgroundImage
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        cache: false
        source: "background.png"
    }

    Text {
        id: thoughtText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        font.pointSize: 18
        color: "white"
        text: "Hmmm where is my background image..."
    }

    Text {
        id: instructionText
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 16
        textFormat: Text.RichText
        color: "white"
        text: "<u>Instructions:</u><br>
           Goto: imagetest.local in a browser<br>
           Upload: a png file no larger than 2M<br>
           Expects: image to be 800x480 pixels"
    }

    Timer{
        id: checkforNewImage
        running: true
        repeat: true
        interval: 5000
        onTriggered: consoleEvent.checkForNewFile()
    }

    Connections {
        target: consoleEvent
        function onNewImageReady () {
            thoughtText.visible = false
            if (backgroundImage.source == "file:img.png") {
                backgroundImage.source = "background.png"
            }
            backgroundImage.source = "file:img.png"
        }
    }

    /* I MUST BE THE LAST ITEM SO IM ALWAYS VISIBLE!! */
    Rectangle {
        id: quitButton
        width: Screen.width / 16
        height: Screen.height / 9.6
        anchors.right: parent.right
        anchors.top: parent.top
        opacity: 0.50
        color: "blue"

        Text {
            id: quitButtonText
            anchors.centerIn: parent
            font.pointSize: 16
            color: "white"
            text: "Quit"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Qt.quit()
        }
    }
}
