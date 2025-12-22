import 'package:catalougeapp/view/homepage/view/enquiryPage.dart';
import 'package:catalougeapp/view/homepage/view/homePage.dart';
import 'package:catalougeapp/view/profilePage/controller/controller.dart';
import 'package:catalougeapp/view/profilePage/view/view.dart';
import 'package:catalougeapp/view/whislistPage/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../apiService/apiRepo.dart';
import '../homepage/model/getPopupNotificationModel.dart';

class MainPageController extends GetxController {
  RxInt bottomNavigationBarindex = 0.obs;
  ProfilePageController profilePageController = Get.find();
  Rx<GetPopUpNotificationModel> popUpNotificationData =
      GetPopUpNotificationModel().obs;

  RxList pages = [
    HomePage(),
    WhislistPage(),
    EquiryPage(),
    ProfilePage(),
  ].obs;

  Future<void> getPopUpNotification(BuildContext context) async {
    try {
      final value = await ApiRepo().getPopupNotification(context);

      if (value == null) {
        return;
      }

      if (value["status"]?.toString() == "1") {
        final data = value["data"];
        if (data != null) {
          popUpNotificationData.value =
              GetPopUpNotificationModel.fromJson(data);
        } else {}
      } else {}
    } catch (e, s) {
      debugPrint("getPopUpNotification error: $e\n$s");
    }
  }
}
