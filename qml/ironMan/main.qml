import QtQuick 1.1

Rectangle {
    width: 200; height: 510
    color: "#00000000"

    AnimatedImage  {
        anchors.centerIn: parent
        id: ironImage
        x: 0; y: 0
        width: 200; height: 510
        source: "ironman.gif"
    }
}
