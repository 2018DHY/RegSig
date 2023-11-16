#include "mydb.h"
#include <QFile>
#include <QFileInfo>
#include <QTextStream>
#include <QGuiApplication>

MyDB::MyDB(QObject *parent)
    : QObject{parent}
{
    load();
}

bool MyDB::sigup(QString user, QString pass)
{
    if(_db.contains(user)){
        emit msg("已存在用户名");
        return false;

    }else{
        _db.insert(user,pass);
        emit msg("注册成功,快去登录吧");
        save();
        return true;
    }
}

bool MyDB::sigIn(QString user, QString pass)
{
    if(_db.contains(user)){
        if(_db[user]== pass){
            emit msg("登录成功");
            return true;
        }else{
            emit msg("密码错误");
            return false;

        }
    }else{
        emit msg("不存在该用户名");

        return false;

    }
}

void MyDB::load()
{
    QString temp=qApp->applicationDirPath();
    temp.append("/"+_filename);
    QFileInfo info(temp);
    if(info.exists()){
        QFile file(temp);
        if(file.open(QIODevice::ReadOnly)){
            QList<QString> header;
            while(!file.atEnd()) {
                auto line = QString::fromUtf8(file.readLine()).trimmed();
                if(line.isEmpty()) continue;
                header = line.split(",");
                for(auto begin = header.begin();begin!= header.end();begin++) {
                    *begin = begin->trimmed();
                }
                break;
            }

            while(!file.atEnd()) {
                auto line = file.readLine().trimmed();
                if(line.isEmpty()) continue;
                auto list = line.split(',');
                auto total = std::min(header.size(),list.size());

                if(total == 2){
                    _db.insert(list[0],list[1]);
                }

            }

        }else{
            return;
        }
    }

}

void MyDB::save()
{
    QString temp=qApp->applicationDirPath();
    temp.append("/"+_filename);
        QFile file(temp);
        if(file.open(QIODevice::WriteOnly)){
            QTextStream stream(&file);
        stream<<"user,pass\n";
            for(auto item=_db.begin();item!=_db.end();item++){
                QString temp=item.key();
                temp.append(",");
                temp.append(item.value());
                stream<<temp<<"\n";
            }
        }

}
