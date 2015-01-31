import QtQuick 1.1
import "Icons"

Rectangle {
    width: 300; height: 200
    color: "#00000000"

    Row {
        anchors.centerIn: parent
        Weather {
            city: "Недоступно"
            sky: "Недоступна"
            maxTemp: "33"
            curTemp: "-0"
            minTemp: "-33"
            weatherIconId: ""
        }
    }
}
