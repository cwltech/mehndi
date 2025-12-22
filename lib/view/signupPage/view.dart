import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customElevatedButton.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/customformfileds.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/utils/validation.dart';
import 'package:catalougeapp/view/login/controller/loginPageController.dart';
import 'package:catalougeapp/view/login/view/loginPage.dart';
import 'package:catalougeapp/view/login/widget/customDividerWidget.dart';
import 'package:catalougeapp/view/otpPage/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignInPageController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CustomImageProvider.assetsImage(
                  image: "assets/images/textureimg.png"),
              Padding(
                padding: EdgeInsets.only(
                    top: getVerticalSize(130),
                    left: getHorizontalSize(20),
                    right: getHorizontalSize(20)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Create a new account".f14w4(
                        textColor: KColors.persistentBlack,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: Fontfamily.poppins,
                      ),
                      getheight(context, 0.005),
                      "We make everything smooth for you....".f12w4(
                          textColor: KColors.pinkColor,
                          fontFamily: Fontfamily.poppins,
                          fontSize: 12.sp),
                      getheight(context, 0.060),
                      CustomTextFormField(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: getVerticalSize(7)),
                          inputFormator: [LengthLimitingTextInputFormatter(10)],
                          inputType: TextInputType.number,
                          hintcolor: KColors.grey,
                          prefixIcon: Icon(
                            Icons.person,
                            color: KColors.grey,
                            size: 20.h,
                          ),
                          controller: controller.phoneController,
                          borderRadius: 10,
                          hint: "Full name",
                          fillColor: Colors.transparent,
                          validator: (value) =>
                              Validation.emptyValidation(value!)),
                      getheight(context, 0.020),
                      CustomTextFormField(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: getVerticalSize(7)),
                          inputFormator: [LengthLimitingTextInputFormatter(10)],
                          inputType: TextInputType.number,
                          hintcolor: KColors.grey,
                          prefixIcon: Icon(
                            Icons.email,
                            color: KColors.grey,
                            size: 20.h,
                          ),
                          controller: controller.phoneController,
                          borderRadius: 10,
                          hint: "Email",
                          fillColor: Colors.transparent,
                          validator: (value) =>
                              Validation.emptyValidation(value!)),
                      height15,
                      CustomTextFormField(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: getVerticalSize(7)),
                          inputFormator: [LengthLimitingTextInputFormatter(10)],
                          inputType: TextInputType.number,
                          hintcolor: KColors.grey,
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: KColors.grey,
                            size: 20.h,
                          ),
                          controller: controller.phoneController,
                          borderRadius: 10,
                          hint: "Mobile no...",
                          fillColor: Colors.transparent,
                          validator: (value) =>
                              Validation.emptyValidation(value!)),
                      // height15,
                      // Obx(
                      //   () => CustomTextFormField(
                      //     contentPadding:
                      //         EdgeInsets.symmetric(vertical: getVerticalSize(7)),
                      //     inputFormator: [LengthLimitingTextInputFormatter(10)],
                      //     inputType: TextInputType.number,
                      //     hintcolor: KColors.grey,
                      //     prefixIcon: Icon(
                      //       Icons.lock,
                      //       color: KColors.grey,
                      //       size: 20.h,
                      //     ),
                      //     controller: controller.phoneController,
                      //     borderRadius: 10,
                      //     hint: "Password...",
                      //     fillColor: Colors.transparent,
                      //     validator: (value) =>
                      //         Validation.emptyValidation(value!),
                      //     suffixIcon: InkWell(
                      //       borderRadius: BorderRadius.circular(10),
                      //       onTap: () {
                      //         controller.isPasswordObscurring.value =
                      //             !controller.isPasswordObscurring.value;
                      //       },
                      //       child: controller.isPasswordObscurring.value
                      //           ? "Show"
                      //               .f16w4(
                      //                   textColor: KColors.grey, fontSize: 10.sp)
                      //               .paddingAll(15)
                      //           : "Hide"
                      //               .f16w4(
                      //                   textColor: KColors.grey, fontSize: 10.sp)
                      //               .paddingAll(15),
                      //     ),
                      //     isSuffix: true,
                      //     isObscurring: controller.isPasswordObscurring.value,
                      //     isObscureText: controller.isPasswordObscurring.value,
                      //   ),
                      // ),
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: CustomTextButton(
                      //     ontap: () {},
                      //     textButton: "Forgot Password?",
                      //     fontWeight: FontWeight.w600,
                      //     textcolor: KColors.grey,
                      //     fontSize: 10.sp,
                      //   ),
                      // ),
                      getheight(context, 0.040),
                      PrimaryElevatedButton(
                        text: "Create account",
                        ontap: () => pageNavigation(OTPPage()),
                      ),
                      getheight(context, 0.040),
                      CustomDividerWidget(),
                      getheight(context, 0.020),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "Already have an account?".f10w4(
                              textColor: KColors.background,
                              fontFamily: Fontfamily.poppins),
                          CustomTextButton(
                            ontap: () => pageNavigation(LoginPage()),
                            textButton: "LogIn",
                            fontWeight: FontWeight.w600,
                            textcolor: KColors.pinkColor,
                          )
                        ],
                      ),

                      // getheight(context, 0.020),
                      // socilaLogin("assets/images/Group 447.png",
                      //     "Login With Google", context),
                      // socilaLogin("assets/images/Group 2582.png",
                      //     "Login With Facebook", context),
                      // socilaLogin(
                      //     "assets/images/Group 2583.png", "Sign In With Apple", context)
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget socilaLogin(String img, String text, context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getVerticalSize(7)),
      height: Get.height * 0.06,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: KColors.widgetBackgroundColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0.1),
                color: KColors.grey.withValues(alpha: 0.08),
                blurRadius: 1.0,
                spreadRadius: 2),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomImageProvider.assetsImage(
                image: img,
                height: getVerticalSize(30),
                width: getHorizontalSize(30),
                boxFit: BoxFit.cover,
              )),
          text.f14w4(
              textColor: KColors.persistentBlack.withValues(alpha: 0.7),
              fontFamily: Fontfamily.poppins,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp)
        ],
      ),
    );
  }

  void modalBottomSheetMenu(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showModalBottomSheet(
          // isDismissible: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          context: context,
          builder: (builder) {
            return Container(
              height: Get.height * 0.39,
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalSize(40),
                        vertical: getVerticalSize(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: 2,
                            width: Get.width * 0.20,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        getheight(context, 0.025),
                        Row(
                          children: [
                            "Hi".f20w5(
                                textColor: KColors.pinkColor,
                                fontFamily: Fontfamily.unna,
                                fontSize: 30.sp),
                            getWidth(context, 0.020),
                            "Anirudh Kumar".f20w5(
                                textColor: KColors.persistentBlack,
                                fontFamily: Fontfamily.unna,
                                fontSize: 30.sp),
                          ],
                        ),
                        getheight(context, 0.005),
                        "To get started, please login / signup".f16w7(
                            textColor:
                                KColors.textGreyColor.withValues(alpha: 0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontFamily: Fontfamily.montserrat),
                        height20,
                        PrimaryElevatedButton(
                            text: "CONTINUE WITH 2357326327",
                            ontap: () => pageNavigation(LoginPage())),
                        height10,
                        PrimaryElevatedButton(
                            text: "USE ANOTHER METHOD",
                            ontap: () => pageNavigation(LoginPage())),
                        height23,
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "By continuing you consent to share your name and number with ",
                              style: TextStyle(
                                  color: KColors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fontfamily.montserrat)),
                          TextSpan(
                              text: " SkyWeds, ",
                              style: TextStyle(
                                  color: KColors.textGreyColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fontfamily.montserrat)),
                          TextSpan(
                              text: "and agree to ",
                              style: TextStyle(
                                  color: KColors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fontfamily.montserrat)),
                          TextSpan(
                              text: " SkyWeds, ",
                              style: TextStyle(
                                  color: KColors.textGreyColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fontfamily.montserrat)),
                          TextSpan(
                              text: " privacy policy ",
                              style: TextStyle(
                                  color: KColors.pinkColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fontfamily.montserrat)),
                          TextSpan(
                              text: " and ",
                              style: TextStyle(
                                  color: KColors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Fontfamily.montserrat)),
                          TextSpan(
                              text: "terms of service",
                              style: TextStyle(
                                  color: KColors.pinkColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fontfamily.montserrat))
                        ]))
                      ],
                    ),
                  )),
            );
          });
    });
  }
}
