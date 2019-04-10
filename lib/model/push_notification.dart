import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotification {
  BuildContext context;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


  PushNotification(this.context) {
    init();
  }

  void init() {
    var initializationSettingsOnAndroid = new AndroidInitializationSettings('like');
    var initializationSettingsOnIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsOnAndroid, initializationSettingsOnIOS);

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);

  }


  Future onSelectNotification(String payload) {
    return showDialog(
        context: context,
        builder: (_) {
          return new AlertDialog(
            title: new Text("New notification"),
            content: new Text(payload),
          );
        }
    );
  }

  Future showNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: body,
    );
  }
}