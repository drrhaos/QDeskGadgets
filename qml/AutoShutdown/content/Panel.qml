import QtQuick 1.0

Item {
    id: panelID
    width: 200; height: 100

    property alias m_time: timeLabel.text

    Text {
        id: timeLabel
        y:20; anchors.horizontalCenter: parent.horizontalCenter
        color: "#00d2ff"
        font.bold: true; font.pixelSize: 14
        style: Text.Raised; styleColor: "black"
    }


        Row {
            y: 60;
            spacing : 2;
            anchors.horizontalCenter: parent.horizontalCenter
            //Выключить
            Image {
                id: shutdownImage;
                width: 30; height: 30;
                source: "shutdown.png";
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onClicked: {
                        if (mouse.button == Qt.LeftButton)
                        {
exec(shutdown -h);

                            timeLabel.text = "12345";

                            //                           shutdown -s -t 20;
                        }
                    }
                }
            }

            //перезагрузить
            Image {
                id: resetImage;
                width: 30; height: 30;
                source: "reset.png";
            }

            //гибернация
            Image {
                id: hibernateImage;
                width: 30; height: 30;
                source: "hibernate.png";
            }

            //заблокировать экран
            Image {
                id: lockImage;
                width: 30; height: 30;
                source: "lock.png";
            }

            //выход
            Image {
                id: logoutImage;
                width: 30; height: 30;
                source: "logout.png";
            }

            //приостановить сессию
            Image {
                id: sessionsuspendImage;
                width: 30; height: 30;
                source: "sessionsuspend.png";
            }
        }



//        function disabled(op) {
//            if (op == "." && display.text.toString().search(/\./) != -1) {
//                return true
//            } else if (op == squareRoot &&  display.text.toString().search(/-/) != -1) {
//                return true
//            } else {
//                return false
//            }
//        }

}
