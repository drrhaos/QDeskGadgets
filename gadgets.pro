TEMPLATE = app

TARGET = QDeskGadgets

QT += core \
    gui \
    script \
    declarative
HEADERS += gadget.h \
    cpanel.h \
    csettings.h
SOURCES += cpanel.cpp \
    gadget.cpp \
    csettings.cpp \
    main.cpp
FORMS += cpanel.ui \
    csettings.ui
RESOURCES += calendar.qrc
RC_FILE += gadgets.rc 