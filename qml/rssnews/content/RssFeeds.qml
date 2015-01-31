import QtQuick 1.0

ListModel {
    id: rssFeeds

    ListElement { name: "Безопасность"; feed: "news.yandex.ru/security.rss" }
    ListElement { name: "Наука"; feed: "news.yandex.ru/science.rss" }
    ListElement { name: "Железо"; feed: "news.yandex.ru/hardware.rss" }
    ListElement { name: "Hi-Tech"; feed: "news.yandex.ru/computers.rss" }
    ListElement { name: "Мир"; feed: "news.yandex.ru/world.rss" }
}
