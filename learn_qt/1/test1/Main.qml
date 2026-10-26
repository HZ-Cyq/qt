import QtQuick
import QtQuick.Controls
import QtQuick.Layouts   // ⭐第4课需要导入布局模块

// 第4课：布局
// 学习RowLayout、ColumnLayout、GridLayout
// 前三课内容已保存到 lessons/ 目录

ApplicationWindow {
    width: 500
    height: 400
    visible: true
    title: "第4课：布局"

    // ⭐⭐核心重点：ColumnLayout - 垂直排列子元素
    ColumnLayout {
        anchors.fill: parent      // 填满整个窗口
        anchors.margins: 20       // 与窗口边缘保持20像素间距
        spacing: 15               // 子元素之间的间距

        // 标题
        Text {
            text: "第4课：布局学习"
            font.pixelSize: 24
            font.bold: true
            Layout.alignment: Qt.AlignHCenter   // 在布局中水平居中
        }

        // ⭐RowLayout - 水平排列子元素
        RowLayout {
            Layout.fillWidth: true    // 填满可用宽度
            spacing: 10

            Rectangle {
                width: 80
                height: 50
                color: "#e74c3c"      // 红色
                radius: 5
                Text { text: "红"; color: "white"; anchors.centerIn: parent }
            }

            Rectangle {
                width: 80
                height: 50
                color: "#2ecc71"      // 绿色
                radius: 5
                Text { text: "绿"; color: "white"; anchors.centerIn: parent }
            }

            Rectangle {
                width: 80
                height: 50
                color: "#3498db"      // 蓝色
                radius: 5
                Text { text: "蓝"; color: "white"; anchors.centerIn: parent }
            }

            // ⭐Layout.fillWidth: true 让最后一个元素填满剩余空间
            Rectangle {
                //Layout.fillWidth: true
                height: 50
                color: "#9b59b6"      // 紫色
                radius: 5
                Text { text: "我填满剩余空间"; color: "white"; anchors.centerIn: parent }
            }
        }

        // ⭐GridLayout - 网格布局
        GridLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true   // 填满剩余高度
            columns: 3                // 每行3列
            rows: 2                   // 2行
            columnSpacing: 10
            rowSpacing: 10

            // 网格中的元素按顺序排列：第1行
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#f39c12"
                radius: 5
                Text { text: "1"; anchors.centerIn: parent; font.pixelSize: 20 }
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#1abc9c"
                radius: 5
                Text { text: "2"; anchors.centerIn: parent; font.pixelSize: 20 }
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#e67e22"
                radius: 5
                Text { text: "3"; anchors.centerIn: parent; font.pixelSize: 20 }
            }

            // 第2行
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#34495e"
                radius: 5
                Text { text: "4"; color: "white"; anchors.centerIn: parent; font.pixelSize: 20 }
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#16a085"
                radius: 5
                Text { text: "5"; anchors.centerIn: parent; font.pixelSize: 20 }
            }
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "#c0392b"
                radius: 5
                Text { text: "6"; anchors.centerIn: parent; font.pixelSize: 20 }
            }
        }

        // 底部提示
        Text {
            text: "试试调整窗口大小，布局会自动适应！"
            font.pixelSize: 14
            color: "gray"
            Layout.alignment: Qt.AlignHCenter
        }
    }
}