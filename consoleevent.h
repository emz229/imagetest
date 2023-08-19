#ifndef CONSOLEEVENT_H
#define CONSOLEEVENT_H

#include <QObject>

class consoleevent : public QObject
{
    Q_OBJECT
public:
    consoleevent(QObject *parent = nullptr);
    Q_INVOKABLE void runCommand();
    Q_INVOKABLE QString getStdOutput();
    Q_INVOKABLE QString getStdError();

signals:
    void commandComplete();

private:
    QString stdErrStr;
    QString stdOutStr;
};

#endif // CONSOLEEVENT_H
