#include "csettings.h"

CSettings::CSettings(QWidget *parent)
    : QWidget(parent)
{
	setupUi(this);
	connect(toolButton, SIGNAL(clicked()), this, SLOT(setCurrentPatchQml()));
}

CSettings::~CSettings()
{

}

void CSettings::setCurrentPatchQml()
{
	m_pathImage = QFileDialog::getOpenFileName(this, QObject::trUtf8(
			"Выбирите файл"), QCoreApplication::applicationDirPath()
			+ "/qml",
			QObject::trUtf8("Файл виджета (*.qml)"));
	lineEditPatchQml->setText(m_pathImage);
}
