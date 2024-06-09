import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

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

  Future<void> showNotification(title_message, subtitle_message) async {
    const NotificationDetails notificationDetails = NotificationDetails(
      iOS : DarwinNotificationDetails(badgeNumber: 1));

    await flutterLocalNotificationsPlugin.show(
      0,title_message,subtitle_message,notificationDetails
    );
  }

  showNotification2(hour, min, sec, message) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Seoul'));
    flutterLocalNotificationsPlugin.zonedSchedule(
         2,
        "${message} 시작할 시간이에요:)",
        '고민은 멈추고 일단 시작해봐요!',
        makeDate(hour, min, sec),
        NotificationDetails(iOS: DarwinNotificationDetails(badgeNumber: 1)),
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents :  DateTimeComponents.time
    );
  }

  makeDate(hour, min, sec){
    var now = tz.TZDateTime.now(tz.local);
    var when = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, min, sec);
    if (when.isBefore(now)) {
      return when.add(Duration(days: 1));
    } else {
      return when;
    }
  }
}