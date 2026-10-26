# Qt Quick 学习教程 📚

一个循序渐进的Qt Quick/QML学习项目，共10课，从零基础到完成一个完整的待办事项应用。

## 🚀 快速开始

### 环境要求
- Qt 6.12.0 (MinGW 64-bit)
- CMake
- VS Code（可选，配置了tasks.json可直接运行）

### 运行方式

**方式1：VS Code**
```
Ctrl + Shift + P → Tasks: Run Task → build and run
```

**方式2：命令行**
```powershell
$env:PATH = "D:/soft/qt/Tools/CMake_64/bin;D:/soft/qt/Tools/mingw1310_64/bin;D:/soft/qt/6.12.0/mingw_64/bin;" + $env:PATH
cmake --build "1/test1/build/Desktop_Qt_6_12_0_MinGW_64_bit_Debug" -- -j8
Start-Process "1/test1/build/Desktop_Qt_6_12_0_MinGW_64_bit_Debug/apptest1.exe"
```

**方式3：Qt Creator**
打开 `1/test1/CMakeLists.txt`

---

## 📖 课程目录

| 课程 | 主题 | 难度 | 文件 |
|------|------|------|------|
| 第1课 | 最简单的Qt应用（窗口+文字） | ⭐ | `lessons/lesson1.qml` |
| 第2课 | 颜色和矩形 | ⭐ | `lessons/lesson2.qml` |
| 第3课 | 鼠标交互 | ⭐⭐ | `lessons/lesson3.qml` |
| 第4课 | 布局 | ⭐⭐ | `lessons/lesson4.qml` |
| 第5课 | 按钮和状态 | ⭐⭐ | `lessons/lesson5.qml` |
| 第6课 | 属性绑定和动画 | ⭐⭐⭐ | `lessons/lesson6.qml` |
| 第7课 | 信号与槽 | ⭐⭐⭐ | `lessons/lesson7.qml` |
| 第8课 | 列表和模型 | ⭐⭐⭐ | `lessons/lesson8.qml` |
| 第9课 | 页面导航 | ⭐⭐⭐ | `lessons/lesson9.qml` |
| 第10课 | 综合项目：待办事项应用 | ⭐⭐⭐ | `Main.qml` |

---

## 📝 各课知识点总结

### 第1课：最简单的Qt应用
```qml
import QtQuick
import QtQuick.Controls

ApplicationWindow {
    width: 400
    height: 300
    visible: true
    title: "Hello Qt"
}
```
**核心概念：**
- QML文件结构
- `import` 导入模块
- `ApplicationWindow` 应用窗口
- 属性赋值语法

---

### 第2课：颜色和矩形
```qml
Rectangle {
    width: 200
    height: 100
    color: "#3498db"
    radius: 10
    border.color: "#2980b9"
    border.width: 2
}
```
**核心概念：**
- `Rectangle` 矩形元素
- 颜色表示（十六进制、颜色名）
- `radius` 圆角
- `border` 边框
- `Text` 文本元素
- `anchors` 锚点定位

---

### 第3课：鼠标交互 ⭐重点
```qml
MouseArea {
    anchors.fill: parent
    onClicked: { console.log("点击了！") }
    onPressed: { ... }
    onReleased: { ... }
}
```
**核心概念：**
- `MouseArea` 鼠标事件捕获区域
- 事件处理器：`onClicked`、`onPressed`、`onReleased`
- `id` 引用元素
- `parent` 父元素引用
- `console.log()` 调试输出

---

### 第4课：布局
```qml
ColumnLayout {
    spacing: 10
    Button { Layout.fillWidth: true }
}

RowLayout {
    spacing: 15
    Text { Layout.alignment: Qt.AlignHCenter }
}
```
**核心概念：**
- `ColumnLayout` 垂直布局
- `RowLayout` 水平布局
- `Layout.fillWidth/fillHeight` 填充
- `Layout.alignment` 对齐方式
- `spacing` 间距
- `anchors.margins` 边距

---

### 第5课：按钮和状态 ⭐重点
```qml
property bool isActive: false

Button {
    text: isActive ? "激活" : "未激活"
    onClicked: isActive = !isActive
}

Rectangle {
    color: isActive ? "#2ecc71" : "#95a5a6"
}
```
**核心概念：**
- `property` 自定义属性
- 三元表达式 `条件 ? 值1 : 值2`
- **属性绑定**：属性值自动跟随依赖变化
- `Button` 控件
- 状态切换模式

