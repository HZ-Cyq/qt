import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// 第7课：信号与槽 ⭐⭐⭐重点
// 学习signal、onXxx、Connections、自定义信号
// 前六课内容已保存到 lessons/ 目录

ApplicationWindow {
    width: 500
    height: 500
    visible: true
    title: "第7课：信号与槽"

    property int totalClicks: 0

    color: "#f5f5f5"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 12

        Text {
            text: "第7课：信号与槽"
            font.pixelSize: 22
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        Text {
            text: "信号 = 事件发生时发出的通知\n槽 = 收到信号后执行的代码"
            font.pixelSize: 13
            color: "#7f8c8d"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        // ⭐⭐演示1：内置信号（onClicked就是clicked信号的槽）
        Rectangle {
            Layout.fillWidth: true
            height: 80
            color: "#3498db"
            radius: 10

            Text {
                text: "演示1：内置信号\n点我触发clicked信号"
                color: "white"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
            }

            MouseArea {
                anchors.fill: parent
                // ⭐onClicked = clicked信号的槽函数
                onClicked: {
                    totalClicks++
                    console.log("clicked信号被触发！totalClicks =", totalClicks)
                }
            }
        }

        // ⭐⭐演示2：自定义信号
        MyButton {
            id: myBtn
            Layout.alignment: Qt.AlignHCenter
        }

        // ⭐⭐演示3：Connections - 监听其他元素的信号
        Rectangle {
            Layout.fillWidth: true
            height: 60
            color: "#2ecc71"
            radius: 10

            Text {
                id: greenText
                text: "演示3：我在监听myBtn的信号\n等待中..."
                color: "white"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
            }

            // ⭐⭐⭐核心重点：Connections元素
            Connections {
                target: myBtn   // 监听谁发出的信号

                // ⭐当myBtn发出customClicked信号时执行
                function onCustomClicked(message) {
                    greenText.text = "收到信号: " + message
                    console.log("Connections收到信号:", message)
                }
                function onDoubleClicked() {
                    greenText.text = "收到double clicked信号";
                }
            }
        }

        // ⭐⭐演示4：信号带参数
        Rectangle {
            Layout.fillWidth: true
            height: 60
            color: "#e67e22"
            radius: 10

            Text {
                id: orangeText
                text: "演示4：信号可以带参数\n等待中..."
                color: "white"
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
            }

            Connections {
                target: myBtn

                function onCountChanged(newCount) {
                    orangeText.text = "收到计数信号: " + newCount
                }
            }
        }

        // 显示总点击数
        Text {
            text: "总点击次数: " + totalClicks
            font.pixelSize: 16
            Layout.alignment: Qt.AlignHCenter
        }

        // 底部说明
        Text {
            text: "核心：signal发出 → onXxx/Connections接收"
            font.pixelSize: 12
            color: "#95a5a6"
            Layout.alignment: Qt.AlignHCenter
        }
    }

    // ⭐⭐⭐核心重点：自定义组件（包含自定义信号）
    component MyButton: Rectangle {
        id: btnRoot
        width: 200
        height: 50
        color: "#9b59b6"
        radius: 25

        // ⭐⭐⭐声明自定义信号
        signal customClicked(string message)   // 带string参数的信号
        signal countChanged(int newCount)      // 带int参数的信号
        signal doubleClicked() //

        property int clickCount: 0

        Text {
            text: "演示2：自定义信号\n点我发出信号 (" + btnRoot.clickCount + ")"
            color: "white"
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                btnRoot.clickCount++

                // ⭐⭐⭐发射信号（emit）
                btnRoot.customClicked("你好，我是第" + btnRoot.clickCount + "次点击！")
                btnRoot.countChanged(btnRoot.clickCount)

                console.log("信号已发射")
            }
            onDoubleClicked: {
                console.log("准备发送double clicked信号");
                btnRoot.doubleClicked();
            }
        }
    }
}