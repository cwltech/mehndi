// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _notifications =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const settings = InitializationSettings(android: android);
//     await _notifications.initialize(settings);
//   }

//   static Future<void> showNotification(String title, String body) async {
//     const android = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       channelDescription: 'channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const platform = NotificationDetails(android: android);

//     await _notifications.show(
//       0, // notification id
//       title,
//       body,
//       platform,
//     );
//   }
// }
