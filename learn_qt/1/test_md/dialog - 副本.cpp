#include "dialog.h"
#include "ui_dialog.h"
#include <QDebug>
#include <QMessageBox>

Dialog::Dialog(QWidget *parent)
    : QDialog(parent)
    , ui(new Ui::Dialog) {
    ui->setupUi(this);

    for(auto *btn : findChildren<QPushButton*>()) {
        // 默认autoDefault是true，按enter按键的时候可能会触发按钮的onClicked方法(被蓝色边框围住的按钮)
        // 所以这里将所有按钮的autoDefault设置成false
        btn->setAutoDefault(false);
    }
    // connect(ui->pushButton, &QPushButton::clicked, this, [this]() {
    //     QMessageBox::information(this, "提示", "你点了我！");
    // });
    connect(ui->pushButtonInformation, &QPushButton::clicked, this, &Dialog::onPushButtonInformationClicked);  // ② 连接
    connect(ui->pushButtonChangeBtnText, &QPushButton::clicked, this, &Dialog::onPushButtonChangeBtnLabelClicked);
    connect(ui->pushButton1UseSlot1, &QPushButton::clicked, this, &Dialog::onSlot1Trigger);
    connect(ui->pushButton2UseSlot1, &QPushButton::clicked, this, &Dialog::onSlot1Trigger);
    connect(ui->lineEdit, &QLineEdit::returnPressed, this, &Dialog::onLineEditReturnPressed);
    connect(ui->lineEdit_2, &QLineEdit::textChanged, this, &Dialog::onLineEdit_2TextChanged);

}

void Dialog::onPushButtonInformationClicked() {  // ③ 实现
    QMessageBox::information(this, "提示", "你点了我11！");
}


void Dialog::onPushButtonChangeBtnLabelClicked() {
    ui->pushButtonChangeBtnText->setText("我已经被点击了");
}

void Dialog::onLineEditReturnPressed() {
   qDebug() << "onLineEditReturnPressed, text:" << ui->lineEdit->text();
}

void Dialog::onLineEdit_2TextChanged() {
   qDebug() << "onLineEdit_2TextChanged, text:" << ui->lineEdit_2->text();
}

void Dialog::onSlot1Trigger() {
    auto *btn = qobject_cast<QPushButton*>(sender());
    if(btn) {
        QMessageBox::information(this, "提示", "你点了" + btn->text());        
    }
}

Dialog::~Dialog() {
    delete ui;
}