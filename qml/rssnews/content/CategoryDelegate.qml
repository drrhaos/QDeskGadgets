import QtQuick 1.0

Item {
    id: delegate

    width: window.width - 40; height: 20


    Text {
        text: name
        color: delegate.ListView.isCurrentItem ? "#00d2ff" : "#00d2ff"
        font { family: "Helvetica"; pixelSize: 8; bold: true }
        anchors {
            horizontalCenter: parent.horizontalCenter;
            verticalCenter: parent.verticalCenter
        }
    }

    BusyIndicator {
        scale: 0.6
        on: delegate.ListView.isCurrentItem && window.loading
        anchors { right: parent.right; rightMargin: 10; verticalCenter: parent.verticalCenter }
    }

    Rectangle {
        width: delegate.width; height: 1; color: "#00d2ff"
        anchors.bottom: delegate.bottom
        visible: delegate.ListView.isCurrentItem ? false : true
    }
    Rectangle {
        width: delegate.width; height: 1; color: "#00d2ff"
        visible: delegate.ListView.isCurrentItem ? false : true
    }

    MouseArea {
        anchors.fill: delegate
        onClicked: {
            delegate.ListView.view.currentIndex = index
            window.currentFeed = feed
        }
    }
}
