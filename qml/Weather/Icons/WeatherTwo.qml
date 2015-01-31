import QtQuick 1.1

Item {
    width: 100; height: 100

    property alias dayss: dayLabel.text
    property alias maxTemp: maxTempLabel.text
    property alias minTemp: minTempLabel.text
    property string weatherIconId;

    Text {
        id: dayLabel
        anchors.right: parent.right
        color: "#00d2ff"
        font.bold: true; font.pixelSize: 10
        style: Text.Raised; styleColor: "black"
    }

    Row {
        x:3;y:10;
        Text {
            id: maxTempLabel
            color: "#00d2ff"
            font.bold: true; font.pixelSize: 14
            style: Text.Raised; styleColor: "black"
        }

        Text {
            text: qsTr("°")
            color: "#00d2ff"
            font.bold: true; font.pixelSize: 14
            style: Text.Raised; styleColor: "black"
        }
    }

    Row {
        x:3;y:60;
        Text {
            id: minTempLabel
            color: "#00d2ff"
            font.bold: true; font.pixelSize: 12
            style: Text.Raised; styleColor: "black"
        }

        Text {
            text: qsTr("°")
            color: "#00d2ff"
            font.bold: true; font.pixelSize: 12
            style: Text.Raised; styleColor: "black"
        }
    }

    Image {
        id: img
        x: 0; y: 0;
        width: 100; height: 68;
            source: {
                switch (weatherIconId) {
                case "395":
                "03.png"
                    break;
                case "392":
                "00.png"
                    break;
                case "389":
                "01.png"
                    break;
                case "386":
                "47.png"
                    break;
                case "377":
                "17.png"
                    break;
                case "374":
                "35.png"
                    break;
                case "371":
                "16.png"
                    break;
                case "368":
                "13.png"
                    break;
                case "365":
                "17.png"
                    break;
                case "362":
                "17.png"
                    break;
                case "359":
                "12.png"
                    break;
                case "356":
                "11.png"
                    break;
                case "353":
                "10.png"
                    break;
                case "350":
                "na.png"
                    break;
                case "338":
                "46.png"
                    break;
                case "335":
                "46.png"
                    break;
                case "332":
                "14.png"
                    break;
                case "329":
                "13.png"
                    break;
                case "326":
                "07.png"
                    break;
                case "323":
                "05.png"
                    break;
                case "320":
                "35.png"
                    break;
                case "317":
                "17.png"
                    break;
                case "314":
                "12.png"
                    break;
                case "311":
                "11.png"
                    break;
                case "308":
                "12.png"
                    break;
                case "305":
                "12.png"
                    break;
                case "302":
                "11.png"
                    break;
                case "299":
                "39.png"
                    break;
                case "296":
                "40.png"
                    break;
                case "293":
                "11.png"
                    break;
                case "284":
                "25.png"
                    break;
                case "281":
                "25.png"
                    break;
                case "266":
                "10.png"
                    break;
                case "263":
                "08.png"
                    break;
                case "260":
                "20.png"
                    break;
                case "248":
                "19.png"
                    break;
                case "230":
                "na.png"
                    break;
                case "227":
                "na.png"
                    break;
                case "200":
                "37.png"
                    break;
                case "185":
                "09.png"
                    break;
                case "182":
                "17.png"
                    break;
                case "179":
                "06.png"
                    break;
                case "176":
                "18.png"
                    break;
                case "143":
                "22.png"
                    break;
                case "122":
                "44.png"
                    break;
                case "119":
                "32.png"
                    break;
                case "116":
                "30.png"
                    break;
                case "113":
                "36.png"
                    break;
                default:
                    "na.png" //weather-unknown
                }
            }
        smooth: true
    }
}
