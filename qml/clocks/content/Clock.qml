import QtQuick 1.0

Item {
    id: clock
    width: 200; height: 200

    property alias city: cityLabel.text
    property int hours
    property int minutes
    property int seconds 
    property real shift
    property string stringSec
    property string stringMin
    property string stringHour

    function timeChanged() {
        var date = new Date;
        hours = shift ? date.getUTCHours() + Math.floor(clock.shift) : date.getHours()
        if(hours >= 24)
        {
            hours = hours - 24;
        }

        minutes = shift ? date.getUTCMinutes() + ((clock.shift % 1) * 60) : date.getMinutes()
        seconds = date.getUTCSeconds();

        if(seconds.toString().length == 1)
        {
            stringSec = "0" + seconds.toString();
        }else{
            stringSec = seconds.toString();
        }

        if(minutes.toString().length == 1)
        {
            stringMin = "0" + minutes.toString();
        }else{
            stringMin = minutes.toString();
        }

        if(hours.toString().length == 1)
        {
            stringHour = "0" + hours.toString();
        }else{
            stringHour = hours.toString();
        }

        timeLabel.text = stringHour + ":" + stringMin + ":" + stringSec;
    }

    Timer {
        interval: 1000; running: true; repeat: true;
        onTriggered: clock.timeChanged()
    }

    Image {
        id: background;
        anchors.verticalCenter: parent.verticalCenter; anchors.horizontalCenter: parent.horizontalCenter
        width: 100; height: 82;
        source: "StarkExpo.png";
    }

    Image {
        x: 0; y: 0
        source: "hour.png"
        smooth: true
        transform: Rotation {
            id: hourRotation
            origin.x: 100; origin.y: 100;
            angle: (clock.hours * 30) + (clock.minutes * 0.5)
//            Behavior on angle {
//                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
//            }
        }
    }

    Image {
        x: 0; y: 0
        source: "minute.png"
        smooth: true
        transform: Rotation {
            id: minuteRotation
            origin.x: 100; origin.y: 100;
            angle: clock.minutes * 6
//            Behavior on angle {
//                SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
//            }
        }
    }

    Image {
        x: 0; y: 0
        source: "second.png"
        smooth: true
        transform: Rotation {
            id: secondRotation
            origin.x: 100; origin.y: 100;
            angle: clock.seconds * 6
//            Behavior on angle {
//                SpringAnimation { spring: 1; damping: 0.2; modulus: 360 }
//            }
        }
    }

    Text {
        id: cityLabel
        y: 130; anchors.horizontalCenter: parent.horizontalCenter
        color: "#00d2ff"
        font.bold: true; font.pixelSize: 12
        style: Text.Raised; styleColor: "black"
    }

    Text {
        id: timeLabel
        y:35; anchors.horizontalCenter: parent.horizontalCenter
        color: "#00d2ff"
        font.bold: true; font.pixelSize: 14
        style: Text.Raised; styleColor: "black"
    }
}
