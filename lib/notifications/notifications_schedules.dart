import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _scheduleDailyNotification() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Meow!',
    'Meow! Meow! Meow!',
    _nextInstance(),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily notification channel id',
        'daily notification channel name',
        channelDescription: 'daily notification description',
      ),
    ),
    uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
    androidAllowWhileIdle: true,
  );
}

tz.TZDateTime _nextInstance() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    8,
    0,
  );
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}
