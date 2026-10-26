import QtQuick
import QtQuick.Controls

// 第3课：鼠标交互 ⭐重点
// 学习MouseArea、点击事件、状态变化
// 前两课内容已保存到 lessons/ 目录

ApplicationWindow {
    width: 400
    height: 300
    visible: true
    title: "第3课：鼠标交互"

    // 提示文字
    Text {
        id: tipText
        text: "点击下面的矩形试试！"
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        y: 20
    }

    // ⭐重点：可点击的矩形
    Rectangle {
        id: clickableRect           // id用于在代码中引用这个元素
        width: 200
        height: 120
        anchors.horizontalCenter: parent.horizontalCenter
        y: 60
        color: "#3498db"
        radius: 10

        Text {
            id: rectText
            text: "点我！"
            color: "white"
            font.pixelSize: 20
            anchors.centerIn: parent
        }

        // ⭐⭐核心重点：MouseArea - 处理鼠标事件
        MouseArea {
            anchors.fill: parent    // 覆盖整个矩形区域

            // 点击事件处理
            onClicked: {
                // 每次点击切换颜色
                if (clickableRect.color == "#3498db") {
                    clickableRect.color = "#e74c3c"     // 变红色
                    rectText.text = "再点我！"
                } else {
                    clickableRect.color = "#3498db"     // 变回蓝色
                    rectText.text = "点我！"
                }
                console.log("3 onClicked");
            }

            // 鼠标按下事件
            onPressed: {
                clickableRect.opacity = 0.7   // 按下时变半透明
                rectText.text = "我正被点中"
                console.log("1 onPressed");
            }

            // 鼠标释放事件
            onReleased: {
                clickableRect.opacity = 1.0   // 释放时恢复不透明
                console.log("2 onReleased");
            }
        }
    }

    // 显示点击次数
    property int clickCount: 0      // ⭐自定义属性：记录点击次数

    Text {
        text: "点击次数: " + clickCount
        font.pixelSize: 16
        anchors.horizontalCenter: parent.horizontalCenter
        y: 200
    }

    // 连接信号：矩形点击时增加计数
    Connections {
        target: clickableRect
        // 这里暂时留空，第7课会详细讲解
    }
}