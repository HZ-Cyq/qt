# -*- coding: utf-8 -*-

################################################################################
## Form generated from reading UI file 'dialog.ui'
##
## Created by: Qt User Interface Compiler version 6.12.0
##
## WARNING! All changes made in this file will be lost when recompiling UI file!
################################################################################

from PySide6.QtCore import (QCoreApplication, QDate, QDateTime, QLocale,
    QMetaObject, QObject, QPoint, QRect,
    QSize, QTime, QUrl, Qt)
from PySide6.QtGui import (QBrush, QColor, QConicalGradient, QCursor,
    QFont, QFontDatabase, QGradient, QIcon,
    QImage, QKeySequence, QLinearGradient, QPainter,
    QPalette, QPixmap, QRadialGradient, QTransform)
from PySide6.QtWidgets import (QApplication, QCheckBox, QComboBox, QDialog,
    QFormLayout, QGridLayout, QHBoxLayout, QHeaderView,
    QLabel, QLineEdit, QProgressBar, QPushButton,
    QSizePolicy, QSlider, QSpinBox, QTableWidget,
    QTableWidgetItem, QVBoxLayout, QWidget)

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        if not Dialog.objectName():
            Dialog.setObjectName(u"Dialog")
        Dialog.resize(662, 1013)
        self.layoutWidget = QWidget(Dialog)
        self.layoutWidget.setObjectName(u"layoutWidget")
        self.layoutWidget.setGeometry(QRect(20, 12, 621, 160))
        self.verticalLayout_4 = QVBoxLayout(self.layoutWidget)
        self.verticalLayout_4.setObjectName(u"verticalLayout_4")
        self.verticalLayout_4.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_3 = QVBoxLayout()
        self.verticalLayout_3.setObjectName(u"verticalLayout_3")
        self.pushButtonInformation = QPushButton(self.layoutWidget)
        self.pushButtonInformation.setObjectName(u"pushButtonInformation")

        self.verticalLayout_3.addWidget(self.pushButtonInformation)

        self.pushButtonChangeBtnText = QPushButton(self.layoutWidget)
        self.pushButtonChangeBtnText.setObjectName(u"pushButtonChangeBtnText")

        self.verticalLayout_3.addWidget(self.pushButtonChangeBtnText)


        self.verticalLayout_4.addLayout(self.verticalLayout_3)

        self.verticalLayout = QVBoxLayout()
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.pushButton1UseSlot1 = QPushButton(self.layoutWidget)
        self.pushButton1UseSlot1.setObjectName(u"pushButton1UseSlot1")

        self.verticalLayout.addWidget(self.pushButton1UseSlot1)

        self.pushButton2UseSlot1 = QPushButton(self.layoutWidget)
        self.pushButton2UseSlot1.setObjectName(u"pushButton2UseSlot1")

        self.verticalLayout.addWidget(self.pushButton2UseSlot1)


        self.verticalLayout_4.addLayout(self.verticalLayout)

        self.verticalLayout_2 = QVBoxLayout()
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.pushButtonStart = QPushButton(self.layoutWidget)
        self.pushButtonStart.setObjectName(u"pushButtonStart")

        self.verticalLayout_2.addWidget(self.pushButtonStart)

        self.pushButtonStop = QPushButton(self.layoutWidget)
        self.pushButtonStop.setObjectName(u"pushButtonStop")

        self.verticalLayout_2.addWidget(self.pushButtonStop)


        self.verticalLayout_4.addLayout(self.verticalLayout_2)

        self.formLayoutWidget = QWidget(Dialog)
        self.formLayoutWidget.setObjectName(u"formLayoutWidget")
        self.formLayoutWidget.setGeometry(QRect(29, 559, 571, 91))
        self.formLayout = QFormLayout(self.formLayoutWidget)
        self.formLayout.setObjectName(u"formLayout")
        self.formLayout.setContentsMargins(0, 0, 0, 0)
        self.label = QLabel(self.formLayoutWidget)
        self.label.setObjectName(u"label")

        self.formLayout.setWidget(0, QFormLayout.ItemRole.LabelRole, self.label)

        self.lineEdit = QLineEdit(self.formLayoutWidget)
        self.lineEdit.setObjectName(u"lineEdit")

        self.formLayout.setWidget(0, QFormLayout.ItemRole.FieldRole, self.lineEdit)

        self.lineEdit_2 = QLineEdit(self.formLayoutWidget)
        self.lineEdit_2.setObjectName(u"lineEdit_2")

        self.formLayout.setWidget(1, QFormLayout.ItemRole.FieldRole, self.lineEdit_2)

        self.label_2 = QLabel(self.formLayoutWidget)
        self.label_2.setObjectName(u"label_2")

        self.formLayout.setWidget(1, QFormLayout.ItemRole.LabelRole, self.label_2)

        self.layoutWidget1 = QWidget(Dialog)
        self.layoutWidget1.setObjectName(u"layoutWidget1")
        self.layoutWidget1.setGeometry(QRect(20, 190, 621, 151))
        self.horizontalLayout = QHBoxLayout(self.layoutWidget1)
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_5 = QVBoxLayout()
        self.verticalLayout_5.setObjectName(u"verticalLayout_5")
        self.pushButtonExport = QPushButton(self.layoutWidget1)
        self.pushButtonExport.setObjectName(u"pushButtonExport")

        self.verticalLayout_5.addWidget(self.pushButtonExport)

        self.pushButtonImport = QPushButton(self.layoutWidget1)
        self.pushButtonImport.setObjectName(u"pushButtonImport")

        self.verticalLayout_5.addWidget(self.pushButtonImport)


        self.horizontalLayout.addLayout(self.verticalLayout_5)

        self.verticalLayout_6 = QVBoxLayout()
        self.verticalLayout_6.setObjectName(u"verticalLayout_6")
        self.pushButton_8 = QPushButton(self.layoutWidget1)
        self.pushButton_8.setObjectName(u"pushButton_8")

        self.verticalLayout_6.addWidget(self.pushButton_8)

        self.pushButton_7 = QPushButton(self.layoutWidget1)
        self.pushButton_7.setObjectName(u"pushButton_7")

        self.verticalLayout_6.addWidget(self.pushButton_7)


        self.horizontalLayout.addLayout(self.verticalLayout_6)

        self.verticalLayout_7 = QVBoxLayout()
        self.verticalLayout_7.setObjectName(u"verticalLayout_7")
        self.pushButton_9 = QPushButton(self.layoutWidget1)
        self.pushButton_9.setObjectName(u"pushButton_9")

        self.verticalLayout_7.addWidget(self.pushButton_9)

        self.pushButton_10 = QPushButton(self.layoutWidget1)
        self.pushButton_10.setObjectName(u"pushButton_10")

        self.verticalLayout_7.addWidget(self.pushButton_10)


        self.horizontalLayout.addLayout(self.verticalLayout_7)

        self.layoutWidget2 = QWidget(Dialog)
        self.layoutWidget2.setObjectName(u"layoutWidget2")
        self.layoutWidget2.setGeometry(QRect(21, 401, 621, 121))
        self.gridLayout = QGridLayout(self.layoutWidget2)
        self.gridLayout.setObjectName(u"gridLayout")
        self.gridLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_10 = QVBoxLayout()
        self.verticalLayout_10.setObjectName(u"verticalLayout_10")
        self.pushButton_13 = QPushButton(self.layoutWidget2)
        self.pushButton_13.setObjectName(u"pushButton_13")

        self.verticalLayout_10.addWidget(self.pushButton_13)


        self.gridLayout.addLayout(self.verticalLayout_10, 0, 2, 1, 1)

        self.verticalLayout_12 = QVBoxLayout()
        self.verticalLayout_12.setObjectName(u"verticalLayout_12")
        self.pushButton_15 = QPushButton(self.layoutWidget2)
        self.pushButton_15.setObjectName(u"pushButton_15")

        self.verticalLayout_12.addWidget(self.pushButton_15)


        self.gridLayout.addLayout(self.verticalLayout_12, 1, 0, 1, 1)

        self.verticalLayout_11 = QVBoxLayout()
        self.verticalLayout_11.setObjectName(u"verticalLayout_11")
        self.pushButton_14 = QPushButton(self.layoutWidget2)
        self.pushButton_14.setObjectName(u"pushButton_14")

        self.verticalLayout_11.addWidget(self.pushButton_14)


        self.gridLayout.addLayout(self.verticalLayout_11, 0, 3, 1, 1)

        self.verticalLayout_13 = QVBoxLayout()
        self.verticalLayout_13.setObjectName(u"verticalLayout_13")
        self.pushButton_16 = QPushButton(self.layoutWidget2)
        self.pushButton_16.setObjectName(u"pushButton_16")

        self.verticalLayout_13.addWidget(self.pushButton_16)


        self.gridLayout.addLayout(self.verticalLayout_13, 1, 1, 1, 1)

        self.verticalLayout_8 = QVBoxLayout()
        self.verticalLayout_8.setObjectName(u"verticalLayout_8")
        self.pushButton_11 = QPushButton(self.layoutWidget2)
        self.pushButton_11.setObjectName(u"pushButton_11")

        self.verticalLayout_8.addWidget(self.pushButton_11)


        self.gridLayout.addLayout(self.verticalLayout_8, 0, 0, 1, 1)

        self.verticalLayout_9 = QVBoxLayout()
        self.verticalLayout_9.setObjectName(u"verticalLayout_9")
        self.pushButton_12 = QPushButton(self.layoutWidget2)
        self.pushButton_12.setObjectName(u"pushButton_12")

        self.verticalLayout_9.addWidget(self.pushButton_12)


        self.gridLayout.addLayout(self.verticalLayout_9, 0, 1, 1, 1)

        self.comboBox = QComboBox(Dialog)
        self.comboBox.setObjectName(u"comboBox")
        self.comboBox.setGeometry(QRect(50, 750, 60, 22))
        self.checkBox = QCheckBox(Dialog)
        self.checkBox.setObjectName(u"checkBox")
        self.checkBox.setGeometry(QRect(50, 800, 60, 16))
        self.spinBoxInterval = QSpinBox(Dialog)
        self.spinBoxInterval.setObjectName(u"spinBoxInterval")
        self.spinBoxInterval.setGeometry(QRect(50, 840, 91, 22))
        self.spinBoxInterval.setMinimum(100)
        self.spinBoxInterval.setMaximum(10000)
        self.horizontalSlider = QSlider(Dialog)
        self.horizontalSlider.setObjectName(u"horizontalSlider")
        self.horizontalSlider.setGeometry(QRect(50, 900, 91, 16))
        self.horizontalSlider.setOrientation(Qt.Orientation.Horizontal)
        self.progressBar = QProgressBar(Dialog)
        self.progressBar.setObjectName(u"progressBar")
        self.progressBar.setGeometry(QRect(50, 950, 118, 23))
        self.progressBar.setValue(0)
        self.tableWidget = QTableWidget(Dialog)
        self.tableWidget.setObjectName(u"tableWidget")
        self.tableWidget.setGeometry(QRect(190, 730, 451, 251))

        self.retranslateUi(Dialog)

        QMetaObject.connectSlotsByName(Dialog)
    # setupUi

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(QCoreApplication.translate("Dialog", u"Dialog", None))
        self.pushButtonInformation.setText(QCoreApplication.translate("Dialog", u"\u5f39\u7a97\u53e3", None))
        self.pushButtonChangeBtnText.setText(QCoreApplication.translate("Dialog", u"\u4fee\u6539\u6309\u94ae\u6587\u5b57", None))
        self.pushButton1UseSlot1.setText(QCoreApplication.translate("Dialog", u"\u6309\u94ae1\uff0c\u7528\u69fd1", None))
        self.pushButton2UseSlot1.setText(QCoreApplication.translate("Dialog", u"\u6309\u94ae2\uff0c\u7528\u69fd1", None))
        self.pushButtonStart.setText(QCoreApplication.translate("Dialog", u"\u5f00\u59cb\u6309\u94ae", None))
        self.pushButtonStop.setText(QCoreApplication.translate("Dialog", u"\u505c\u6b62\u6309\u94ae", None))
        self.label.setText(QCoreApplication.translate("Dialog", u"\u6807\u7b7e1\uff0c\u6309enter\u89e6\u53d1\u69fd\u51fd\u6570", None))
        self.lineEdit.setText(QCoreApplication.translate("Dialog", u"11", None))
        self.lineEdit_2.setText(QCoreApplication.translate("Dialog", u"22", None))
        self.label_2.setText(QCoreApplication.translate("Dialog", u"\u6807\u7b7e2\uff0c\u4fee\u6539\u503c\u89e6\u53d1\u69fd\u51fd\u6570", None))
        self.pushButtonExport.setText(QCoreApplication.translate("Dialog", u"\u5bfc\u51fa", None))
        self.pushButtonImport.setText(QCoreApplication.translate("Dialog", u"\u5bfc\u5165", None))
        self.pushButton_8.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_7.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_9.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_10.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_13.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_15.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_14.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_16.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_11.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_12.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.checkBox.setText(QCoreApplication.translate("Dialog", u"CheckBox", None))
    # retranslateUi

