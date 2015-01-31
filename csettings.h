#ifndef CSETTINGS_H
#define CSETTINGS_H

#include <QtGui>
#include <QWidget>
#include <QFileDialog>

#include "ui_csettings.h"

class CSettings : public QWidget, public Ui_CSettingsClass
{
    Q_OBJECT

public:
    CSettings(QWidget *parent = 0);
    ~CSettings();

public slots:
	/*!
	 * \brief Выбрать главный файл виджета qml.
	 */
	void setCurrentPatchQml();

private:
	QString m_pathImage;
};

#endif // CSETTINGS_H
