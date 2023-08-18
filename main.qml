import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    Component.onCompleted: {
        console.log("Display height:", Screen.height);
        console.log("Display width:", Screen.width);
    }

    Timer{
        id: delayedQuit
        running: true
        repeat: false
        interval: 500
        onTriggered: Qt.quit()
    }
}
