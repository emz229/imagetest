#ifndef CONSOLEEVENT_H
#define CONSOLEEVENT_H

#include <QObject>

class consoleevent : public QObject
{
    Q_OBJECT
public:
    consoleevent(QObject *parent = nullptr);
    Q_INVOKABLE void checkForNewFile();
    Q_INVOKABLE void runCommand();
    Q_INVOKABLE QString getStdOutput();
    Q_INVOKABLE QString getStdError();

signals:
    void commandComplete();
    void newImageReady();

private:
    QString stdErrStr;
    QString stdOutStr;
    QString currentFileChecksum;
    QString oldFileChecksum;
};

#endif // CONSOLEEVENT_H
