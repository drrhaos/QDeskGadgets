#include "cpanel.h"

#include <QtGui>
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    CPanel w;
    return a.exec();
}
