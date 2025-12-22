import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/utils/customElevatedButton.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/validation.dart';
import 'package:catalougeapp/view/otpPage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:toastification/toastification.dart';
import '../../../utils/sizeHelper.dart';

class OTPPage extends GetView<OTPPageController> {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: CustomSvgImage(
                  image: ConstantValue.textureImg,
                  height: Get.height,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getVerticalSize(80),
                    left: getHorizontalSize(20),
                    right: getHorizontalSize(20)),
                child: Column(
                  children: [
                    CustomSvgImage(
                      image: ConstantValue.appPrimaryLogo,
                      height: 130.h,
                    ),
                    getheight(context, 0.030),
                    Align(
                        alignment: Alignment.topCenter,
                        child: ConstantValue.otpVerification.f14w4(
                          textColor: KColors.persistentBlack,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fontfamily.poppins,
                        )),
                    getheight(context, 0.010),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ConstantValue.enter4Digit.f14w4(
                        textColor:
                            KColors.persistentBlack.withValues(alpha: 0.8),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: Fontfamily.poppins,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getHorizontalSize(45),
                          vertical: getVerticalSize(60)),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        autoFocus: true,
                        textStyle:
                            const TextStyle(color: KColors.persistentBlack),
                        enablePinAutofill: true,
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) => Validation.otpLengthValidation(v!),
                        pinTheme: PinTheme(
                          activeColor:
                              KColors.persistentBlack.withValues(alpha: 0.3),
                          inactiveColor:
                              KColors.persistentBlack.withValues(alpha: 0.3),
                          inactiveFillColor: KColors.white,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: KColors.goldColor,
                        ),
                        cursorColor: KColors.white,
                        animationDuration: const Duration(milliseconds: 300),
                        // enableActiveFill: true,
                        // errorAnimationController: errorController,
                        controller: controller.otpController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          ),
                        ],

                        onCompleted: (v) {
                          // debugPrint("Completed");
                          // controller.singingPageController.isLogin.value
                          //     ? controller.loginVerifyOTP(context)
                          //     : controller.verifyOTP(context);
                        },

                        onChanged: (value) {
                          controller.otpValue.value = value;
                        },
                      ),
                    ),
                    // getheight(context, 0.060),
                    PrimaryElevatedButton(
                        text: ConstantValue.verifyOtp,
                        ontap: () {
                          controller.otpVerify(context);
                          // toastification.dismissAll();
                        }),

                    getheight(context, 0.040),
                    ConstantValue.dontReciveCode.f14w4(
                      textColor: KColors.persistentBlack.withValues(alpha: 0.8),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: Fontfamily.poppins,
                    ),

                    Obx(
                      () => controller.countEnded.value == false
                          ? "Request new code in 00:${controller.start.value}"
                              .f12w4(
                                  fontSize: 12.sp,
                                  textColor: KColors.pinkColor,
                                  fontWeight: FontWeight.w600)
                          : TextButton(
                              onPressed: () {
                                controller.resendCode();
                                controller.signInPageController
                                    .resendOtp(context);
                              },
                              child: ConstantValue.resendCode.f16w6(
                                  textColor: KColors.persistentBlack
                                      .withValues(alpha: 0.7),
                                  fontSize: 12.sp)),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     CustomText(
                    //       text: ConstantValue.resendCode,
                    //       color: KColors.persistentBlack.withValues(alpha: 0.8),
                    //       fontSize: 12.sp,
                    //       fontWeight: FontWeight.w500,
                    //       fontFamily: Fontfamily.poppins,
                    //     ),
                    //     CustomText(
                    //       text: "  0:20",
                    //       color: KColors.pinkColor,
                    //       fontSize: 13.sp,
                    //       fontWeight: FontWeight.w500,
                    //       fontFamily: Fontfamily.poppins,
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
