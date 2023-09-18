import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _requestPermissions() async {
  if (Platform.isAndroid) {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        FlutterLocalNotificationsPlugin().resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.requestPermission();
  }
}
