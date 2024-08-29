#include "record.h"


Record::Record(QString name) : QObject(), _name(name) {}

QString Record::name() const
{
    return _name;
}

void Record::setName(QString name)
{
    _name = name;
    emit nameChanged();
}
