import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/utils/customElevatedButton.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/customformfileds.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/utils/validation.dart';
import 'package:catalougeapp/view/login/controller/loginPageController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<SignInPageController> {
  const LoginPage({super.key});
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
                    getheight(context, 0.010),
                    ConstantValue.singIn
                        .f14w4(
                          textColor: KColors.persistentBlack,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: Fontfamily.poppins,
                        )
                        .paddingSymmetric(horizontal: getHorizontalSize(20)),
                    getheight(context, 0.060),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ConstantValue.enterPhoneNo.f14w4(
                        textColor:
                            KColors.persistentBlack.withValues(alpha: 0.8),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: Fontfamily.poppins,
                      ),
                    ),
                    getheight(context, 0.015),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: KColors.persistentBlack
                                      .withValues(alpha: 0.2)))),
                      child: Form(
                        key: controller.formKey,
                        child: CustomTextFormField(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: getVerticalSize(10),
                                horizontal: getHorizontalSize(20)),
                            inputFormator: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            inputType: TextInputType.number,
                            hintcolor:
                                KColors.persistentBlack.withValues(alpha: 0.7),
                            prefixIcon: Icon(
                              Icons.phone_android_outlined,
                              color: KColors.persistentBlack
                                  .withValues(alpha: 0.5),
                              size: 20.h,
                            ),
                            isSuffix: true,
                            suffixIcon: IconButton(
                                onPressed: () =>
                                    controller.phoneController.clear(),
                                icon: Icon(
                                  Icons.cancel,
                                  size: 15.h,
                                  color: KColors.persistentBlack
                                      .withValues(alpha: 0.5),
                                )),
                            controller: controller.phoneController,
                            borderRadius: 10,
                            hint: ConstantValue.yourPhoneNumber,
                            fillColor: Colors.transparent,
                            validator: (value) =>
                                Validation.emptyValidation(value!),
                            onChanged: (p0) =>
                                controller.checkPhoneNumberLength()),
                      ),
                    ),
                    getheight(context, 0.010),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ConstantValue.termsAndPolicy.f14w4(
                        textColor:
                            KColors.persistentBlack.withValues(alpha: 0.8),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: Fontfamily.poppins,
                      ),
                    ),
                    getheight(context, 0.060),
                    Obx(
                      () => Visibility(
                        visible: controller.isPhoneNumberLength.value,
                        replacement: InactiveButton(
                          text: ConstantValue.otpSent,
                          ontap: () {},
                        ),
                        child: PrimaryElevatedButton(
                            text: ConstantValue.otpSent,
                            ontap: () => controller.singInFunction(context)),
                      ),
                    ),
                    // getheight(context, 0.040),
                    // CustomDividerWidget(),
                    // getheight(context, 0.030),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     CustomSvgImage(
                    //       image: ConstantValue.google,
                    //     ),
                    //     width20,
                    //     CustomSvgImage(
                    //       image: ConstantValue.faceBook,
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
