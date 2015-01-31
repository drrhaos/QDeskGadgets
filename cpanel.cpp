#include "cpanel.h"

CPanel::CPanel(QWidget *parent) :
	QWidget(parent)
{
	setupUi(this);
	createTray();
	readSettinge();

//	connect(actionQt, SIGNAL(triggered()), qApp, SLOT(aboutQt()));
	connect(actionSettings, SIGNAL(triggered()), this, SLOT(show()));
	connect(actionQuit, SIGNAL(triggered()), qApp, SLOT(quit()));

	connect(
			trayIcon,
			SIGNAL(activated(QSystemTrayIcon::ActivationReason)),
			this,
			SLOT(mouseClickedBehaviourTrayIcon(QSystemTrayIcon::ActivationReason)));

	connect(pushButtonSave, SIGNAL(clicked()), this, SLOT(saveSettinge()));

	connect(pushButtonAdd, SIGNAL(clicked()), this, SLOT(addGadgets()));
	connect(pushButtonSaveGadget, SIGNAL(clicked()), this, SLOT(saveGadgets()));
	connect(pushButtonCancel, SIGNAL(clicked()), this, SLOT(saveGadgetsCancel()));
	connect(pushButtonDelete, SIGNAL(clicked()), this, SLOT(deleteGadgets()));

	connect(toolButton, SIGNAL(clicked()), this, SLOT(setCurrentPatchQml()));

}

CPanel::~CPanel()
{

}

void CPanel::createTray()
{
	trayIcon = new QSystemTrayIcon(this);
	trayIconMenu = new QMenu(this);

	trayIcon->setContextMenu(trayIconMenu);
	trayIcon->setIcon(QIcon(":/icons/tack.png"));
	trayIcon->show();

	trayIconMenu->addAction(actionQt);
	trayIconMenu->addAction(actionSettings);
	trayIconMenu->addAction(actionQuit);
}

void CPanel::readSettinge()
{
	QDesktopWidget *desc = QApplication::desktop();

	QString set;
	QTextCodec *codec = QTextCodec::codecForName("UTF-8");

	QSettings settings(
			QCoreApplication::applicationDirPath() + "/settings.ini",
			QSettings::IniFormat);
	settings.setIniCodec(codec);

	QStringList listGroup = settings.childGroups();

	for (int row = 0; row < listGroup.size(); ++row)
	{

		GAD paramGagget;

		QString idGadget = listGroup.value(row);
		paramGagget.id = idGadget;

		settings.beginGroup(idGadget);
		paramGagget.name = settings.value("name", set).toString();

		paramGagget.settingsWid = new CSettings();
		paramGagget.settingsWid->sliderHorisontal->setMaximum(
				desc->width());
		paramGagget.settingsWid->sliderVertical->setMaximum(
				desc->height());
		paramGagget.settingsWid->sliderHorisontal->setValue(settings.value(
				"h_position", set).toInt());
		paramGagget.settingsWid->sliderVertical->setValue(settings.value(
				"v_position", set).toInt());
		paramGagget.settingsWid->lineEditPatchQml->setText(settings.value(
				"qml_patch", set).toString());
		settings.endGroup();

		listWidget->insertItem(listWidget->count(), paramGagget.name);
		stackedWidget->insertWidget(stackedWidget->count(),
				paramGagget.settingsWid);


		paramGagget.gadget = new CGadget(
				paramGagget.settingsWid->lineEditPatchQml->text());
		paramGagget.gadget->move(
				paramGagget.settingsWid->sliderHorisontal->value(),
				paramGagget.settingsWid->sliderVertical->value());
		paramGagget.gadget->show();

		m_listGadget.insert(m_listGadget.count(), paramGagget);

		connect(paramGagget.settingsWid->sliderHorisontal,
				SIGNAL(sliderReleased()), this, SLOT(moveGadgets()));
		connect(paramGagget.settingsWid->sliderVertical,
				SIGNAL(sliderReleased()), this, SLOT(moveGadgets()));
	}
}

