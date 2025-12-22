import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/utils/customElevatedButton.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/customformfileds.dart';
import 'package:catalougeapp/utils/localStorage.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/utils/validation.dart';
import 'package:catalougeapp/view/albumPage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductEnquiryPage extends GetView<AlbumPageController> {
  const ProductEnquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: "Enquiry".f16w4(textColor: KColors.persistentBlack),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: KColors.persistentBlack
                                .withValues(alpha: 0.2)))),
                child: CustomTextFormField(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getVerticalSize(10),
                      horizontal: getHorizontalSize(20)),

                  inputType: TextInputType.name,
                  hintcolor: KColors.persistentBlack.withValues(alpha: 0.7),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: KColors.persistentBlack.withValues(alpha: 0.5),
                    size: 20.h,
                  ),

                  controller: controller.nameController,
                  borderRadius: 10,
                  hint: "Name",
                  fillColor: Colors.transparent,
                  validator: (value) => Validation.emptyValidation(value!),
                  // onChanged: (p0) =>
                  //     controller.checkPhoneNumberLength()
                ),
              ),
              // height20,
              // Container(
              //   decoration: BoxDecoration(
              //       border: Border(
              //           bottom: BorderSide(
              //               color: KColors.persistentBlack
              //                   .withValues(alpha: 0.2)))),
              //   child: CustomTextFormField(
              //     contentPadding: EdgeInsets.symmetric(
              //         vertical: getVerticalSize(10),
              //         horizontal: getHorizontalSize(20)),

              //     inputType: TextInputType.emailAddress,
              //     hintcolor: KColors.persistentBlack.withValues(alpha: 0.7),
              //     prefixIcon: Icon(
              //       Icons.email_outlined,
              //       color: KColors.persistentBlack.withValues(alpha: 0.5),
              //       size: 20.h,
              //     ),
              //     controller: controller.emailController,
              //     borderRadius: 10,
              //     hint: "Email",
              //     fillColor: Colors.transparent,
              //     validator: (value) => Validation.emptyValidation(value!),
              //     // onChanged: (p0) =>
              //     //     controller.checkPhoneNumberLength()
              //   ),
              // ),
              height20,
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: KColors.persistentBlack
                                .withValues(alpha: 0.2)))),
                child: CustomTextFormField(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getVerticalSize(10),
                      horizontal: getHorizontalSize(20)),
                  inputFormator: [LengthLimitingTextInputFormatter(10)],
                  inputType: TextInputType.number,
                  hintcolor: KColors.persistentBlack.withValues(alpha: 0.7),
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                    color: KColors.persistentBlack.withValues(alpha: 0.5),
                    size: 20.h,
                  ),
                  controller: controller.mobileController,
                  borderRadius: 10,
                  hint: ConstantValue.yourPhoneNumber,
                  fillColor: Colors.transparent,
                  validator: (value) => Validation.emptyValidation(value!),
                  // onChanged: (p0) =>
                  //     controller.checkPhoneNumberLength()
                ),
              ),
              // height20,
              // Container(
              //   decoration: BoxDecoration(
              //       border: Border(
              //           bottom: BorderSide(
              //               color: KColors.persistentBlack
              //                   .withValues(alpha: 0.2)))),
              //   child: CustomTextFormField(
              //     contentPadding: EdgeInsets.symmetric(
              //         vertical: getVerticalSize(10),
              //         horizontal: getHorizontalSize(20)),
              //     inputType: TextInputType.name,
              //     hintcolor: KColors.persistentBlack.withValues(alpha: 0.7),
              //     prefixIcon: Icon(
              //       Icons.message_outlined,
              //       color: KColors.persistentBlack.withValues(alpha: 0.5),
              //       size: 20.h,
              //     ),
              //     controller: controller.desController,
              //     borderRadius: 10,
              //     hint: "Message",
              //     fillColor: Colors.transparent,
              //     validator: (value) => Validation.emptyValidation(value!),
              //     // onChanged: (p0) =>
              //     //     controller.checkPhoneNumberLength()
              //   ),
              // ),
              height20,
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: KColors.persistentBlack
                                .withValues(alpha: 0.2)))),
                child: CustomTextFormField(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getVerticalSize(10),
                      horizontal: getHorizontalSize(20)),
                  inputType: TextInputType.name,
                  hintcolor: KColors.persistentBlack.withValues(alpha: 0.7),
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: KColors.persistentBlack.withValues(alpha: 0.5),
                    size: 20.h,
                  ),
                  controller: controller.desController,
                  borderRadius: 10,
                  hint: "Enter the venue",
                  fillColor: Colors.transparent,
                  validator: (value) => Validation.emptyValidation(value!),
                  // onChanged: (p0) =>
                  //     controller.checkPhoneNumberLength()
                ),
              ),
              height20,
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.selectDate(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10.w),
                      width: Get.width,
                      height: 35.h,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: KColors.persistentBlack
                                      .withValues(alpha: 0.2)))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color:
                                KColors.persistentBlack.withValues(alpha: 0.4),
                          ),
                          width15,
                          controller.selectedDate.value.isEmpty ||
                                  controller.selectedDate.value == "null"
                              ? "Date of Function".f16w4(
                                  textColor: KColors.persistentBlack
                                      .withValues(alpha: 0.7),
                                  fontSize: 12.sp)
                              : controller.selectedDate.value
                                  .toString()
                                  .split("00:00:00.000")
                                  .first
                                  .f16w4(
                                      textColor: KColors.persistentBlack
                                          .withValues(alpha: 0.7),
                                      fontSize: 12.sp)
                        ],
                      )),
                ),
              ),
              height20,
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: KColors.persistentBlack
                                .withValues(alpha: 0.2)))),
                child: CustomTextFormField(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getVerticalSize(10),
                      horizontal: getHorizontalSize(20)),
                  inputType: TextInputType.name,
                  hintcolor: KColors.persistentBlack.withValues(alpha: 0.7),
                  prefixIcon: Icon(
                    Icons.chat,
                    color: KColors.persistentBlack.withValues(alpha: 0.5),
                    size: 20.h,
                  ),
                  controller: controller.functionController,
                  borderRadius: 10,
                  hint: "Enter your Function name",
                  fillColor: Colors.transparent,
                  validator: (value) => Validation.emptyValidation(value!),
                  // onChanged: (p0) =>
                  //     controller.checkPhoneNumberLength()
                ),
              ),
              getheight(context, 0.040),
              PrimaryElevatedButton(
                  text: "Send",
                  ontap: () async {
                    if (controller.formKey.currentState!.validate()) {
                      await controller.sendEnquiry(
                          context, homePageController.catelougeId.value);
                      Get.back();
                    } else {}
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
