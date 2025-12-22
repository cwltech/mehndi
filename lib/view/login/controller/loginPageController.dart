import 'package:catalougeapp/apiService/apiRepo.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customToast.dart';
import 'package:catalougeapp/utils/loader.dart';
import 'package:catalougeapp/utils/localStorage.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/view/otpPage/view/view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SignInPageController extends GetxController with CodeAutoFill {
  late TextEditingController phoneController;
  RxBool isPasswordObscurring = true.obs;
  RxBool isPhoneNumberLength = false.obs;
  RxString userId = "".obs;
  final LocalStorage _localStorage = Get.find();
  LocalStorage get localStorage => _localStorage;
  RxString playerIdToken = "".obs;

  // global key........ //
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  // NotificationController notificationController = Get.find();
  @override
  void codeUpdated() {
    if (code != null && code!.isNotEmpty) {}
  }

  Future<void> playerId() async {
    playerIdToken.value = OneSignal.User.pushSubscription.id.toString();
    debugPrint("token");
    debugPrint(playerIdToken.value);
    //  return playerIdToken.value;
  }

  Future<void> signIn(context) async {
    await playerId();

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final fcmToken = prefs.getString("fcm_token") ?? "";
    final appHash = await SmsAutoFill().getAppSignature;
    final formData = dio.FormData.fromMap({
      "mobile": phoneController.text.trim(),
      "app_hash": appHash,
      "fcm_id": playerIdToken.value,
    });

    try {
      showloadingIndicators();
      await ApiRepo().signIn(formData, context).then((value) async {
        if (value["status"] == "1") {
          customToast(
            value["message"],
            KColors.darkGreen.withValues(alpha: 0.7),
            context,
          );

          userId.value = value["data"]["user_id"].toString();
          await _localStorage.setUserId(userId.value);
          await _localStorage.getUserId();
          //await updateToken(context);
          await pageNavigation(OTPPage());
        } else {
          customToast(
            value["message"],
            KColors.red.withValues(alpha: 0.7),
            context,
          );
        }
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> resendOtp(context) async {
    await playerId();

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final fcmToken = prefs.getString("fcm_token") ?? "";
    final appHash = await SmsAutoFill().getAppSignature;
    final formData = dio.FormData.fromMap({
      "mobile": phoneController.text.trim(),
      "app_hash": appHash,
      "fcm_id": playerIdToken.value,
    });

    try {
      showloadingIndicators();
      await ApiRepo().signIn(formData, context).then((value) async {
        if (value["status"] == "1") {
          customToast(
            value["message"],
            KColors.darkGreen.withValues(alpha: 0.7),
            context,
          );

          userId.value = value["data"]["user_id"].toString();
          await _localStorage.setUserId(userId.value);
          await _localStorage.getUserId();
          //await updateToken(context);
          // await pageNavigation(OTPPage());
        } else {
          customToast(
            value["message"],
            KColors.red.withValues(alpha: 0.7),
            context,
          );
        }
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateToken(context) async {
    // String? fcmToken = await FirebaseMessaging.instance.getToken();
    // debugPrint("✅ firebase token: $fcmToken");
    await playerId();

    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
      "fcm_id": playerIdToken.value,
    });
    try {
      await ApiRepo().updateTokenApi(formData, context).then((value) async {
        if (value["status"] == "1") {
          final serverFcmId = value["data"]["fcm_id"];
          debugPrint("✅ Token updated successfully: $serverFcmId");

          // Optional: Save server-returned FCM id if you want
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString("fcm_token", serverFcmId);
        } else {}
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  singInFunction(context) {
    if (formKey.currentState!.validate()) {
      signIn(context);
    } else {}
  }

  checkPhoneNumberLength() {
    phoneController.addListener(() {
      if (phoneController.text.length == 10) {
        isPhoneNumberLength.value = true;
      } else {
        isPhoneNumberLength.value = false;
      }
    });
  }

  void printSignature() async {
    String signature = await SmsAutoFill().getAppSignature;
    debugPrint("App Hash Signature: $signature");
  }

  @override
  void onInit() {
    printSignature();
    listenForCode();
    phoneController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
