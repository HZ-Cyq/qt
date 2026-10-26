import QtQuick
import QtQuick.Controls

// 第1课：最简单的Qt Quick应用
// 一个窗口 + 一段文字

ApplicationWindow {
    width: 400          // 窗口宽度
    height: 300         // 窗口高度
    visible: true       // 让窗口显示出来
    title: "我的第一个Qt应用1"

    // Text元素：显示文字
    Text {
        text: "Hello, Qt!"      // 显示的内容
        font.pixelSize: 32      // 字体大小
        anchors.centerIn: parent  // 在父容器（窗口）中居中
    }
}