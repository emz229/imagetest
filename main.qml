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

    Item {
        Component {
            id: backgroundImageComponent
            Image {
                id: backgroundImage
                anchors.fill: primaryWindow
                fillMode: Image.PreserveAspectFit
                source: imageLoader.sourceImage
            }
        }

        Loader {
            id: imageLoader
            property string sourceImage: "background.png"
            sourceComponent: backgroundImageComponent
        }
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
            if (imageLoader.sourceImage == "file:img.png") {
                imageLoader.sourceComponent = undefined
            }
            imageLoader.sourceImage = "file:img.png"
            imageLoader.sourceComponent = backgroundImageComponent
        }

//        function onCommandComplete() {
//            instructionText.text = "Output: " + consoleEvent.getStdOutput() +
//                    "<br>Error: " + consoleEvent.getStdError()
//            //instructionText.visible = false
//            backgroundImage.source = "file:img.png"
//        }
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