---

### 第6课：属性绑定和动画 ⭐重点
```qml
Behavior on x {
    NumberAnimation { duration: 500; easing.type: Easing.OutBounce }
}

Behavior on color {
    ColorAnimation { duration: 300 }
}

Timer {
    interval: 800
    repeat: false
    onTriggered: { ... }
}
```
**核心概念：**
- `Behavior on 属性` 属性变化自动动画
- `NumberAnimation` 数字动画
- `ColorAnimation` 颜色动画
- `duration` 动画时长
- `easing.type` 缓动函数
- `Timer` 定时器
- `opacity` 透明度

---

### 第7课：信号与槽 ⭐重点
```qml
// 声明信号
signal customClicked(string message)

// 发射信号
customClicked("你好！")

// 监听信号
Connections {
    target: someElement
    function onCustomClicked(message) {
        console.log(message)
    }
}
```
**核心概念：**
- 信号(signal) = 事件通知
- 槽(slot) = 响应函数
- `signal` 声明自定义信号
- `Connections` 监听其他元素的信号
- `component` 内联组件定义
- 信号参数传递

---

### 第8课：列表和模型
```qml
ListModel {
    id: myModel
    ListElement { name: "苹果"; price: 5.5 }
}

ListView {
    model: myModel
    delegate: Text { text: model.name }
}

// 模型操作
myModel.append({ name: "新项" })
myModel.remove(0)
myModel.setProperty(0, "name", "修改")
```
**核心概念：**
- `ListModel` 数据模型
- `ListElement` 数据项
- `Repeater` 简单重复（少量数据）
- `ListView` 可滚动列表（大量数据）
- `delegate` 数据项模板
- `model.xxx` 访问数据属性
- `model.index` 自动序号

---

### 第9课：页面导航
```qml
StackView {
    id: stackView
    initialItem: homePage
}

// 跳转
stackView.push(newPage, { param: value })
stackView.pop()
stackView.pop(null)  // 回到首页

// 接收参数
Page {
    property string param: ""
}
```
**核心概念：**
- `StackView` 页面栈
- `push()` 进入新页面
- `pop()` 返回上一页
- `Component` 组件模板
- `Page` 页面容器（带header）
- 页面间传参

---

### 第10课：综合项目 - 待办事项应用
综合运用所有知识点，完成一个功能完整的待办事项APP：

**功能：**
- ✅ 添加任务（输入框 + 回车）
- ✅ 完成任务（点击切换状态）
- ✅ 删除任务
- ✅ 筛选（全部/进行中/已完成）
- ✅ 进度条动画
- ✅ 清除已完成

**新知识点：**
- `TextField` 输入框
- `function` 自定义函数
- `Component.onCompleted` 初始化
- 条件显示 `visible: 表达式`

---

## 🗂️ 项目结构

```
learn_qt/
├── readme.md                 # 本文件
└── 1/test1/
    ├── CMakeLists.txt        # CMake配置
    ├── main.cpp              # C++入口
    ├── Main.qml              # 第10课：综合项目
    ├── lessons/              # 各课代码
    │   ├── lesson1.qml
    │   ├── lesson2.qml
    │   ├── ...
    │   └── lesson9.qml
    └── build/                # 构建目录
```

---

## 💡 核心思想

### QML声明式编程
```
传统方式：手动创建对象 → 设置属性 → 添加事件
QML方式：声明"是什么样子"，框架自动处理
```

### 属性绑定
```qml
// 当isActive变化时，color自动更新！
color: isActive ? "#2ecc71" : "#95a5a6"
```

### 数据驱动UI
```
ListModel(数据) → ListView(视图) → delegate(模板)
修改数据 → UI自动更新
```

---

## 🔗 学习资源

- [Qt QML官方文档](https://doc.qt.io/qt-6/qmlapplications.html)
- [Qt Quick Controls](https://doc.qt.io/qt-6/qtquickcontrols-index.html)
- [QML Book](https://www.qt.io/product/qt6/qml-book)

---

## 📅 学习记录

- 第1-5课：基础语法和交互 ✅
- 第6课：动画效果 ✅
- 第7课：信号与槽机制 ✅
- 第8课：列表和数据模型 ✅
- 第9课：页面导航 ✅
- 第10课：综合项目 ✅

**🎉 全部完成！**