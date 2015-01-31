#ifndef CGADGET_H
#define CGADGET_H

#include <QtGui>
#include <QMainWindow>
#include <QtDeclarative/QDeclarativeView>
#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QGridLayout>

class CGadget: public QMainWindow
{
Q_OBJECT

public:
	CGadget(QString patchQml, QWidget *parent = 0);
	~CGadget();
private:
	QDeclarativeView *ui;

};

#endif // CGADGET_H
