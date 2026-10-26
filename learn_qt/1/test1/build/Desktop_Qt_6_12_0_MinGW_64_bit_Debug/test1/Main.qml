import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// 第10课：综合项目 - 待办事项应用
// 综合运用前9课所有知识！
// 包含：布局、状态、动画、信号、列表、页面导航

ApplicationWindow {
    width: 420
    height: 650
    visible: true
    title: "📝 待办事项"

    color: "#ecf0f1"

    // ⭐全局数据模型
    ListModel {
        id: todoModel
        ListElement { text: "学习Qt Quick基础"; done: true; priority: "高" }
        ListElement { text: "完成综合项目"; done: false; priority: "高" }
        ListElement { text: "复习动画效果"; done: false; priority: "中" }
    }

    // ⭐全局状态
    property int completedCount: 0
    property string filterMode: "all"  // all / active / done

    // 计算完成数量
    function updateCompletedCount() {
        var count = 0
        for (var i = 0; i < todoModel.count; i++) {
            if (todoModel.get(i).done) count++
        }
        completedCount = count
    }

    Component.onCompleted: updateCompletedCount()

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // ⭐顶部标题栏
        Rectangle {
            Layout.fillWidth: true
            height: 60
            color: "#3498db"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.rightMargin: 20

                Text {
                    text: "📝 待办事项"
                    color: "white"
                    font.pixelSize: 20
                    font.bold: true
                }

                Item { Layout.fillWidth: true }

                Text {
                    text: completedCount + "/" + todoModel.count + " 完成"
                    color: "#d6eaf8"
                    font.pixelSize: 14
                }
            }
        }

        // ⭐进度条
        Rectangle {
            Layout.fillWidth: true
            height: 6
            color: "#bdc3c7"

            Rectangle {
                width: parent.width * (todoModel.count > 0 ? completedCount / todoModel.count : 0)
                height: parent.height
                color: "#2ecc71"

                // ⭐动画：进度变化时平滑过渡
                Behavior on width {
                    NumberAnimation { duration: 300 }
                }
            }
        }

        // ⭐输入区域
        Rectangle {
            Layout.fillWidth: true
            Layout.margins: 15
            height: 50
            color: "white"
            radius: 25
            border.color: "#ddd"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.rightMargin: 5

                TextField {
                    id: inputField
                    Layout.fillWidth: true
                    placeholderText: "输入新任务..."
                    background: Item {}
                    font.pixelSize: 16

                    // ⭐回车添加任务
                    onAccepted: addButton.clicked()
                }

                Button {
                    id: addButton
                    text: "＋"
                    Layout.preferredWidth: 40
                    Layout.preferredHeight: 40
                    enabled: inputField.text.trim() !== ""

                    onClicked: {
                        todoModel.append({
                            text: inputField.text.trim(),
                            done: false,
                            priority: "中"
                        })
                        inputField.text = ""
                        updateCompletedCount()
                    }
                }
            }
        }

        // ⭐筛选按钮
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10

            Repeater {
                model: [
                    { name: "全部", mode: "all" },
                    { name: "进行中", mode: "active" },
                    { name: "已完成", mode: "done" }
                ]

                Button {
                    text: modelData.name
                    flat: filterMode !== modelData.mode
                    highlighted: filterMode === modelData.mode
                    onClicked: filterMode = modelData.mode
                }
            }
        }

        // ⭐任务列表
        ListView {
            id: todoList
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 15
            model: todoModel
            clip: true
            spacing: 10

            // ⭐空状态提示
            Text {
                anchors.centerIn: parent
                text: todoModel.count === 0 ? "🎉 没有任务，添加一个吧！" : ""
                color: "#95a5a6"
                font.pixelSize: 16
                visible: todoModel.count === 0
            }

            delegate: Rectangle {
                id: itemRoot
                width: todoList.width
                height: 60
                color: "white"
                radius: 12
                border.color: model.done ? "#2ecc71" : "#eee"

                // ⭐筛选逻辑
                visible: filterMode === "all" ||
                         (filterMode === "active" && !model.done) ||
                         (filterMode === "done" && model.done)

                // ⭐进入动画
                opacity: 0
                Component.onCompleted: {
                    opacity = 1
                }
                Behavior on opacity {
                    NumberAnimation { duration: 200 }
                }

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    anchors.rightMargin: 10

                    // ⭐完成状态圆圈
                    Rectangle {
                        width: 28
                        height: 28
                        radius: 14
                        color: model.done ? "#2ecc71" : "white"
                        border.color: model.done ? "#2ecc71" : "#bdc3c7"
                        border.width: 2

                        Text {
                            text: "✓"
                            color: "white"
                            anchors.centerIn: parent
                            visible: model.done
                        }

                        Behavior on color {
                            ColorAnimation { duration: 200 }
                        }
                    }

                    // ⭐任务文本
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 2

                        Text {
                            text: model.text
                            font.pixelSize: 16
                            font.strikeout: model.done
                            color: model.done ? "#95a5a6" : "#2c3e50"
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }

                        Text {
                            text: "优先级: " + model.priority
                            font.pixelSize: 11
                            color: model.priority === "高" ? "#e74c3c" : "#95a5a6"
                        }
                    }

                    // ⭐删除按钮
                    Button {
                        text: "✕"
                        flat: true
                        Layout.preferredWidth: 35
                        onClicked: {
                            todoModel.remove(model.index)
                            updateCompletedCount()
                        }
                    }
                }

                // ⭐点击切换完成状态
                MouseArea {
                    anchors.fill: parent
                    z: -1  // 在按钮下面
                    onClicked: {
                        todoModel.setProperty(model.index, "done", !model.done)
                        updateCompletedCount()
                    }
                }
            }
        }

        // ⭐底部统计
        Rectangle {
            Layout.fillWidth: true
            height: 50
            color: "white"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 20
                anchors.rightMargin: 20

                Text {
                    text: "共 " + todoModel.count + " 项"
                    color: "#7f8c8d"
                    font.pixelSize: 13
                }

                Item { Layout.fillWidth: true }

                Button {
                    text: "清除已完成"
                    flat: true
                    visible: completedCount > 0
                    onClicked: {
                        for (var i = todoModel.count - 1; i >= 0; i--) {
                            if (todoModel.get(i).done) {
                                todoModel.remove(i)
                            }
                        }
                        updateCompletedCount()
                    }
                }
            }
        }
    }
}