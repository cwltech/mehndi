import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/homepage/view/homePage.dart';
import 'package:catalougeapp/view/homepage/widget.dart';
import 'package:catalougeapp/view/login/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login/controller/loginPageController.dart';

class VendorsPage extends StatelessWidget {
  const VendorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            shape: const RoundedRectangleBorder(),
            backgroundColor: KColors.white,
            child: ListView(
              children: [
                DrawerHeader(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      height: 120.h,
                      width: Get.width,
                      color: KColors.pinkColor.withValues(alpha: 0.3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 30.r,
                              child: CustomImageProvider.assetsImage(
                                  image: "assets/images/man.png")),
                          height10,
                          "Arun".f10w4(
                              textColor: KColors.persistentBlack,
                              fontSize: 16.sp,
                              fontFamily: Fontfamily.poppins,
                              fontWeight: FontWeight.w600),
                          "arunkumarrao36987@gmail.com".f10w4(
                              textColor: KColors.persistentBlack,
                              fontSize: 12.sp,
                              fontFamily: Fontfamily.poppins,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    )),
                height10,
                listTileWidget(context, "Privacy Policy", (v) => null),
                customDivider(),
                listTileWidget(context, "Term & Conditions", (v) => null),
                customDivider(),
                listTileWidget(context, "Contact Us", (v) => null),
                customDivider(),
                listTileWidget(context, "About Us", (v) => null),
                customDivider(),
                listTileWidget(
                  context,
                  "Logout",
                  (v) => showLogoutDialog(
                      context, "Log Out?", 'Are you sure you want to logout!',
                      () async {
                    final signInController = Get.find<SignInPageController>();
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.remove("autoMob");
                    await pref.remove("autoName");
                    await pref.remove("fcm_token");
                    signInController.phoneController.clear();
                    // await controller.localStorage.deleteToken();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginPage()),
                        (Route<dynamic> route) => false);
                  }, "Logout"),
                ),
                getheight(context, 0.040),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: "V.0.0.1".f14w4(textColor: KColors.grey),
                )
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: CustomImageProvider.assetsImage(
                image: "assets/images/mehandi-wala-logo.png", height: 40.h),
          ),
          body: HomePage()),
    );
  }
}
