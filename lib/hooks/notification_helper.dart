import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final _notificationa = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails("channelId", "channelName",importance: Importance.high),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload
  }) async => _notificationa.show(id, title, body, await _notificationDetails());

  static Future showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime schedule,
  }) async => _notificationa.show(id, title, body, await _notificationDetails());

}