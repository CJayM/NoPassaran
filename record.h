#pragma once

#include <QObject>

class Record : public QObject
{
    Q_OBJECT
public:
    explicit Record(QString name);

    QString name() const;
    void setName(QString name);

    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    // Q_PROPERTY(QString color READ color WRITE setColor NOTIFY colorChanged)

signals:
    void nameChanged();

private:
    QString _name;
};

