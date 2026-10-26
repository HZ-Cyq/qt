import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// 第6课：属性绑定和动画 ⭐⭐重点
// 学习Behavior动画、NumberAnimation、ColorAnimation
// 前五课内容已保存到 lessons/ 目录

ApplicationWindow {
    width: 500
    height: 450
    visible: true
    title: "第6课：属性绑定和动画"

    property bool moved: false      // 控制方块位置
    property bool moved_y: false    // 控制方块上下
    property bool big: false        // 控制方块大小
    property bool colored: false    // 控制方块颜色

    color: "#f5f5f5"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        Text {
            text: "第6课：属性绑定和动画"
            font.pixelSize: 22
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        // 动画演示区域
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "#ecf0f1"
            radius: 10
            border.color: "#bdc3c7"

            // ⭐⭐核心重点：带动画的方块
            Rectangle {
                id: animBox
                width: big ? 120 : 60         // 大小绑定到状态
                height: big ? 120 : 60
                x: moved ? parent.width - width - 20 : 20   // 位置绑定到状态
                y: moved_y ? parent.height - height - 20 : 20 // 上下位置也绑定到状态
                color: colored ? "#e74c3c" : "#3498db"      // 颜色绑定到状态
                radius: big ? 60 : 10

                Text {
                    text: "我"
                    color: "white"
                    anchors.centerIn: parent
                    font.pixelSize: 20
                }

                // ⭐⭐⭐核心重点：Behavior - 属性变化时自动添加动画
                Behavior on x {
                    NumberAnimation { duration: 500; easing.type: Easing.InOutQuad }
                    // duration: 动画时长（毫秒）
                    // easing.type: 缓动函数（OutBounce = 弹跳效果，Linear = 匀速， InOutQuad = 先慢后快再慢）
                }
                Behavior on y {
                    NumberAnimation { duration: 500; easing.type: Easing.OutBounce}
                }
                

                Behavior on width {
                    NumberAnimation { duration: 300 }
                }
                Behavior on height {
                    NumberAnimation { duration: 300 }
                }
                Behavior on radius {
                    NumberAnimation { duration: 300 }
                }
                Behavior on color {
                    ColorAnimation { duration: 500 }
                    // ⭐ColorAnimation专门用于颜色过渡
                }
            }
        }

        // 控制按钮区域
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Button {
                text: moved ? "← 移回左边" : "移到右边 →"
                onClicked: {
                    moved = !moved    // 切换状态，动画自动执行！
                }
            }

            Button {
                text: moved_y ? "↑ 移回上边" : "移到下边 ↓"
                onClicked: {
                    moved_y = !moved_y    // 切换状态，动画自动执行！
                }
            }

            Button {
                text: big ? "缩小" : "放大"
                onClicked: {
                    big = !big
                }
            }

            Button {
                text: colored ? "变蓝色" : "变红色"
                onClicked: {
                    colored = !colored
                }
            }
        }

        // 分隔线
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: "#bdc3c7"
        }

        // ⭐第二个演示：透明度动画
        Text {
            text: "点击下面的方块，它会淡出再淡入"
            font.pixelSize: 14
            color: "#7f8c8d"
            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle {
            id: fadeBox
            width: 200
            height: 60
            Layout.alignment: Qt.AlignHCenter
            color: "#9b59b6"
            radius: 10
            opacity: 1.0

            Text {
                text: "点我淡出"
                color: "white"
                anchors.centerIn: parent
            }

            // ⭐Behavior也可以用于opacity
            Behavior on opacity {
                // 控制opacity变化时间
                NumberAnimation { duration: 3000 }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // ⭐连续动画：先淡出，再淡入
                    fadeBox.opacity = 0.1
                    // 使用Timer延迟恢复, 5000毫秒后执行timer里的ontriggered方法
                    fadeTimer.start()
                }
            }

            // ⭐Timer：定时器
            Timer {
                id: fadeTimer
                interval: 5000       // 5000毫秒后触发
                repeat: false       // 只执行一次
                onTriggered: {
                    console.log("on triggered");
                    fadeBox.opacity = 1.0
                }
            }
        }

        // 底部说明
        Text {
            text: "核心：修改属性 → Behavior自动播放动画"
            font.pixelSize: 12
            color: "#95a5a6"
            Layout.alignment: Qt.AlignHCenter
        }
    }
}