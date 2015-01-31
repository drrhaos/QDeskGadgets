import QtQuick 1.0
import "content"

Rectangle {
    width: 200; height: 200
    color: "#00000000"

    Row {
        anchors.centerIn: parent
        Clock { city: "Санкт-Петербург"; shift: +3 }
    }
}
