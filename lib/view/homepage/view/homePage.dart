import 'dart:io';

import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/widget.dart';
import 'package:catalougeapp/view/profilePage/view/view.dart';
import 'package:catalougeapp/view/termsAndConditionPage/privacyPolicesPage.dart';
import 'package:catalougeapp/view/termsAndConditionPage/termsandConditonPage.dart';
import 'package:catalougeapp/view/whislistPage/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/reviewHelper.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller.scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Obx(
                () => Column(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        backgroundColor: KColors.mehroom.withValues(alpha: 0.7),
                        radius: 30.h,
                        backgroundImage: controller.profilePageController
                                .profileModel.value.image!.isNotEmpty
                            ? NetworkImage(controller
                                .profilePageController.profileModel.value.image
                                .toString())
                            // FileImage(File(controllers.profileImagePath.value))
                            : null,
                        child: (controller.profilePageController.profileModel
                                        .value.image ==
                                    null ||
                                controller.profilePageController.profileModel
                                    .value.image!.isEmpty)
                            ? Icon(
                                Icons.person,
                                color: KColors.white,
                              )
                            : null,
                      ),
                    ),
                    controller.profilePageController.profileModel.value.fname ==
                            null
                        ? "Not Available".toString().f16w4(
                              textColor: KColors.persistentBlack,
                              fontFamily: Fontfamily.poppins,
                              fontWeight: FontWeight.w600,
                            )
                        : controller
                            .profilePageController.profileModel.value.fname
                            .toString()
                            .f16w4(
                              textColor: KColors.persistentBlack,
                              fontFamily: Fontfamily.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                  ],
                ),
              )),
              customListTile("Terms & Conditions", () {
                pageNavigation(TermsAndConditionsPage());
              }),
              customListTile("Privacy Policy", () {
                pageNavigation(PrivacyPolicesPage());
              }),
              customListTile("App share", () {
                Share.share(controller.termsAndConditionData.value.shareLink!);
                // launchUrlString(
                //     controller.termsAndConditionData.value.shareLink!);
              }),
              customListTile("Rating Us", () async {
                // launchUrlString(
                //     controller.termsAndConditionData.value.ratingLink!);

                final prefs = await SharedPreferences.getInstance();
                bool alreadyShown = prefs.getBool("reviewPopupShown") ?? false;

                if (!alreadyShown) {
                  ReviewHelper.requestReview();
                  prefs.setBool("reviewPopupShown", true); // Mark as shown
                } else {
                  launchUrlString(
                      "https://play.google.com/store/apps/details?id=com.catalougeapp.app");
                }
              }),
              customListTile("Enquiry", () {
                pageNavigation(WhislistPage());
              }),
            ],
          ),
        ),
        appBar: AppBar(
          leading: InkWell(
            onTap: () => controller.scaffoldKey.currentState!.openDrawer(),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: CustomSvgImage(
                image: ConstantValue.secondryLogo,
                height: 25.h,
              ),
            ),
          ),
          title: customSearchWidget(),
          actions: [
            Obx(() {
              final profile =
                  controller.profilePageController.profileModel.value;
              ImageProvider? imageProvider;

              if (profile.image != null && profile.image!.isNotEmpty) {
                imageProvider = NetworkImage(profile.image!);
              }

              return InkWell(
                onTap: () async {
                  controller.saveNotoificationToken(context);
                  pageNavigation(ProfilePage());
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: KColors.mehroom.withValues(alpha: 0.7),
                    backgroundImage: imageProvider,
                    child: imageProvider == null
                        ? Icon(
                            Icons.person,
                            color: KColors.white,
                            size: 22.sp,
                          )
                        : null,
                  ),
                ),
              );
            }),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
           controller.   getBanner(Get.context);
          },
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(2)),
            children: [
              height10,
              const CustomCarouselSlider(),

              height10,
              // getheight(context, 0.020),
              Container(
                height: 30.h,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ConstantValue.homeLabelImg))),
              ),
              getheight(context, 0.010),

              Obx(
                () => SizedBox(
                    child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    ...Iterable.generate(controller.categoryList.length)
                        .map((e) {
                      return CommonCategoryWidget(
                        controller: controller,
                        list: controller.categoryList,
                        index: e,
                      );
                    })
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  customListTile(String title, Function onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: KColors.grey.withValues(alpha: 0.2)))),
        child: ListTile(
          title:
              title.f16w4(textColor: KColors.persistentBlack, fontSize: 12.sp),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 12.h,
          ),
        ),
      ),
    );
  }
}
