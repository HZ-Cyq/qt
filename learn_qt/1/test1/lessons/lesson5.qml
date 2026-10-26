import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// 第5课：按钮和状态 ⭐重点
// 学习Button控件、状态管理、property绑定
// 前四课内容已保存到 lessons/ 目录

ApplicationWindow {
    width: 450
    height: 400
    visible: true
    title: "第5课：按钮和状态" + ",欢迎," + userName;

    // ⭐⭐核心重点：自定义属性（状态）
    property int count: 0                    // 计数器
    property bool isDarkMode: false          // 深色模式开关
    property color bgColor: isDarkMode ? "#2c3e50" : "#ecf0f1"   // 背景色随状态变化
    property color textColor: isDarkMode ? "white" : "#2c3e50"   // 文字色随状态变化
    property string userName: "访客" //
    // 背景色绑定到窗口
    color: bgColor

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 15

        // 标题
        Text {
            text: "第5课：按钮和状态"
            font.pixelSize: 24
            font.bold: true
            color: textColor    // ⭐颜色绑定到状态
            Layout.alignment: Qt.AlignHCenter
        }

        // ⭐显示状态的文字
        Text {
            text: "当前计数: " + count + (isDarkMode ? " | 深色模式" : " | 浅色模式")
            font.pixelSize: 16
            color: textColor
            Layout.alignment: Qt.AlignHCenter
        }

        // ⭐⭐核心重点：Button控件
        Button {
            id: countButton
            text: "点击 +1"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 150
            Layout.preferredHeight: 40

            // ⭐⭐按钮点击事件
            onClicked: {
                count++     // 每次点击计数器+1
                console.log("按钮被点击，count =", count)
            }
        }

        // ⭐第二行按钮
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Button {
                text: "重置"
                onClicked: {
                    count = 0   // 重置计数器
                }
            }

            Button {
                text: "-1"
                onClicked: {
                    count--     // 计数器-1
                }
            }

            Button {
                text: "+10"
                onClicked: {
                    count += 10
                }
            }
            
            Button {
                text: "+20"
                onClicked: {
                    count += 20
                }
            }
        }
        Button {
            text: "修改访客名字"
            onClicked: {
                userName = "新访客"
            }
        }
        // 分隔线
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: textColor
            opacity: 0.3
        }

        // ⭐切换深色模式的按钮
        Button {
            text: isDarkMode ? "☀ 切换到浅色模式" : "🌙 切换到深色模式"
            // ⭐按钮文字也绑定到状态
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 200
            Layout.preferredHeight: 40

            onClicked: {
                isDarkMode = !isDarkMode   // ⭐切换布尔状态
                console.log("深色模式:", isDarkMode)
            }
        }

        // ⭐CheckBox控件
        CheckBox {
            id: agreeCheckBox
            text: "我同意条款"
            checked: false
            Layout.alignment: Qt.AlignHCenter

            // 文字颜色
            contentItem: Text {
                text: agreeCheckBox.text
                color: textColor
                verticalAlignment: Text.AlignVCenter
                leftPadding: agreeCheckBox.indicator.width + 8
            }
        }

        // ⭐显示CheckBox状态
        Text {
            text: agreeCheckBox.checked ? "✓ 已同意" : "✗ 未同意"
            font.pixelSize: 14
            color: agreeCheckBox.checked ? "#27ae60" : "#e74c3c"
            Layout.alignment: Qt.AlignHCenter
        }

        // 弹性空间
        Item {
            Layout.fillHeight: true
        }

        // 底部提示
        Text {
            text: "提示：所有显示都在响应状态变化！"
            font.pixelSize: 12
            color: textColor
            opacity: 0.6
            Layout.alignment: Qt.AlignHCenter
        }
    }
}