#include "dialog.h"
#include <QApplication>
#include <QMetaType>
#include <vector>

int main(int argc, char *argv[]) {
    qDebug() << "你好\n";
    qDebug() << "hello\n";
    qRegisterMetaType<std::vector<uint16_t>>("std::vector<uint16_t>");
    QApplication a(argc, argv);
    
    Dialog w;
    w.show();
    
    return QCoreApplication::exec();
}