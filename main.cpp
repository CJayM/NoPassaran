#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "record.h"

int main(int argc, char *argv[]) {
  QGuiApplication app(argc, argv);

  const QStringList moduleList = {
      "2domains",       "3d-mapper.com",    "3ddd",
      "4pda",           "AliExpress",       "Father",
      "Habr",           "Hugging Face",     "Postshot",
      "Skype",          "V-play",           "adobe",
      "aftershock",     "alfaFile",         "avito",
      "bonus",          "bt.astralinux.ru", "bytesbox.ru",
      "circuits.io",    "citylink",         "cjaym",
      "discord",        "dmkpress",         "dropbox",
      "fusionbrain.ai", "github",
  };

  QList<QObject *> dataList;
  for (const QString &module : moduleList)
    dataList.append(new Record(module));

  QQmlApplicationEngine engine;
  engine.setInitialProperties(
      {{"recordsModel", QVariant::fromValue(dataList)}});

  const QUrl url(QStringLiteral("qrc:/quick_pass/Main.qml"));
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);

  engine.load(url);

  return app.exec();
}
