import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/view/login/view/loginPage.dart';
import 'package:catalougeapp/view/mainPage/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = "";
  // String _fcmToken = "";
  @override
  void initState() {
    getToken();
    pageNavigation();
    requestNotificationPermission();
    // initFirebaseMessaging();
    super.initState();
  }

  Future<void> requestNotificationPermission() async {
    // ✅ Ask for permission (Android 13+ & iOS)
    var status = await Permission.notification.status;

    if (status.isDenied || status.isRestricted) {
      status = await Permission.notification.request();
    }

    if (status.isGranted) {
      debugPrint(" Notification permission granted");
      // Initialize OneSignal after permission is granted
      OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

      // Initialize with your OneSignal App ID
      OneSignal.initialize(dotenv.env['AppId']!);
      // Use this method to prompt for push notifications.
      // We recommend removing this method after testing and instead use In-App Messages to prompt for notification permission.
      // await OneSignal.Notifications.requestPermission(true);
    } else {
      debugPrint(" Notification permission denied");
    }
  }

  // check if action perform on button to notification

//   Future<void> checkNotificationPermission() async {
//   var status = await Permission.notification.status;
//   if (status.isGranted) {
//     print(" Notifications allowed");
//   } else {
//     print(" Notifications disabled");
//   }
// }

  pageNavigation() async {
    await Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      token.isEmpty
          ? Get.offAll(const LoginPage())
          : Get.offAll(const MainPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: Get.height,
            width: Get.width,
            color: KColors.white,
            child: CustomImageProvider.assetsImage(
                //image: ConstantValue.splashgif,
                image: 'assets/images/Mobile apps screening2 (1).gif',
                height: Get.height,
                width: Get.width,
                boxFit: BoxFit.cover)));
  }

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString("userId2")!;
      // debugPrint("userid");
      // print(token);
    });
    return token;
  }
}
