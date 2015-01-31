import QtQuick 1.1

Rectangle {
    width: 600; height: 600
    color: "#00000000"

    AnimatedImage  {
        anchors.centerIn: parent
        id: ironImage
        x: 0; y: 0
        width: 600; height: 600
        source: "ironman.gif"
    }
}
