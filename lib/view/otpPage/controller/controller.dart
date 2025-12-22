import 'dart:async';
import 'package:catalougeapp/apiService/apiRepo.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customToast.dart';
import 'package:catalougeapp/utils/loader.dart';
import 'package:catalougeapp/utils/localStorage.dart';
import 'package:catalougeapp/view/login/controller/loginPageController.dart';
import 'package:catalougeapp/view/mainPage/view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:sms_autofill/sms_autofill.dart';

class OTPPageController extends GetxController with CodeAutoFill {
  late TextEditingController otpController;
  Timer? timer;
  RxInt start = 30.obs;
  RxBool countEnded = false.obs;
  RxString otpValue = "".obs;
  RxString userId = "".obs;

  final LocalStorage _localStorage = Get.find();
  LocalStorage get localStorage => _localStorage;

  SignInPageController signInPageController = Get.find();

  @override
  void codeUpdated() {
    if (code != null && code!.isNotEmpty) {
      otpController.text = code!;
      otpValue.value = code!;

      Future.delayed(const Duration(milliseconds: 300), () {
        otpVerify(Get.context);
      });
    }
  }

  void printSignature() async {
    String signature = await SmsAutoFill().getAppSignature;
    debugPrint("App Hash Signature: $signature");
  }

  @override
  void onInit() {
    printSignature();
    listenForCode();
    otpController = TextEditingController();
    super.onInit();
  }

  Future<void> otpVerify(context) async {
    final formData = dio.FormData.fromMap({
      "id": _localStorage.userid.value,
      "otp": otpController.text,
    });
    try {
      //showloadingIndicators();
      await ApiRepo().otpVerify(formData, context).then((value) async {
        if (value["status"] == "1") {
 
          Get.snackbar("Success", value["message"],
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green);
          // customToast(value["message"], KColors.darkGreen, context);
          userId.value = value["data"]["user_id"].toString();
          await _localStorage.setUserId2(userId.value);
          await _localStorage.getUserId2();
          //await pageNavigation(MainPage());
          await Get.offAll(MainPage());
        } else {
          // customToast(value["message"], KColors.red, context);
        }
      });
      // hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  startTimer() {
    if (timer != null) {
      timer!.cancel();
    } else {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (start.value < 1) {
          timer.cancel();
          countEnded.value = true;
        } else {
          start.value = start.value - 1;
        }
      });
    }
  }

  resendCode() {
    start.value = 30;
    countEnded.value = false;
    timer = null;
    update();
    startTimer();
  }

  @override
  void onReady() {
    startTimer();
    super.onReady();
  }

  @override
  void dispose() {
    cancel();
    otpController.dispose();
    super.dispose();
  }
}
