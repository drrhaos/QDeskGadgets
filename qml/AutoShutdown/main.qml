import QtQuick 1.0
import "content"

Rectangle {
    width: 200; height: 100
    color: "#00000000"

    Row {
        anchors.centerIn: parent
        Panel { m_time: "00:00:00"; }
    }
}
