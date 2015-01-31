import QtQuick 1.0
import "content"

Rectangle {
    id: window
    width: 200; height: 300
    color: "#01000000"

    property string currentFeed: "news.yandex.ru/security.rss"
    property bool loading: feedModel.status == XmlListModel.Loading

    RssFeeds { id: rssFeeds }

    XmlListModel {
        id: feedModel
        source: "http://" + window.currentFeed
        query: "/rss/channel/item"

        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "link"; query: "link/string()" }
        XmlRole { name: "description"; query: "description/string()" }
    }


    Text {
        text: "Новости"
        horizontalAlignment: Text.AlignHCenter
        x: 0; y: 0
        width: window.width; height: 20
        color: "#00d2ff"
        font { family: "Helvetica"; pixelSize: 14; bold: true }

    }

    Image {
        id: beckImage
        x: 0; y: 10
        width: window.width
        source: "content/images/reader.png"
    }

    Column {
        x:0; y:48
        //типы новостных лент
        Row {
            Image {
                width: 20; height: 20
                source: "content/images/left.png"
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onClicked: {
                        if (mouse.button == Qt.LeftButton)
                        {
                            if(categories.currentIndex == 0)
                            {
                                categories.currentIndex = categories.count - 1
                            }else{
                                categories.currentIndex = categories.currentIndex - 1
                            }
                            window.currentFeed = rssFeeds.get(categories.currentIndex).feed
                        }
                    }
                }
            }

            Rectangle {
                x:20
                width: window.width - 40; height: 20
                color: "#00000000"

                ListView {
                    focus: true
                    id: categories
                    anchors.fill: parent
                    clip: true
                    orientation: ListView.Horizontal
                    model: rssFeeds
                    delegate: CategoryDelegate {}
                    highlight: Rectangle { color: "steelblue" }
                    highlightMoveSpeed: 9999999
                }
                ScrollBar {
                    scrollArea: categories;
                    height: 8; width: categories.width
                    orientation: Qt.Horizontal
                    anchors.top: categories.top
                }
            }

            Image {
                width: 20; height: 20
                source: "content/images/right.png"
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton
                    onClicked: {
                        if (mouse.button == Qt.LeftButton)
                        {
                            if(categories.currentIndex == categories.count - 1)
                            {
                                categories.currentIndex = 0
                            }else{
                                categories.currentIndex = categories.currentIndex + 1
                            }                            window.currentFeed = rssFeeds.get(categories.currentIndex).feed
                        }
                    }
                }
            }
        }

        //новости
        ListView {
            id: list
            x:0; y:categories.height
            width: window.width; height: window.height - 68
            clip: true
            model: feedModel
            delegate: NewsDelegate {}
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton
                onClicked: {
                    if (mouse.button == Qt.LeftButton)
                    {
                        if(proc.running)
                        {
                            proc.stop()
                        }else{
                            proc.start()
                        }
                    }
                }
            }
        }
    }

    ScrollBar {
        x:0; y:68
        scrollArea: list;
        height: list.height;
        width: 8;
        anchors.right: window.right
    }

    Timer {
        interval: 3600000; running: true; repeat: true;
        onTriggered:
        {
            window.currentFeed = rssFeeds.get(categories.currentIndex).feed
        }
    }

    Timer {
        id: proc
        interval: 150; running: true; repeat: true;
        onTriggered:
        {
            if(list.contentY > list.contentHeight - 10)
            {
                if(categories.currentIndex == 0)
                {
                    categories.currentIndex = categories.count - 1
                }else{
                    categories.currentIndex = categories.currentIndex - 1
                }
                window.currentFeed = rssFeeds.get(categories.currentIndex).feed
            }else{
                list.contentY = list.contentY + 1;
            }

        }
    }
}
