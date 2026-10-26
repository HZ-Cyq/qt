import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// 第9课：页面导航
// 学习StackView、页面切换、传参
// 前八课内容已保存到 lessons/ 目录

ApplicationWindow {
    width: 400
    height: 600
    visible: true
    title: "第9课：页面导航"

    color: "#f5f5f5"

    // ⭐⭐⭐核心重点：StackView - 页面栈
    // 像手机APP一样：push进入新页面，pop返回上一页
    StackView {
        id: stackView
        anchors.fill: parent

        // 初始页面
        initialItem: homePage
    }

    // ⭐⭐⭐首页组件
    Component {
        id: homePage

        Page {
            // Page是带header/footer的容器
            header: Rectangle {
                height: 70
                color: "#3498db"

                Text {
                    text: "首页"
                    color: "white"
                    font.pixelSize: 18
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                Text {
                    text: "🏠 欢迎来到首页"
                    font.pixelSize: 24
                    Layout.alignment: Qt.AlignHCenter
                }

                Text {
                    text: "StackView像一摞纸：\npush() = 放一张新纸在上面\npop() = 把最上面的纸拿走"
                    font.pixelSize: 14
                    color: "#7f8c8d"
                    horizontalAlignment: Text.AlignHCenter
                    Layout.alignment: Qt.AlignHCenter
                }

                Button {
                    text: "进入列表页 →"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 45

                    onClicked: {
                        // ⭐⭐⭐push：进入新页面
                        stackView.push(listPage)
                    }
                }

                Button {
                    text: "进入关于页 →"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 45

                    onClicked: {
                        // ⭐⭐⭐push时可以传参数！
                        stackView.push(aboutPage, {
                            userName: "Qt学习者",
                            fromPage: "首页"
                        })
                    }
                }
                
                Button {
                    text: "进入设置页 →"
                    Layout.alignment: Qt.AlignHCenter
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 45

                    onClicked: {
                        // ⭐⭐⭐push时可以传参数！
                        stackView.push(setPage, {
                            userName: "Qt学习者",
                            fromPage: "首页"
                        })
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }
    }

    // ⭐⭐⭐列表页组件
    Component {
        id: listPage

        Page {
            header: Rectangle {
                height: 50
                color: "#2ecc71"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 10

                    // ⭐返回按钮
                    Button {
                        text: "← 返回"
                        flat: true
                        onClicked: {
                            // ⭐⭐⭐pop：返回上一页
                            stackView.pop()
                        }
                    }

                    Text {
                        text: "列表页"
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                        Layout.alignment: Qt.AlignHCenter
                        Layout.fillWidth: true
                    }

                    // 占位，让标题居中
                    Item { width: 80 }
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 10

                Text {
                    text: "📋 这是列表页"
                    font.pixelSize: 22
                    Layout.alignment: Qt.AlignHCenter
                }

                // 简单列表
                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    model: ["项目 A", "项目 B", "项目 C", "项目 D", "项目 E"]
                    clip: true
                    spacing: 8

                    delegate: Rectangle {
                        width: ListView.view.width
                        height: 50
                        color: "white"
                        radius: 8
                        border.color: "#ddd"

                        Text {
                            text: modelData   // 简单数组用modelData
                            anchors.verticalCenter: parent.verticalCenter
                            x: 15
                            font.pixelSize: 16
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                // ⭐点击列表项进入详情页，传递数据
                                stackView.push(detailPage, {
                                    itemName: modelData,
                                    itemIndex: index
                                })
                            }
                        }
                    }
                }
            }
        }
    }

    // ⭐⭐⭐详情页组件（接收参数）
    Component {
        id: detailPage

        Page {
            // ⭐⭐⭐接收push时传来的参数
            property string itemName: ""
            property int itemIndex: -1

            header: Rectangle {
                height: 50
                color: "#e67e22"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 10

                    Button {
                        text: "← 返回"
                        flat: true
                        onClicked: stackView.pop()
                    }

                    Text {
                        text: "详情页"
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                        Layout.alignment: Qt.AlignHCenter
                        Layout.fillWidth: true
                    }

                    Item { width: 80 }
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                Text {
                    text: "📄 详情信息"
                    font.pixelSize: 22
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 120
                    color: "white"
                    radius: 10

                    ColumnLayout {
                        anchors.centerIn: parent

                        Text {
                            // ⭐显示传过来的参数
                            text: "名称: " + itemName
                            font.pixelSize: 18
                        }

                        Text {
                            text: "索引: " + itemIndex
                            font.pixelSize: 14
                            color: "#7f8c8d"
                        }
                    }
                }

                Button {
                    text: "返回首页（清空栈）"
                    Layout.alignment: Qt.AlignHCenter
                    onClicked: {
                        // ⭐⭐⭐pop(null)：清空栈，回到初始页面
                        stackView.pop(null)
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }
    }

    // ⭐⭐⭐设置页组件（接收参数）
    Component {
        id: setPage

        Page {

            header: Rectangle {
                height: 50
                color: "#9b59b6"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 10

                    Button {
                        text: "← 返回"
                        flat: true
                        onClicked: stackView.pop()
                    }

                    Text {
                        text: "设置页"
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                        Layout.alignment: Qt.AlignHCenter
                        Layout.fillWidth: true
                    }

                    Item { width: 80 }
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                Text {
                    text: "ℹ️ 设置"
                    font.pixelSize: 22
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                }

                 Component {
        id: aboutPage

        Page {
            property string userName: "访客"
            property string fromPage: "未知"

            header: Rectangle {
                height: 50
                color: "#9b59b6"

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 10

                    Button {
                        text: "← 返回"
                        flat: true
                        onClicked: stackView.pop()
                    }

                    Text {
                        text: "设置页"
                        color: "white"
                        font.pixelSize: 18
                        font.bold: true
                        Layout.alignment: Qt.AlignHCenter
                        Layout.fillWidth: true
                    }

                    Item { width: 80 }
                }
            }

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 15

                Text {
                    text: "ℹ️ 关于"
                    font.pixelSize: 22
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 150
                    color: "white"
                    radius: 10

                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 10

                        Text {
                            text: "用户: " + userName
                            font.pixelSize: 16
                        }

                        Text {
                            text: "来自: " + fromPage
                            font.pixelSize: 16
                        }
                    }
                }

            }
        }
                 }
    }
    }
    }
}