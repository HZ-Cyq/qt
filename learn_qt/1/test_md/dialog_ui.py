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
from PySide6.QtWidgets import (QApplication, QDialog, QFormLayout, QGridLayout,
    QHBoxLayout, QLabel, QLineEdit, QPushButton,
    QSizePolicy, QVBoxLayout, QWidget)

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
        self.pushButton = QPushButton(self.layoutWidget)
        self.pushButton.setObjectName(u"pushButton")

        self.verticalLayout_3.addWidget(self.pushButton)

        self.pushButton_2 = QPushButton(self.layoutWidget)
        self.pushButton_2.setObjectName(u"pushButton_2")

        self.verticalLayout_3.addWidget(self.pushButton_2)


        self.verticalLayout_4.addLayout(self.verticalLayout_3)

        self.verticalLayout = QVBoxLayout()
        self.verticalLayout.setObjectName(u"verticalLayout")
        self.pushButton_3 = QPushButton(self.layoutWidget)
        self.pushButton_3.setObjectName(u"pushButton_3")

        self.verticalLayout.addWidget(self.pushButton_3)

        self.pushButton_4 = QPushButton(self.layoutWidget)
        self.pushButton_4.setObjectName(u"pushButton_4")

        self.verticalLayout.addWidget(self.pushButton_4)


        self.verticalLayout_4.addLayout(self.verticalLayout)

        self.verticalLayout_2 = QVBoxLayout()
        self.verticalLayout_2.setObjectName(u"verticalLayout_2")
        self.pushButton_17 = QPushButton(self.layoutWidget)
        self.pushButton_17.setObjectName(u"pushButton_17")

        self.verticalLayout_2.addWidget(self.pushButton_17)

        self.pushButton_18 = QPushButton(self.layoutWidget)
        self.pushButton_18.setObjectName(u"pushButton_18")

        self.verticalLayout_2.addWidget(self.pushButton_18)


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

        self.widget = QWidget(Dialog)
        self.widget.setObjectName(u"widget")
        self.widget.setGeometry(QRect(20, 190, 621, 151))
        self.horizontalLayout = QHBoxLayout(self.widget)
        self.horizontalLayout.setObjectName(u"horizontalLayout")
        self.horizontalLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_5 = QVBoxLayout()
        self.verticalLayout_5.setObjectName(u"verticalLayout_5")
        self.pushButton_5 = QPushButton(self.widget)
        self.pushButton_5.setObjectName(u"pushButton_5")

        self.verticalLayout_5.addWidget(self.pushButton_5)

        self.pushButton_6 = QPushButton(self.widget)
        self.pushButton_6.setObjectName(u"pushButton_6")

        self.verticalLayout_5.addWidget(self.pushButton_6)


        self.horizontalLayout.addLayout(self.verticalLayout_5)

        self.verticalLayout_6 = QVBoxLayout()
        self.verticalLayout_6.setObjectName(u"verticalLayout_6")
        self.pushButton_8 = QPushButton(self.widget)
        self.pushButton_8.setObjectName(u"pushButton_8")

        self.verticalLayout_6.addWidget(self.pushButton_8)

        self.pushButton_7 = QPushButton(self.widget)
        self.pushButton_7.setObjectName(u"pushButton_7")

        self.verticalLayout_6.addWidget(self.pushButton_7)


        self.horizontalLayout.addLayout(self.verticalLayout_6)

        self.verticalLayout_7 = QVBoxLayout()
        self.verticalLayout_7.setObjectName(u"verticalLayout_7")
        self.pushButton_9 = QPushButton(self.widget)
        self.pushButton_9.setObjectName(u"pushButton_9")

        self.verticalLayout_7.addWidget(self.pushButton_9)

        self.pushButton_10 = QPushButton(self.widget)
        self.pushButton_10.setObjectName(u"pushButton_10")

        self.verticalLayout_7.addWidget(self.pushButton_10)


        self.horizontalLayout.addLayout(self.verticalLayout_7)

        self.widget1 = QWidget(Dialog)
        self.widget1.setObjectName(u"widget1")
        self.widget1.setGeometry(QRect(21, 401, 601, 121))
        self.gridLayout = QGridLayout(self.widget1)
        self.gridLayout.setObjectName(u"gridLayout")
        self.gridLayout.setContentsMargins(0, 0, 0, 0)
        self.verticalLayout_10 = QVBoxLayout()
        self.verticalLayout_10.setObjectName(u"verticalLayout_10")
        self.pushButton_13 = QPushButton(self.widget1)
        self.pushButton_13.setObjectName(u"pushButton_13")

        self.verticalLayout_10.addWidget(self.pushButton_13)


        self.gridLayout.addLayout(self.verticalLayout_10, 0, 2, 1, 1)

        self.verticalLayout_12 = QVBoxLayout()
        self.verticalLayout_12.setObjectName(u"verticalLayout_12")
        self.pushButton_15 = QPushButton(self.widget1)
        self.pushButton_15.setObjectName(u"pushButton_15")

        self.verticalLayout_12.addWidget(self.pushButton_15)


        self.gridLayout.addLayout(self.verticalLayout_12, 1, 0, 1, 1)

        self.verticalLayout_11 = QVBoxLayout()
        self.verticalLayout_11.setObjectName(u"verticalLayout_11")
        self.pushButton_14 = QPushButton(self.widget1)
        self.pushButton_14.setObjectName(u"pushButton_14")

        self.verticalLayout_11.addWidget(self.pushButton_14)


        self.gridLayout.addLayout(self.verticalLayout_11, 0, 3, 1, 1)

        self.verticalLayout_13 = QVBoxLayout()
        self.verticalLayout_13.setObjectName(u"verticalLayout_13")
        self.pushButton_16 = QPushButton(self.widget1)
        self.pushButton_16.setObjectName(u"pushButton_16")

        self.verticalLayout_13.addWidget(self.pushButton_16)


        self.gridLayout.addLayout(self.verticalLayout_13, 1, 1, 1, 1)

        self.verticalLayout_8 = QVBoxLayout()
        self.verticalLayout_8.setObjectName(u"verticalLayout_8")
        self.pushButton_11 = QPushButton(self.widget1)
        self.pushButton_11.setObjectName(u"pushButton_11")

        self.verticalLayout_8.addWidget(self.pushButton_11)


        self.gridLayout.addLayout(self.verticalLayout_8, 0, 0, 1, 1)

        self.verticalLayout_9 = QVBoxLayout()
        self.verticalLayout_9.setObjectName(u"verticalLayout_9")
        self.pushButton_12 = QPushButton(self.widget1)
        self.pushButton_12.setObjectName(u"pushButton_12")

        self.verticalLayout_9.addWidget(self.pushButton_12)


        self.gridLayout.addLayout(self.verticalLayout_9, 0, 1, 1, 1)


        self.retranslateUi(Dialog)

        QMetaObject.connectSlotsByName(Dialog)
    # setupUi

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(QCoreApplication.translate("Dialog", u"Dialog", None))
        self.pushButton.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_2.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_3.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_4.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_17.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_18.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.label.setText(QCoreApplication.translate("Dialog", u"\u6807\u7b7e1", None))
        self.lineEdit.setText(QCoreApplication.translate("Dialog", u"11", None))
        self.lineEdit_2.setText(QCoreApplication.translate("Dialog", u"22", None))
        self.label_2.setText(QCoreApplication.translate("Dialog", u"\u6807\u7b7e2", None))
        self.pushButton_5.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
        self.pushButton_6.setText(QCoreApplication.translate("Dialog", u"PushButton", None))
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
    # retranslateUi

