#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QTimer>

QT_BEGIN_NAMESPACE
namespace Ui { class Dialog; }
QT_END_NAMESPACE

class Dialog : public QDialog {
    Q_OBJECT

public:
    explicit Dialog(QWidget *parent = nullptr);
    ~Dialog();

private slots:
    
    void onPushButtonInformationClicked();
    void onPushButtonChangeBtnLabelClicked();

    void onLineEditReturnPressed();
    void onLineEdit_2TextChanged();

    void onSlot1Trigger();
    
    void onTimerTick();

    void onPushButtonExportClicked();
    void onPushButtonImportClicked();
    
private:
    Ui::Dialog *ui;
    QTimer *timer;

};

#endif // DIALOG_H