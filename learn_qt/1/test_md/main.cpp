#include "dialog.h"
#include <QApplication>
#include <QMetaType>
#include <vector>

int main(int argc, char *argv[]) {
    qRegisterMetaType<std::vector<uint16_t>>("std::vector<uint16_t>");
    QApplication a(argc, argv);
    
    Dialog w;
    w.show();
    
    return QCoreApplication::exec();
}