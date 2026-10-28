#include <QApplication>
#include <QLabel>

int main(int argc, char *argv[]) {
    QApplication a(argc, argv);
    
    QLabel label("Hello, Qt!");
    label.setWindowTitle("My First Qt App");
    label.setAlignment(Qt::AlignCenter);
    label.resize(400, 200);
    label.show();
    
    a.exec();
    return 0;
}