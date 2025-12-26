import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/widget.dart';
import 'package:catalougeapp/view/login/view/loginPage.dart';
import 'package:catalougeapp/view/profilePage/controller/controller.dart';
import 'package:catalougeapp/view/profilePage/view/editProfilePage.dart';
import 'package:catalougeapp/view/signupPage/view.dart';
import 'package:catalougeapp/view/termsAndConditionPage/privacyPolicesPage.dart';
import 'package:catalougeapp/view/termsAndConditionPage/termsandConditonPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/reviewHelper.dart';
import '../../login/controller/loginPageController.dart';

class ProfilePage extends GetView<ProfilePageController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController homecontroller = Get.put(HomePageController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: controller.isBackButtonShow.value,
          title: "Profile".f14w4(
              textColor: KColors.persistentBlack,
              fontFamily: Fontfamily.poppins,
              fontWeight: FontWeight.w600),
        ),
        body: Obx(
          () => ListView(
            padding: EdgeInsets.all(15),
            children: [
              Card(
                  elevation: 0,
                  child: SizedBox(
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getheight(context, 0.023),
                        CircleAvatar(
                          backgroundColor: KColors.mehroom,
                          radius: 34.r,
                          backgroundImage:
                              (controller.profileModel.value.image != null &&
                                      controller
                                          .profileModel.value.image!.isNotEmpty)
                                  ? NetworkImage(
                                      controller.profileModel.value.image!)
                                  : null,
                          child: (controller.profileModel.value.image == null ||
                                  controller.profileModel.value.image!.isEmpty)
                              ? (controller.profileModel.value.fname != null &&
                                      controller
                                          .profileModel.value.fname!.isNotEmpty)
                                  ? Text(
                                      controller.profileModel.value.fname![0]
                                          .toUpperCase(),
                                      style: TextStyle(
                                        color: KColors.white,
                                        fontFamily: Fontfamily.poppins,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Icon(
                                      Icons.camera_alt,
                                      color: KColors.white,
                                    )
                              : null,
                        ),
                        getheight(context, 0.010),
                        controller.profileModel.value.fname.toString() == "null"
                            ? SizedBox()
                            : controller.profileModel.value.fname
                                .toString()
                                .f16w4(
                                  textColor: KColors.persistentBlack,
                                  fontFamily: Fontfamily.poppins,
                                  fontWeight: FontWeight.w600,
                                ),
                        height10,
                        InkWell(
                          onTap: () {
                            Get.to(EditProfilePage(),
                                transition: Transition.downToUp);
                          },
                          child: Chip(
                            label: "Edit Profile"
                                .f16w4(
                                    textColor: KColors.persistentBlack,
                                    fontFamily: Fontfamily.poppins,
                                    fontSize: 10.sp)
                                .paddingSymmetric(
                                    horizontal: getHorizontalSize(12.w)),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        getheight(context, 0.020),
                      ],
                    ),
                  )),
              getheight(context, 0.030),
              "Genders"
                  .f16w4(
                      textColor: KColors.persistentBlack,
                      fontFamily: Fontfamily.poppins,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500)
                  .paddingOnly(left: 15.w),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: "Female",
                      groupValue: controller.isFemale.value,
                      onChanged: (v) {
                        controller.isFemale.value = v!;
                      },
                      activeColor: KColors.pinkColor,
                    ),
                    "Female".f16w4(
                        textColor: KColors.persistentBlack,
                        fontFamily: Fontfamily.poppins,
                        fontSize: 12.sp),
                    width20,
                    Radio(
                      value: "Male",
                      groupValue: controller.isFemale.value,
                      onChanged: (v) {
                        controller.isFemale.value = v!;
                      },
                      activeColor: KColors.pinkColor,
                    ),
                    "Male".f16w4(
                        textColor: KColors.persistentBlack,
                        fontFamily: Fontfamily.poppins,
                        fontSize: 12.sp),
                  ],
                ),
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
              // height18,
              ListTile(
                title: "Email address*".f16w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                subtitle: controller.profileModel.value.email == null
                    ? "xxxxxxx@gmail.com".f16w4(
                        textColor: KColors.persistentBlack,
                        fontFamily: Fontfamily.poppins,
                        fontSize: 10.sp)
                    : controller.profileModel.value.email.toString().f16w4(
                        textColor: KColors.persistentBlack,
                        fontFamily: Fontfamily.poppins,
                        fontSize: 10.sp),
                // trailing: Wrap(
                //   children: [
                //     Icon(Icons.verified, size: 15.h, color: Colors.green),
                //     width5,
                //     "Verified".f16w4(
                //         textColor: KColors.persistentBlack,
                //         fontFamily: Fontfamily.poppins,
                //         fontSize: 10.sp,
                //         fontWeight: FontWeight.w500),
                //   ],
                // ),
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
              ListTile(
                title: "Mobile number*".f16w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                // subtitle: "+Add Contact".f16w4(
                //     textColor: KColors.persistentBlack,
                //     fontFamily: Fontfamily.poppins,
                //     fontSize: 9.sp),
                trailing: controller.profileModel.value.mobile.toString().f16w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 9.sp,
                    decoration: TextDecoration.underline),
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
              ListTile(
                title: "App share*".f16w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                onTap: () {
                  Share.share(
                      homecontroller.termsAndConditionData.value.shareLink!);
                },
                // launchUrlString(
                //     controller.termsAndConditionData.value.shareLink!);
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
              ListTile(
                title: "Rating Us".f16w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                onTap: () async {
                  final prefs = await SharedPreferences.getInstance();
                  bool alreadyShown =
                      prefs.getBool("reviewPopupShown") ?? false;

                  if (!alreadyShown) {
                    ReviewHelper.requestReview();
                    prefs.setBool("reviewPopupShown", true); // Mark as shown
                  } else {
                    launchUrlString(
                        "https://play.google.com/store/apps/details?id=com.catalougeapp.app");
                  }
                },
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
              ListTile(
                title: "Terms & Conditions".f16w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                onTap: () {
                  pageNavigation(TermsAndConditionsPage());
                },
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
              ListTile(
                title: "Privacy Policy".f16w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                onTap: () {
                  pageNavigation(PrivacyPolicesPage());
                },
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
              // ListTile(
              //     title: Row(
              //   children: [
              //     "Set Password".f16w4(
              //         textColor: KColors.persistentBlack,
              //         fontFamily: Fontfamily.poppins,
              //         fontSize: 12.sp,
              //         fontWeight: FontWeight.w500),
              //     Icon(
              //       Icons.arrow_forward_ios,
              //       size: 12.h,
              //     )
              //   ],
              // )),
              // Divider(
              //   color: KColors.grey.withValues(alpha: 0.2),
              // ),
              ListTile(
                title: Row(
                  children: [
                    "Logout".f16w4(
                        textColor: KColors.persistentBlack,
                        fontFamily: Fontfamily.poppins,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.h,
                    )
                  ],
                ),
                onTap: () => showLogoutDialog(
                  context,
                  "logout",
                  "Are you sure you want logout!",
                  () async {
                    final signInController = Get.find<SignInPageController>();
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.clear();
                    await pref.remove("autoMob");
                    await pref.remove("autoName");
                    await pref.remove("userId2");
                    await pref.remove("userId");
                    await pref.remove("fcm_token");
                    await pref.remove("reviewPopupShown");
                    signInController.phoneController.clear();
                    signInController.isPhoneNumberLength.value = false;
                    signInController.formKey.currentState?.reset();

                    if (Get.isRegistered<SignInPageController>()) {
                      Get.delete<SignInPageController>(force: true);
                    }
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                  "OK",
                ),
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
              ListTile(
                title: Row(
                  children: [
                    "Delete account".f16w4(
                        textColor: KColors.persistentBlack,
                        fontFamily: Fontfamily.poppins,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12.h,
                    )
                  ],
                ),
                onTap: () => showLogoutDialog(
                  context,
                  "Delete account",
                  "Are you sure you want Delete account!",
                  () async {
                    final signInController = Get.find<SignInPageController>();
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.clear();
                    await pref.remove("autoMob");
                    await pref.remove("autoName");
                    await pref.remove("userId2");
                    await pref.remove("userId");
                    await pref.remove("fcm_token");
                    await pref.remove("reviewPopupShown");
                    signInController.phoneController.clear();
                    signInController.isPhoneNumberLength.value = false;
                    signInController.formKey.currentState?.reset();

                    if (Get.isRegistered<SignInPageController>()) {
                      Get.delete<SignInPageController>(force: true);
                    }
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SignUpPage()),
                        (Route<dynamic> route) => false);
                  },
                  "OK",
                ),
              ),
              Divider(
                color: KColors.grey.withValues(alpha: 0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
