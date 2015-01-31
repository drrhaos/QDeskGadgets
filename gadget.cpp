#include "gadget.h"

CGadget::CGadget(QString patchQml , QWidget *parent)
    : QMainWindow(parent)
{
	setAttribute(Qt::WA_TranslucentBackground);
	setStyleSheet("background:transparent;");

	ui = new QDeclarativeView;

	QUrl url = QUrl::fromLocalFile(patchQml);
	ui->setSource(url);
	setCentralWidget(ui);
	setMinimumSize(ui->size());
	setMaximumSize(ui->size());

#ifdef Q_OS_WIN32
	setWindowFlags(Qt::Desktop|Qt::FramelessWindowHint|Qt::WindowStaysOnBottomHint|Qt::Tool|Qt::SplashScreen);
#endif

#ifdef Q_OS_LINUX
	setWindowFlags(Qt::Drawer|Qt::FramelessWindowHint|Qt::WindowStaysOnBottomHint);
#endif
}

CGadget::~CGadget()
{

}
