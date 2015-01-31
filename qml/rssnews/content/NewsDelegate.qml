import QtQuick 1.0

Item {
    id: delegate
    height: column.height + 40
    width: delegate.ListView.view.width

    Column {
        id: column
        x: 20; y: 20
        width: parent.width - 40

        Text {
            id: titleText
            text: title; style: Text.Raised; horizontalAlignment: Text.AlignHCenter;
            width: parent.width; wrapMode: Text.WordWrap
            color: "#00d2ff"
            font { bold: true; family: "Helvetica"; pointSize: 10 }
        }
        Text {
            text: "\n";
            style: Text.Raised; horizontalAlignment: Text.AlignHCenter;
            width: parent.width; wrapMode: Text.WordWrap
            color: "#00d2ff"
            font { bold: true; family: "Helvetica"; pointSize: 10 }
        }

        Text {
            id: descriptionText
            width: parent.width;
            text: "<p align=justify>" + description + "</p>"
            color: "#00d2ff"
            wrapMode: Text.WordWrap; font.family: "Helvetica";
        }
    }

    Rectangle {
        width: parent.width; height: 1; color: "#00ee00"
        anchors.bottom: parent.bottom
    }
}
