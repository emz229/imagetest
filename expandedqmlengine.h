#ifndef EXPANDEDQMLENGINE_H
#define EXPANDEDQMLENGINE_H

#pragma once

#include <QQmlApplicationEngine>

class expandedQmlEngine : public QQmlApplicationEngine
{
    Q_OBJECT
public:
    explicit expandedQmlEngine(QObject *parent = nullptr);
    Q_INVOKABLE void clearCache();
};

#endif // EXPANDEDQMLENGINE_H
