import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FlutterLocalNotification {
  
  FlutterLocalNotification();

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

  init() async {
    DarwinInitializationSettings iosInitializationSettings = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      iOS: iosInitializationSettings
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  requestNotificationPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true
        );
  }

  Future<void> showNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
      iOS : DarwinNotificationDetails(badgeNumber: 1));

    await flutterLocalNotificationsPlugin.show(
      0,'test title','test body',notificationDetails
    );
  }
}