#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuick>
#include "consoleevent.h"
#include "expandedqmlengine.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    expandedQmlEngine engine;
    consoleevent eventHandler;

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.rootContext()->setContextProperty("$QmlEngine", &engine);
    engine.rootContext()->setContextProperty("consoleEvent", &eventHandler);
    engine.load(url);

    return app.exec();
}
