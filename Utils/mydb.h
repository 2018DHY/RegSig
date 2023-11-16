#ifndef MYDB_H
#define MYDB_H

#include <QObject>
#include <QMap>

class MyDB : public QObject
{
    Q_OBJECT
public:
    explicit MyDB(QObject *parent = nullptr);

    Q_INVOKABLE bool sigup(QString user,QString pass);//注册
    Q_INVOKABLE bool sigIn(QString user,QString pass);//登录

private:
    void load();
    void save();


signals:
    void msg(QString msg);

private:
    QString _filename="store.csv";
    QMap<QString,QString> _db;


};

#endif // MYDB_H
