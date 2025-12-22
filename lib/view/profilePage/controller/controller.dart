import 'dart:io';

import 'package:catalougeapp/apiService/apiRepo.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customToast.dart';
import 'package:catalougeapp/utils/loader.dart';
import 'package:catalougeapp/utils/localStorage.dart';
import 'package:catalougeapp/view/profilePage/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  late TextEditingController fullnameController;
  late TextEditingController emailController;

  RxBool isBackButtonShow = false.obs;
  RxString isFemale = "Female".obs;
  RxString isMale = "Male".obs;
  RxString paymentStatus = "".obs;

  final LocalStorage _localStorage = Get.find();
  LocalStorage get localStorage => _localStorage;

  Rx<ProfileModel> profileModel = ProfileModel().obs;

  RxList<EnquiryModel> enquiryList = <EnquiryModel>[].obs;

  Future<void> getProfile(
    context,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await localStorage.getUserId();
    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
    });

    try {
      await ApiRepo().getProfile(formData, context).then((value) async {
        if (value["status"] == "1") {
          profileModel.value = ProfileModel.fromJson(value["data"]);
          pref.setString("autoMob", profileModel.value.mobile!);
          pref.setString("autoName", profileModel.value.fname!);
          fullnameController.text = value["data"]["fname"];
          emailController.text = value["data"]["email"];
          isFemale.value = value["data"]["gender"];
          paymentStatus.value = value["data"]["payment_status"].toString();
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getEnquiry(
    context,
  ) async {
    await localStorage.getUserId();
    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
    });
    try {
      showloadingIndicators();
      await ApiRepo().getEquiry(formData, context).then((value) async {
        if (value["status"] == "1") {
          enquiryList.value = (value["data"] as List)
              .map((e) => EnquiryModel.fromJson(e))
              .toList()
              .reversed
              .toList();
        } else {}
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> updateProfile(context) async {
    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
      "fname": fullnameController.text.trim(),
      "email": emailController.text.trim(),
      "gender": isFemale.value,
      "image": profileImagePath.value.isEmpty
          ? profileModel.value.image
          : dio.MultipartFile.fromFileSync(profileImagePath.value,
              filename: profileImagePath.value.split('/').join(''),
              contentType: MediaType(
                  'image', mime(profileImagePath.value)!.split('/')[1])),
    });

    try {
      showloadingIndicators();
      await ApiRepo().updaterProfile(formData, context).then((value) async {
        if (value["status"] == "1") {
          customToast(
            "Update Successfully",
            KColors.darkGreen.withValues(alpha: 0.7),
            context,
          );

          getProfile(context);
        } else {
          // customToast(value["data"][0], context,
          //     KColors.darkGreen.withValues(alpha: 0.7));
        }
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  RxString profileImagePath2 = "".obs;
  RxString profileImagePath = "".obs;

  Future getImage(
    ImageSource imageSource,
    context,
  ) async {
    // clickCroppedImgList.clear();
    var pickeImage =
        await ImagePicker().pickImage(source: imageSource, imageQuality: 70);
    if (pickeImage != null) {
      File? img = await getCroppedImage(pickeImage);
      profileModel.value.image = "";
      profileImagePath.value = img!.path;

      profileImagePath2.value = img.path.split('/').last;
    } else {
      // customToast("No Image Captured", context,
      //     KColors.darkGreen.withValues(alpha: 0.7));
    }
  }

  // /data/user/0/com.example.driverapp/cache/image_cropper_1738323798931.jpg
  // datauser0com.example.driverappcacheimage_cropper_1738323798931.jpg

  getCroppedImage(XFile image) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: image.path);
    if (croppedFile == null) return null;
    return File(croppedFile.path);
  }

  @override
  void onInit() {
    fullnameController = TextEditingController();
    emailController = TextEditingController();
    // getProfile(
    //   Get.context,
    // );
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }
}
