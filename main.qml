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
        source: "background.png"
    }

    Text {
        id: instructionText
        anchors.left: parent.left
        anchors.leftMargin: 10
        font.pointSize: 16
        textFormat: Text.RichText
        color: "white"
        text: "<u>Instructions:</u><br>
           Goto: imagetest.local in a browser<br>
           Upload: a png file no larger than 10M<br>
           Expects: image to be 800x480 pixels"
    }

//    Timer{
//        id: delayedQuit
//        running: true
//        repeat: false
//        interval: 500
//        onTriggered: Qt.quit()
//    }

    Connections {
        target: consoleEvent
        function onCommandComplete() {
            delayedQuit.stop() //TODO get / display stdOut, setErr strings
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
