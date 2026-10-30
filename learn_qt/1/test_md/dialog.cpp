#include "dialog.h"
#include "ui_dialog.h"
#include <QDebug>
#include <QMessageBox>
#include <QDateTime>
#include <QRandomGenerator>

#include <QFileDialog>
#include <QTextStream>
#include <QSettings>

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
   
    connect(ui->horizontalSlider, &QSlider::valueChanged, ui->progressBar, &QProgressBar::setValue);



    // 定时器定时更新表格内容
    ui->tableWidget->setColumnCount(4);
    ui->tableWidget->setHorizontalHeaderLabels({"序号","时间","数值","状态"});

    int row = ui->tableWidget->rowCount();
    ui->tableWidget->insertRow(row);
    ui->tableWidget->setItem(row, 0, new QTableWidgetItem(QString::number(row + 1)));
    ui->tableWidget->setItem(row, 1, new QTableWidgetItem("14:08:01"));
    ui->tableWidget->setItem(row, 2, new QTableWidgetItem("1024"));
    ui->tableWidget->setItem(row, 3, new QTableWidgetItem(QString("正常")));

    // `new QTimer(this)` 传了父对象，Dialog 销毁时自动清理，不会泄漏。
    timer = new QTimer(this);    
    // 信号直连槽典范——参数类型完全匹配（都是 `int`），不需要 lambda 中转。
    connect(timer, &QTimer::timeout, this, &Dialog::onTimerTick);
    
    // 开始按钮
    connect(ui->pushButtonStart, &QPushButton::clicked, this, [this]() {
        timer->start(ui->spinBoxInterval->value());
    });
    // 停止按钮
    connect(ui->pushButtonStop, &QPushButton::clicked, this, [this]() {
        timer->stop();
    });

    // 文件读写
    
    connect(ui->pushButtonExport, &QPushButton::clicked, this, Dialog::onPushButtonExportClicked);
    connect(ui->pushButtonImport, &QPushButton::clicked, this, Dialog::onPushButtonImportClicked);
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

void Dialog::onTimerTick() {
    // 超过10行删除旧的
    if(ui->tableWidget->rowCount() >= 10) {
        ui->tableWidget->removeRow(0);
    }
    // toString的格式符：hh(时)，mm(分),(ss)秒，zzz(毫秒)，yyyy-MM-dd(日期，如2026-10-30)
    QString time = QDateTime::currentDateTime().toString("hh:mm:ss");
    // 0~2047
    int value = QRandomGenerator::global()->bounded(0, 2048);
    // 状态根据数值判断
    QString status = (value > 1500) ? "警告" : "正常";
    auto *statusItem = new QTableWidgetItem(status);
    if(status == "警告") {
        statusItem->setForeground(QColor(Qt::red));
    }
    // 加一行数据到表格
    int row = ui->tableWidget->rowCount();
    ui->tableWidget->insertRow(row);
    ui->tableWidget->setItem(row, 0, new QTableWidgetItem(QString::number(row + 1)));
    ui->tableWidget->setItem(row, 1, new QTableWidgetItem(time));
    ui->tableWidget->setItem(row, 2, new QTableWidgetItem(QString::number(value)));
    ui->tableWidget->setItem(row, 3, statusItem);

    // 滚到底部
    ui->tableWidget->scrollToBottom();    
}

void Dialog::onPushButtonExportClicked() {
    // 将tableWidget导出到文件，保存文件弹窗
    // "导出 CSV":左上角提示， "data.csv"：默认的保存文件名，"CSV文件(*.csv)"：保存类型
    
    // 用QSettings记住上次路径
    QSettings settings("MyCompany", "MyApp");
    QString lastPath = settings.value("export/lastPath", "data.csv").toString();
    QString path = QFileDialog::getSaveFileName(this, "导出 CSV",lastPath, "CSV文件(*.csv)");
    // 取消就退出
    if(path.isEmpty()) return;
    
    settings.setValue("export/lastPath", path);
    
    QFile file(path);
    // ？？这句话是什么意思？   
    // WriteOnly：只写，从头开始写, Text：在windows环境下\n会写成\r\n 
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QMessageBox::warning(this, "错误", "无法写入文件" + file.errorString());
        return ;
    }

    QTextStream out(&file);
    out.setEncoding(QStringConverter::Utf8);
    //file.write("\xEF\xBB\xBF"); // BOM，防 Excel 乱码
    // 写表头
    out << "序号,时间,数值,状态\n";
    
    // 写数据
    for(int i = 0; i < ui->tableWidget->rowCount(); ++i) {
        QStringList rowData;
        for(int j = 0; j < ui->tableWidget->columnCount(); ++j) {
            auto *item = ui->tableWidget->item(i, j);
            rowData << (item ? item->text() : "");
        }
        out << rowData.join(",") << "\n";
    }

    file.close();
    QMessageBox::information(this, "成功", "已导出到:" + path);

}

void Dialog::onPushButtonImportClicked() {
    // 将文件导入到tableWidget
    QString path = QFileDialog::getOpenFileName(this, "导入 CSV", "", "CSV文件(*.csv)");
    if(path.isEmpty()) return;

    QFile file(path);
    if(!file.open(QIODevice::ReadOnly)) {
        QMessageBox::warning(this, "错误", "无法读取文件");        
        return ;
    }

   QByteArray raw = file.readAll();
   if(raw.startsWith("\xEF\xBB\xBF")) {
      raw.remove(0, 3);
   }

   QString text;
   QStringDecoder utf8Decoder(QStringConverter::Utf8, QStringConverter::Flag::Stateless);
   QString utf8Result = utf8Decoder(raw);

   if (utf8Decoder.hasError()) {
        QStringDecoder sysDecoder(QStringConverter::System);
        text = sysDecoder(raw);
        qDebug() << "检测到非 UTF-8 文件，已按系统编码(GBK)读取";
    } else {
        text = utf8Result;
        qDebug() << "按 UTF-8 读取";
    }

    // 按行读取
    ui->tableWidget->setRowCount(0);
    QStringList lines = text.split('\n', Qt::SkipEmptyParts);
    bool firstLine = true;
    for(const QString &line: lines) {
        if(firstLine) {
            firstLine = false;
            continue;
        }
        qDebug() << line;
        QString trimmed = line.trimmed();
        if(trimmed.isEmpty()) continue;

        QStringList fields = trimmed.split(',');
        int row = ui->tableWidget->rowCount();
        ui->tableWidget->insertRow(row);
        for(int i = 0; i < fields.size() && i < ui->tableWidget->columnCount(); i++) {
            ui->tableWidget->setItem(row, i, new QTableWidgetItem(fields[i]));
        }
    }

    // QTextStream in(&file);
    // in.setEncoding(QStringConverter::Utf8);

    // ui->tableWidget->setRowCount(0); // 清空表格

    // bool firstLine = true;
    // while(!in.atEnd()) {
    //     QString line = in.readLine();
    //     qDebug() << line;
    //     if(firstLine) {
    //         firstLine = false;
    //         continue;
    //     }
    //     if(line.trimmed().isEmpty()) {
    //         continue;
    //     }
    //     QStringList fields = line.split(",");
    //     int row = ui->tableWidget->rowCount();
    //     ui->tableWidget->insertRow(row);
    //     for(int i = 0; i < fields.size(); i++) {
    //         qDebug() << fields[i];
    //         ui->tableWidget->setItem(row, i, new QTableWidgetItem(fields[i]));
    //     }
    // }    

}

Dialog::~Dialog() {
    delete ui;
}