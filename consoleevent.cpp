#include "consoleevent.h"
#include <QProcess>
#include <QFileInfo>
#include <QDir>
#include <QDebug>

consoleevent::consoleevent(QObject *parent) : QObject(parent)
{

}

void consoleevent::checkForNewFile() {
    QFileInfo check_file("/tmp/img.png");
    if (check_file.exists() && check_file.isFile()) {
        //There is a file there..
        QString rawStandardOut = "";
        QString rawStandardError = "";
        QProcess getMD5sum;
        getMD5sum.start("md5sum /tmp/img.png");
        getMD5sum.waitForFinished(20); //Only Wait 20ms
        rawStandardOut = getMD5sum.readAllStandardOutput();
        rawStandardError = getMD5sum.readAllStandardError();
        if (rawStandardOut.contains("/")) {
            qsizetype truncateAt = rawStandardOut.indexOf('/');
            rawStandardOut.truncate(truncateAt - 1);
            currentFileChecksum = rawStandardOut;
            if (currentFileChecksum != oldFileChecksum) {
                //File changed, copy to application local dir
                if (!QFile::copy("/tmp/img.png", QDir::currentPath()+"/img.png")) {
                    //Error copying file
                    qDebug() << "Error Copying file to application directory!\n";
                }
                else {
                    // Tell the UI to update to the new image!
                    oldFileChecksum = currentFileChecksum;
                    emit newImageReady();
                }
            }
        }

    }
    else {
        //Nope no file available

    }
}

void consoleevent::runCommand() {
//    QProcess cmdProcess;
    stdOutStr = "";
    stdErrStr = "";
//    cmdProcess.start("md5sum /tmp/img.png");
//    cmdProcess.waitForFinished(300); //Will hang here waiting to finish, should be quick
//    stdOutStr = cmdProcess.readAllStandardOutput();
//    stdErrStr = cmdProcess.readAllStandardError();
    emit commandComplete();
}

QString consoleevent::getStdOutput() {
    return stdOutStr;
}

QString consoleevent::getStdError(){
    return stdErrStr;
}
