// import 'dart:convert';

// import 'package:app_settings/app_settings.dart';
// import 'package:catalougeapp/utils/localStorage.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class NotificationController extends GetxController {
//   RxBool isNavigateNotificationPage = false.obs;
//   RxString notificationToken = "".obs;
//   FirebaseMessaging firebaseNotification = FirebaseMessaging.instance;

//   LocalStorage localStorage = Get.put(LocalStorage());

//   Future<void> initNotification() async {
//     NotificationSettings settings =
//         await firebaseNotification.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       notificationToken.value = (await firebaseNotification.getToken())!;
//       // await pref.setNotificationToken(notificationToken.value);
//       // pref.getNotificationToken();
//       print("fcmtoken  ${notificationToken.value}");
//       await localStorage.saveNotification(notificationToken.value);
//       await localStorage.getNotiifcation();
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print("user provisional granted prmission");
//     } else {
//       Get.snackbar('Notification permission denied',
//           'please allow notification to receive updates');
//       Future.delayed(const Duration(seconds: 2), () {
//         AppSettings.openAppSettings(type: AppSettingsType.notification);
//       });
//     }
//   }

//   firebaseInit() {
//     FirebaseMessaging.onMessage.listen((message) {
//       print("all detail ");
//       print(message.notification!.title!);
//       print(message.notification!.body!);
//       print(message.data);
//     });
//   }

//   isTokenRefersh() {
//     firebaseNotification.onTokenRefresh.listen((event) {
//       event.toString();
//     });
//   }

//   initInfo() async {
//     final AndroidNotificationChannel channel = androidNotificationChannel();
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);

//     var androidInitallized =
//         const AndroidInitializationSettings("@mipmap/ic_launcher");

//     var initializationsetting =
//         InitializationSettings(android: androidInitallized);
//     FlutterLocalNotificationsPlugin().initialize(initializationsetting,
//         onDidReceiveNotificationResponse: (details) {
//       print("payload");
//       print(details);
//       // if (details.data['data'] == 'men') {
//       //   pageNavigation(const OrderDetailPage());
//       //   // Navigator.pushNamed(context, '/chat',
//       //   //     arguments: ChatArguments(message));
//       // }
//       // isNavigateNotificationPage.value = true;
//       // Get.to(const MainPage());
//     });

//     await FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       final RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification!.android;

//       AndroidNotificationDetails androidNotificationDetails =
//           AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channelDescription: channel.description,
//         priority: Priority.max,
//         playSound: false,
//         icon: "@mipmap/ic_launcher",
//       );
//       NotificationDetails platformchannelSpecific = NotificationDetails(
//         android: androidNotificationDetails,
//       );
//       FlutterLocalNotificationsPlugin().show(
//         0,
//         message.notification!.title,
//         message.notification!.body,
//         platformchannelSpecific,
//         payload: message.data['body'],
//       );

//       if (message.data['data'] == 'men') {
//         // pageNavigation(const OrderDetailPage());
//         // Navigator.pushNamed(context, '/chat',
//         //     arguments: ChatArguments(message));
//       }
//     });
//   }

//   sendPushMessage(String token, String body, String title) async {
//     try {
//       await http.post(
//           Uri.parse(
//               'https://fcm.googleapis.com/v1/projects/dawarjwellery/messages:send'),
//           headers: <String, String>{
//             "Content-Type": 'application/json',
//             'Authorization':
//                 'Bearer ya29.c.c0ASRK0GbFTr7MiBnpVnHbU_VDUxrHeCP8-m7j9K5fqH3xfbxfVlCezrW9m-GEULQ6NUzzRC8kd_3ux-6dS0hjSg2uo0CK14Z7-mFF5jQyz-06K4QrTd9-WpvJMdl6Wn0TdQB4V5o3LfnKmIcRT8LzTSkZ5DGCmYHcuwofigaS3mVctRgO6gLYZM-bHzyx_fYWDD6zHdM5JZ5EOPuuzyqIaUnnP3n-amJkC60xsUdJCbnyCAZlkjPkZAutCZEXanG17A98SYzZ30zBvycz6Ujrb0e4StLVvgk9HajCq94NOm0V-GTD5uEM3ItMnc_f_STDrYIUESCLX27S_kcFqHhMTwVqgFmhOOWAFyeoX1M3_-wpCE3VPHaaqrm26kBCE389A31-tOngzOFwiXnIrQI1U_IMR1_mBrFaJobRuFQQcl9zz43gO4alZ2qMFy7pkJy96hswYxtiZuq4g0arZkVqbz4k6Q3YiO-uWnj06VkJFpMZ8xhbgM3UwJgkqqhpRWZR_f5pqqxqlv_arqUyBnB_0un_fS4Jdfkrl_iBi_pck05a_or1ZdM_V5p-SI_ffgq8jwrrrpQjxfJ3dm7jhywZpUwes2Moe4i1ep-Jv7Vr-u20gm2VmIrxz5WXbV6yJS348-1-cb93nSpFnzhMUb-XWpt01_d3ZVp8cFW-M147-B_O00B78YlRpJl678FU-hYvid8YdB2S0Zd2l8MbxIdaF1s6jUUIY2gXiUUeUu1kssff8bFkc-j2otpqsRdVds4MS1SJX9gwUZgrOmjWbMeyFY80sqjzinlqckbypyaarvZStnnQVkZh8refSwQX9MOmazUUr3Ma9SnI5pffu_3tb-h5XmWkx853cJ7pu7oXWszl5lq7MMsjJn8fj6loa83gq2RpwFba-i7Fypip0VlyRWwb1VmsMb-uYO9nd7QinSwqW6SaUe1Int01-Mja7lo3nmOrpc39gwaw3fYpSBJwW5bR75nZ_9d2aIhzrq77WlFk71YpWx0hrS',
//           },
//           body: jsonEncode({
//             'priority': 'high',
//             'data': <String, dynamic>{
//               'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//               'status': 'done',
//               'body': body,
//               'title': title,
//             },
//             "notification": <String, dynamic>{
//               'title': title,
//               'body': body,
//               'android_channel_id': "nirmaan"
//             },
//             "to": token
//           }));
//     } catch (e) {}
//   }

//   androidNotificationChannel() => const AndroidNotificationChannel(
//         'high_importance_channel', // id
//         'High Importance Notifications', // title
//         description:
//             'This channel is used for important notifications.', // description
//         importance: Importance.max,
//       );

//   Future<bool> pushNotificationsAllUsers({
//     required String title,
//     required String body,
//   }) async {
//     String dataNotifications = '{ '
//         ' "to" : "/topics/top" , '
//         ' "notification" : {'
//         ' "title":"$title" , '
//         ' "body":"$body" '
//         ' } '
//         ' } ';

//     var response = await http.post(
//       Uri.parse("https://fcm.googleapis.com/fcm/send"),
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//         'Authorization':
//             'key= ${"AAAAUQ6EyNU:APA91bGDKC80FoiCw6oc6trhEzlEIGioCfjvhjwaSz2DUZ814sXiog6dbbGW3oA2vEY5Vyt88yo4Lbr2z-Vi8fC8NqxlRv8kA6NRGUrxVB_Jb5Hl0GL9B024OGs88kSaN6VtNuzI5HuM"}',
//       },
//       body: dataNotifications,
//     );

//     return true;
//   }
// }
