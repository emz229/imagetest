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
            font.pointSize: 18
            color: "white"
            text: "Quit"
        }
    }

//    Timer{
//        id: delayedQuit
//        running: true
//        repeat: false
//        interval: 500
//        onTriggered: Qt.quit()
//    }

    Connections {
        target: eventHandler
        onCommandComplete: delayedQuit.stop() //TODO get / display stdOut, setErr strings
    }
}