void CPanel::saveSettinge()
{
	QTextCodec *codec = QTextCodec::codecForName("UTF-8");

	QSettings settings(
			QCoreApplication::applicationDirPath() + "/settings.ini",
			QSettings::IniFormat);
	settings.setIniCodec(codec);
	settings.clear();

	for (int row = 0; row < m_listGadget.count(); ++row)
	{
		QString idGadget = m_listGadget[row].id;

		settings.beginGroup(idGadget);
		settings.setValue("name",
						m_listGadget[row].name);
		settings.setValue("h_position",
				m_listGadget[row].settingsWid->sliderHorisontal->value());
		settings.setValue("v_position",
				m_listGadget[row].settingsWid->sliderVertical->value());
		settings.setValue("qml_patch",
				m_listGadget[row].settingsWid->lineEditPatchQml->text());
		settings.endGroup();
	}
	listWidget->setCurrentRow(0);
}

void CPanel::moveGadgets()
{
	m_listGadget[listWidget->currentIndex().row()].gadget->move(
			m_listGadget[listWidget->currentIndex().row()].settingsWid->sliderHorisontal->value(),
			m_listGadget[listWidget->currentIndex().row()].settingsWid->sliderVertical->value());
}

void CPanel::addGadgets()
{
	lineEditNameGadget->setText("");
	sliderHorisontal->setValue(0);
	sliderVertical->setValue(0);
	lineEditPatchQml->setText("");
	stackedWidgetMain->setCurrentIndex(1);
}

void CPanel::saveGadgets()
{
	QDesktopWidget *desc = QApplication::desktop();

	QString nameGadget = lineEditNameGadget->text();

	GAD t_temp;
	t_temp.settingsWid = new CSettings();

	t_temp.name = nameGadget;

	t_temp.settingsWid->sliderHorisontal->setMaximum(
			desc->width());
	t_temp.settingsWid->sliderVertical->setMaximum(
			desc->height());
	t_temp.settingsWid->sliderHorisontal->setValue(sliderHorisontal->value());
	t_temp.settingsWid->sliderVertical->setValue(sliderVertical->value());
	t_temp.settingsWid->lineEditPatchQml->setText(lineEditPatchQml->text());

	t_temp.gadget = new CGadget(t_temp.settingsWid->lineEditPatchQml->text());
	t_temp.gadget->move(t_temp.settingsWid->sliderHorisontal->value(),
			t_temp.settingsWid->sliderVertical->value());
	t_temp.gadget->show();

	listWidget->insertItem(listWidget->count(), nameGadget);
	stackedWidget->insertWidget(stackedWidget->count(), t_temp.settingsWid);

	m_listGadget.insert(m_listGadget.count(), t_temp);

	connect(t_temp.settingsWid->sliderHorisontal, SIGNAL(sliderReleased()),
			this, SLOT(moveGadgets()));
	connect(t_temp.settingsWid->sliderVertical,
			SIGNAL(sliderReleased()), this, SLOT(moveGadgets()));
	stackedWidgetMain->setCurrentIndex(0);
	saveSettinge();
}

void CPanel::saveGadgetsCancel()
{
	stackedWidgetMain->setCurrentIndex(0);
}


void CPanel::deleteGadgets()
{
	m_listGadget[listWidget->currentIndex().row()].gadget->close();
	m_listGadget[listWidget->currentIndex().row()].settingsWid->close();
	stackedWidget->removeWidget(stackedWidget->widget(listWidget->currentIndex().row()));
	m_listGadget.remove(listWidget->currentIndex().row());
	listWidget->takeItem(listWidget->currentIndex().row());
}

void CPanel::setCurrentPatchQml()
{
	lineEditPatchQml->setText(QFileDialog::getOpenFileName(this, QObject::trUtf8(
			"Выбирите файл"), QCoreApplication::applicationDirPath()
			+ "/qml",
			QObject::trUtf8("Файл виджета (*.qml)")));
}


/*virtual*/void CPanel::closeEvent(QCloseEvent *event)
{
	if (trayIcon->isVisible())
	{
		hide();
		event->ignore();
		saveSettinge();
	}
}

void CPanel::mouseClickedBehaviourTrayIcon(
		QSystemTrayIcon::ActivationReason reason)
{
	if (reason == QSystemTrayIcon::Trigger)
	{
		if (isVisible())
		{
			hide();
		}
		else
		{
			showNormal();
		}
	}
}
