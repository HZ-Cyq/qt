import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// 第8课：列表和模型
// 学习ListModel、Repeater、ListView
// 前七课内容已保存到 lessons/ 目录

ApplicationWindow {
    width: 450
    height: 550
    visible: true
    title: "第8课：列表和模型"

    color: "#f5f5f5"

    // ⭐⭐⭐核心重点：ListModel - 数据模型
    ListModel {
        id: fruitModel

        // 每条数据叫一个"元素"，里面可以有多个属性
        ListElement { name: "苹果"; price: 5.5; color: "#e74c3c"; emoji: "🍎" }
        ListElement { name: "香蕉"; price: 3.0; color: "#f1c40f"; emoji: "🍌" }
        ListElement { name: "葡萄"; price: 12.0; color: "#9b59b6"; emoji: "🍇" }
        ListElement { name: "橙子"; price: 4.5; color: "#e67e22"; emoji: "🍊" }
        ListElement { name: "西瓜"; price: 8.0; color: "#27ae60"; emoji: "🍉" }
        ListElement { name: "新水果"; price: 11.0; color: "#27ae60"; emoji: "🍉" }
    }

    // 待办事项模型
    ListModel {
        id: todoModel
        ListElement { text: "学习Qt Quick"; done: true }
        ListElement { text: "写一个待办应用"; done: false }
        ListElement { text: "完成第8课练习"; done: false }
    }

    ListModel {
        id: addressModel
        ListElement { name:"a"; telephone:"111" }
        ListElement { name:"b"; telephone:"222" }
        ListElement { name:"c"; telephone:"333" }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 15
        spacing: 10

        Text {
            text: "第8课：列表和模型"
            font.pixelSize: 22
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
        }

        // ⭐⭐演示1：Repeater - 简单重复
        Text {
            text: "演示1：Repeater（水果价格表）"
            font.pixelSize: 14
            color: "#7f8c8d"
        }

        Rectangle {
            Layout.fillWidth: true
            height: 200
            color: "white"
            radius: 10
            border.color: "#ddd"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 5

                // ⭐⭐⭐Repeater：把模型中的每条数据变成一个组件
                Repeater {
                    model: fruitModel   // 数据源

                    // ⭐delegate：每条数据长什么样
                    delegate: RowLayout {
                        Layout.fillWidth: true
                        spacing: 10

                        // model.xxx 访问当前这条数据的属性
                        Text { text: model.emoji; font.pixelSize: 20 }
                        Text { text: model.name; font.pixelSize: 16 }
                        Text {
                            text: "¥" + model.price.toFixed(1)
                            font.pixelSize: 14
                            color: model.color
                        }
                        Text {
                            text: model.index + 1 + ""   // index是自动的序号
                            font.pixelSize: 12
                            color: model.color
                        }
                        // 弹性空间把价格推到右边
                        //Item { Layout.fillWidth: true }
                    }
                }
            }
        }

        // ⭐⭐演示2：ListView - 可滚动列表
        Text {
            text: "演示2：ListView（待办事项，可点击切换完成状态）"
            font.pixelSize: 14
            color: "#7f8c8d"
        }

        ListView {
            id: todoList
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: todoModel
            clip: true          // 超出部分裁剪
            spacing: 8

            // ⭐⭐⭐delegate：每个待办项的样子
            delegate: Rectangle {
                width: todoList.width
                height: 50
                color: model.done ? "#d5f5e3" : "white"
                radius: 8
                border.color: model.done ? "#27ae60" : "#ddd"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15

                    Text {
                        text: model.done ? "✓" : "○"
                        font.pixelSize: 20
                        color: model.done ? "#27ae60" : "#95a5a6"
                    }

                    Text {
                        text: model.text
                        font.pixelSize: 16
                        // 完成的划掉
                        font.strikeout: model.done
                        color: model.done ? "#95a5a6" : "#2c3e50"
                    }

                    Item { Layout.fillWidth: true }

                    Text {
                        text: model.index + 1 + ""   // index是自动的序号
                        font.pixelSize: 12
                        color: "#bdc3c7"
                    }
                }

                // ⭐点击切换完成状态
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        // ⭐⭐⭐修改模型数据
                        todoModel.setProperty(model.index, "done", !model.done)
                    }
                }
            }
        }

        // 操作按钮
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10

            Button {
                text: "添加待办"
                onClicked: {
                    // ⭐⭐⭐向模型添加数据
                    todoModel.append({ text: "新任务 " + (todoModel.count + 1), done: false })
                }
            }

            Button {
                text: "删除最后一项"
                onClicked: {
                    if (todoModel.count > 0) {
                        // ⭐⭐⭐删除模型数据
                        todoModel.remove(todoModel.count - 1)
                    }
                }
            }
        }

        // 显示数量
        Text {
            text: "共 " + todoModel.count + " 项"
            font.pixelSize: 12
            color: "#95a5a6"
            Layout.alignment: Qt.AlignHCenter
        }


       // ⭐⭐演示3：ListView - 通讯录
        Text {
            text: "演示3：通讯录"
            font.pixelSize: 14
        }

        ListView {
            id: addressList
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: addressModel
            clip: true          // 超出部分裁剪
            spacing: 8

            // ⭐⭐⭐delegate：每个待办项的样子
            delegate: Rectangle {
                width: addressList.width
                height: 50
                //color: model.done ? "#d5f5e3" : "white"
                radius: 8
                //border.color: model.done ? "#27ae60" : "#ddd"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15

                    Text {
                        text: model.name
                        // font.pixelSize: 20
                        // color: model.done ? "#27ae60" : "#95a5a6"
                    }

                    Text {
                        text: model.telephone
                        // font.pixelSize: 16
                        // // 完成的划掉
                        // font.strikeout: model.done
                        // color: model.done ? "#95a5a6" : "#2c3e50"
                    }

                    Item { Layout.fillWidth: true }

                    Text {
                        text: model.index + 1 + ""   // index是自动的序号
                        font.pixelSize: 12
        //                color: "#bdc3c7"
                    }
                }

                // ⭐点击切换完成状态
                // MouseArea {
                //     anchors.fill: parent
                //     onClicked: {
                //         // ⭐⭐⭐修改模型数据
                //         todoModel.setProperty(model.index, "done", !model.done)
                //     }
                // }
            }
        }

        // 操作按钮
        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10

            Button {
                text: "添加新用户"
                onClicked: {
                    // ⭐⭐⭐向模型添加数据
                    addressModel.append(
                            { 
                                name: "新用户 " + (addressModel.count + 1), 
                                telephone: (addressModel.count + 1) + "__" + (addressModel.count + 1)
                            }
                        )
                }
            }

            Button {
                text: "删除最后一位用户"
                onClicked: {
                    if (addressModel.count > 0) {
                        // ⭐⭐⭐删除模型数据
                        addressModel.remove(addressModel.count - 1)
                    }
                }
            }
        }

        // 显示数量
        Text {
            text: "共 " + addressModel.count + " 项"
            font.pixelSize: 12
            color: "#95a5a6"
            Layout.alignment: Qt.AlignHCenter
        }

    }
}