#include "expandedqmlengine.h"

expandedQmlEngine::expandedQmlEngine(QObject *parent) : QQmlApplicationEngine(parent)
{

}

void expandedQmlEngine::clearCache() {
    this->clearComponentCache();
}
