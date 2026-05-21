import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {

  static final FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {

    const AndroidInitializationSettings
        androidInitializationSettings =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher');

    const InitializationSettings
        initializationSettings =
        InitializationSettings(
      android:
          androidInitializationSettings,
    );

    await flutterLocalNotificationsPlugin
        .initialize(initializationSettings);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {

    const AndroidNotificationDetails
        androidDetails =
        AndroidNotificationDetails(
      'favorite_channel',
      'Favorite Notification',

      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails
        notificationDetails =
        NotificationDetails(
      android: androidDetails,
    );

    await flutterLocalNotificationsPlugin
        .show(
      0,
      title,
      body,
      notificationDetails,
    );
  }
}