#ifndef CPANEL_H
#define CPANEL_H

#include <QtGui>
#include <QWidget>
#include <QSystemTrayIcon>
#include <QMenu>
#include <QCloseEvent>
#include <QDesktopWidget>
#include <QSettings>
#include <QList>
#include <QTextStream>
#include <QMessageBox>
#include <QTextCodec>

#include "gadget.h"

#include "csettings.h"

#include "ui_cpanel.h"

struct GAD
{
	QString id;
	QString name;
	CSettings *settingsWid;
	CGadget *gadget;
	GAD()
	{
		id = QString::number(qrand());
		name = "";
		settingsWid = 0;
		gadget = 0;
	}
};

class CPanel: public QWidget, public Ui_gadgetsClass
{
Q_OBJECT

public:
	CPanel(QWidget *parent = 0);
	~CPanel();

private:
	/*!
	 * \brief Создать иконку в области уведомлений.
	 */
	void createTray();

public slots:
	/*!
	 * \brief Переопределено закрытие формы приложения.
	 *
	 * \param event - событие.
	 */
	virtual void closeEvent(QCloseEvent *event);

	/*!
	 * \brief Скрытие и разворот главного окна.
	 *
	 * \param reason
	 */
	void
	mouseClickedBehaviourTrayIcon(QSystemTrayIcon::ActivationReason reason);

	/*!
	 * \brief Считать настройки.
	 */
	void readSettinge();

	/*!
	 * \brief Сохранить настройки.
	 */
	void saveSettinge();

	/*!
	 * \brief Изменение положение гаджета.
	 */
	void moveGadgets();

	/*!
	 * \brief Добавить гаджет.
	 */
	void addGadgets();

	/*!
	 * \brief Сохранить гаджет.
	 */
	void saveGadgets();

	/*!
	 * \brief Отменить создание гаджета.
	 */
	void saveGadgetsCancel();

	/*!
	 * \brief Удалить гаджета.
	 */
	void deleteGadgets();

	/*!
	 * \brief Выбор файла Qml.
	 */
	void setCurrentPatchQml();

private:
	QMenu *trayIconMenu;
	QMenu *trayStatusMenu;
	QSystemTrayIcon *trayIcon;

	QVector<GAD> m_listGadget;
};

#endif // GADGETS_H
