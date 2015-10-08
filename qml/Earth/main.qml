import QtQuick 1.1

Rectangle {
    width: 120; height: 120
    color: "#00000000"

    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            getData();
        }
    }

    Image {
        id: img
        x: 0; y: 0
            source: {
                switch (weatherIconId) {
                case "0":
                "0.PNG"
                    break;
                case "1":
                "1.PNG"
                    break;
                default:
                    "0.PNG" //weather-unknown
                }
            }
        smooth: true
    }



    function getData(){
        var weatherIconId = weatherIconId + 1;
        if(weatherIconId > 30)
        {
            weatherIconId = 0;
        }

    }
}
