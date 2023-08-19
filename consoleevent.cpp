#include "consoleevent.h"
#include <QProcess>

consoleevent::consoleevent(QObject *parent) : QObject(parent)
{

}

void consoleevent::runCommand() {
    QProcess cmdProcess;
    cmdProcess.start("md5sum /tmp/img.png");
    cmdProcess.waitForFinished(300); //Will hang here waiting to finish, should be quick
    stdOutStr = cmdProcess.readAllStandardOutput();
    stdErrStr = cmdProcess.readAllStandardError();
    emit commandComplete();
}

QString consoleevent::getStdOutput() {
    return stdOutStr;
}

QString consoleevent::getStdError(){
    return stdErrStr;
}
