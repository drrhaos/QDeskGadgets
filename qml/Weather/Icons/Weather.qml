import QtQuick 1.1

Item {
    id: weather
    width: 300; height: 200

    property alias city: cityLabel.text //параметр для отображения города
    property alias sky: skyLabel.text
    property alias maxTemp: maxTempLabel.text
    property alias curTemp: curTempLabel.text
    property alias minTemp: minTempLabel.text
    property string weatherIconId: "01d"
    property string cityParam //параметр для поиска города
    property string keyParam //параметр для поиска города


    //таймер запускающий обновление погоды один раз
    Timer {
        interval: 5000
        running: true
        repeat: false
        onTriggered: {
            readSettings();
        }
    }

    //таймер запускающий обновление погоды один раз
    Timer {
        interval: 10000
        running: true
        repeat: false
        onTriggered: {
            getData();
        }
    }
	    //таймер запускающий обновление погоды один раз
    Timer {
        interval: 15000
        running: true
        repeat: false
        onTriggered: {
            getData();
        }
    }
	
	    //таймер запускающий обновление погоды один раз
    Timer {
        interval: 20000
        running: true
        repeat: false
        onTriggered: {
            getData();
        }
    }

    //таймер запускающий обновление погоды каждый час
    Timer {
        interval: 3600000
        running: true
        repeat: true
        onTriggered: {
            getData();
        }
    }


    //отображение текущего состояния погоды изображением
    Image {
        id: img
        x: 0; y: 0
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

    BorderImage {
        id: up
        property bool on: false
        signal clicked
        x: 0
        y: 0
        height: 25
        width: 25
        source: "update.png"
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                getData();
                up.on = true
            }

        }

        states: State {
            name: "pressed"; when: mouseArea.pressed == true
            PropertyChanges { target: shade; opacity: .4 }

        }

        NumberAnimation on rotation {
            running: up.on; from: 0; to: 360; loops: Animation.Infinite; duration: 1200
        }
    }

    //отображение текущей темпетаруты
    Row{
        y: 10
        anchors.right: parent.right
        Text {
            id: curTempLabel
            color: "#00d2ff"
            font.bold: true; font.pixelSize: 32
            style: Text.Raised; styleColor: "black"
        }

        Text {
            text: qsTr("°")
            color: "#00d2ff"
            font.bold: true; font.pixelSize: 32
            style: Text.Raised; styleColor: "black"
        }
    }

    //отображение максимальной и минимальной температуры на сегодня
    Row {
        y: 75;
        anchors.right: parent.right
        Text {
            id: minTempLabel
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

        Text {
            text: qsTr("    –    ")
            color: "#00d2ff"
            font.bold: true; font.pixelSize: 14
            style: Text.Raised; styleColor: "black"
        }

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

    //отображение текущего состояния погоды
    Text {
        id: skyLabel
        y: 55; anchors.right: parent.right
        color: "#00d2ff"
        font.bold: true; font.pixelSize: 14
        style: Text.Raised; styleColor: "black"
    }

    //отображение текущего города
    Text {
        id: cityLabel
        y: 100; anchors.right: parent.right
        color: "#00d2ff"
        font.bold: true; font.pixelSize: 14
    }

    //погода на завтра
    Row {
        x:0;y:120;

        WeatherTwo {
            id: weatherTwo
        }
    }

    //погода на послезавтра
    Row {
        x:100;y:120;

        WeatherTwo {
            id: weatherThre
        }
    }

    //погода на послепослезавтра
    Row {
        x:200;y:120;

        WeatherTwo {
            id: weatherFier
        }
    }


    //тестировалась кнопка
    //    Rectangle {
    //        x:290; y:0
    //        width: 10; height: 10

    //        MouseArea {
    //            anchors.fill: parent
    //            acceptedButtons: Qt.LeftButton | Qt.RightButton
    //            onClicked: {
    //                if (mouse.button == Qt.RightButton)
    //                {
    //                    parent.color = 'blue';
    //                }
    //                else{
    //                    parent.color = 'red';
    //                }
    //            }


    //        }
    //    }
//**************************************
//функции
//**************************************

    //чтение настроек
    function readSettings(){
        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
            if (doc.readyState == XMLHttpRequest.DONE) {
                var a = doc.responseXML.documentElement;
                for (var ii = 0; ii < a.childNodes.length; ++ii) {
                    if (a.childNodes[ii].nodeName == "City"){
                        cityParam = a.childNodes[ii].childNodes[0].nodeValue;
                    }
                    if (a.childNodes[ii].nodeName == "Key"){
                        keyParam = a.childNodes[ii].childNodes[0].nodeValue;
                    }
                }
            }
        }
        doc.open("GET", "data.xml");
        doc.send();
    }

    //получение данных с сервера
    function getData(){
        up.on = true
        var xhr = new XMLHttpRequest;
        xhr.open("GET",
                 "http://api.worldweatheronline.com/free/v2/weather.ashx?key=" + keyParam + "&q="+
                 cityParam +"&num_of_days=4&tp=24&format=json&lang=ru");
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                var a = JSON.parse(xhr.responseText);
                parseWeatherData(a);
            }
        }
        xhr.send();

        up.on = false
    }

    //разбор данных полученных с сервера
    function parseWeatherData(weatherData) {
        var weatherObjR;
        for (var j = 0 in weatherData.data.current_condition) {
            weatherObjR = weatherData.data.current_condition[j];

            curTemp = weatherObjR.temp_C;
            weatherIconId = weatherObjR.weatherCode;

            for (var k = 0 in weatherObjR.lang_ru) {
                var weatherObjRr = weatherObjR.lang_ru[k];
                sky = weatherObjRr.value;
            }

        }

        for (var j = 0 in weatherData.data.request) {
            weatherObjR = weatherData.data.request[j];
            cityLabel.text = weatherObjR.query;
        }

        for (var i = 0 in weatherData.data.weather) {
            var weatherObj = weatherData.data.weather[i];
            var weatherObjRR;
            if (i == 0)
            {
                maxTemp = weatherObj.maxtempC;
                minTemp = weatherObj.mintempC;
            }
            if (i == 1)
            {
                weatherTwo.dayss = weatherObj.date;
                weatherTwo.maxTemp = weatherObj.maxtempC;
                weatherTwo.minTemp = weatherObj.mintempC;

                for (var jj = 0 in weatherObj.hourly) {
                    weatherObjRR = weatherObj.hourly[jj];
                    weatherTwo.weatherIconId = weatherObjRR.weatherCode;
                }
            }
            if (i == 2)
            {
                weatherThre.dayss = weatherObj.date;
                weatherThre.maxTemp = weatherObj.maxtempC;
                weatherThre.minTemp = weatherObj.mintempC;

                for (var jj = 0 in weatherObj.hourly) {
                    weatherObjRR = weatherObj.hourly[jj];
                    weatherThre.weatherIconId = weatherObjRR.weatherCode;
                }
            }
            if (i == 3)
            {
                weatherFier.dayss = weatherObj.date;
                weatherFier.maxTemp = weatherObj.maxtempC;
                weatherFier.minTemp = weatherObj.mintempC;

                for (var jj = 0 in weatherObj.hourly) {
                    weatherObjRR = weatherObj.hourly[jj];
                    weatherFier.weatherIconId = weatherObjRR.weatherCode;
                }
            }

        }

    }
}
