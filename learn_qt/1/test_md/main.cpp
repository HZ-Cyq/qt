#include "dialog.h"
#include <QApplication>
#include <QMetaType>
#include <QTextStream>
#include <vector>

#ifdef Q_OS_WIN
#include <windows.h>
#endif

/*
 * ==================== 为什么需要这个函数？ ====================
 *
 * Qt6 的 qDebug() 默认输出流程：
 *
 *   QString("你好")
 *       │
 *       ▼
 *   toLocal8Bit()          ← 转换成"当前系统的本地编码"
 *       │                    在中文 Windows 上，本地编码 = GBK
 *       ▼
 *   fprintf(stderr, "%s", ...)   ← 把 GBK 字节写进 stderr
 *
 * 这就是乱码的根源：程序输出的是 GBK 字节。
 *
 *   场景 1：双击 exe
 *     → 控制台代码页是 936(GBK)
 *     → GBK 字节遇到 GBK 控制台 → 正好匹配 → 正常显示
 *
 *   场景 2：VS Code 按 F5
 *     → 集成终端底层按 UTF-8 解码
 *     → GBK 字节被当成 UTF-8 → 乱码
 *
 * 所以做法是：下面这个函数"接管" qDebug 的输出，
 * 强制转成 UTF-8，绕开 Qt 默认的 GBK 转换。
 *
 * qInstallMessageHandler() 是 Qt 官方的"日志接管"接口。
 */
static void utf8MessageHandler(QtMsgType, const QMessageLogContext &, const QString &msg) {
    /*
     * QTextStream 是 Qt 的文本流，能指定编码。
     * 这里把 stderr（qDebug 默认的输出流）包一层，
     * 强制 setEncoding(UTF-8)。
     */
    QTextStream out(stderr);
    out.setEncoding(QStringConverter::Utf8);   // ★ 关键：覆盖默认的 GBK，强制 UTF-8

    out << msg << Qt::endl;   // 输出消息 + 换行
    out.flush();              // 立即刷新，确保实时显示
}

int main(int argc, char *argv[]) {
#ifdef Q_OS_WIN
    /*
     * 这一段只对"双击 exe"那种"真控制台"生效。
     *
     * 真控制台默认代码页是 936(GBK)。
     * 现在我们让 qDebug 输出 UTF-8 字节，
     * 就必须把控制台也切成 65001(UTF-8)，
     * 否则 UTF-8 字节遇到 GBK 控制台，还是乱码。
     *
     * 注意：这只对真控制台有效。
     * VS Code 的终端是"管道"，这个函数不会生效，
     * 但 VS Code 终端本来就按 UTF-8 解码，
     * 所以两边正好都能对上。
     */
    SetConsoleOutputCP(CP_UTF8);   // 把控制台输出代码页切成 UTF-8
#endif

    /*
     * ★ 核心：告诉 Qt "以后 qDebug 都走我的自定义函数"。
     *
     * 从这一行之后，所有 qDebug()/qWarning() 等，
     * 都不再走 Qt 默认的 GBK 输出，而是走 utf8MessageHandler。
     */
    qInstallMessageHandler(utf8MessageHandler);

    qDebug() << "你好";
    qDebug() << "hello";

    qRegisterMetaType<std::vector<uint16_t>>("std::vector<uint16_t>");
    QApplication a(argc, argv);

    Dialog w;
    w.show();

    return QCoreApplication::exec();
}