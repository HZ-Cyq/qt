import QtQuick
import QtQuick.Controls

// 第2课：颜色和矩形
// 学习Rectangle元素和颜色属性
// 第1课内容已保存到 lessons/lesson1.qml

ApplicationWindow {
    width: 400          // 窗口宽度
    height: 300         // 窗口高度
    visible: true       // 让窗口显示出来
    title: "第2课：颜色和矩形"

    // 第1课的Text元素（保留在顶部）
    Text {
        id: helloText               // 给元素起个名字，方便引用
        text: "Hello, Qt!"
        font.pixelSize: 24
        anchors.horizontalCenter: parent.horizontalCenter  // 水平居中
        y: 20                       // 距离顶部20像素
    }

    // 第2课新内容：Rectangle矩形
    Rectangle {
        width: 200                  // 矩形宽度
        height: 120                 // 矩形高度
        anchors.horizontalCenter: parent.horizontalCenter  // 水平居中
        y: 80                       // 距离顶部80像素
        color: "#3498db"            // 背景颜色（蓝色）
        radius: 10                  // 圆角大小
        border.width: 2             // 边框宽度
        border.color: "#2c3e50"     // 边框颜色

        // Rectangle里面可以放其他元素
        Text {
            text: "我是一个矩形"
            color: "white"          // 文字颜色
            anchors.centerIn: parent  // 在矩形中居中
        }
    }
}