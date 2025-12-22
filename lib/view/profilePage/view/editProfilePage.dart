import 'dart:io';

import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customElevatedButton.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/customformfileds.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/utils/validation.dart';
import 'package:catalougeapp/view/profilePage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfilePage extends GetView<ProfilePageController> {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: "Edit Profile".f14w4(
            textColor: KColors.persistentBlack,
            fontFamily: Fontfamily.poppins,
            fontWeight: FontWeight.w600),
      ),
      body: Column(
        children: [
          getheight(context, 0.023),
          Card(
            elevation: 0,
            margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(100)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Obx(() {
                      ImageProvider? imageProvider;

                      if (controller.profileImagePath.value.isNotEmpty) {
                        imageProvider =
                            FileImage(File(controller.profileImagePath.value));
                      } else if (controller
                              .profileModel.value.image?.isNotEmpty ==
                          true) {
                        imageProvider =
                            NetworkImage(controller.profileModel.value.image!);
                      }

                      return CircleAvatar(
                        radius: 34.r,
                        backgroundColor: KColors.mehroom,
                        backgroundImage: imageProvider,
                        child: imageProvider == null
                            ? Text(
                                controller.profileModel.value.fname
                                            ?.isNotEmpty ==
                                        true
                                    ? controller.profileModel.value.fname!
                                        .characters.first
                                        .toUpperCase()
                                    : "A",
                                style: TextStyle(
                                  color: KColors.white,
                                  fontSize: 20.sp,
                                  fontFamily: Fontfamily.poppins,
                                ),
                              )
                            : null,
                      );
                    }),
                    InkWell(
                      onTap: () async {
                        var storagePermission = await Permission.storage.status;
                        if (!storagePermission.isGranted) {
                          storagePermission =
                              await Permission.storage.request();
                        }

                        if (storagePermission.isGranted) {
                          controller.getImage(ImageSource.gallery, context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Storage permission denied")),
                          );
                        }
                      },
                      child: CircleAvatar(
                        maxRadius: 14.sp,
                        child: Icon(
                          Icons.camera_alt,
                          size: 14.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          getheight(context, 0.020),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Full name".f14w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 12.sp),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: KColors.grey.withValues(alpha: 0.5)))),
                  child: CustomTextFormField(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: getVerticalSize(7)),
                      // inputFormator: [LengthLimitingTextInputFormatter(10)],
                      inputType: TextInputType.name,
                      hintcolor: KColors.grey,
                      // prefixIcon: Icon(
                      //   Icons.phone_android,
                      //   color: KColors.grey,
                      //   size: 20.h,
                      // ),
                      controller: controller.fullnameController,
                      borderRadius: 10,
                      hint: "full name..",
                      fillColor: Colors.transparent,
                      validator: (value) => Validation.emptyValidation(value!)),
                ),
                height20,
                height10,
                "Email address".f14w4(
                    textColor: KColors.persistentBlack,
                    fontFamily: Fontfamily.poppins,
                    fontSize: 12.sp),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: KColors.grey.withValues(alpha: 0.5)))),
                  child: CustomTextFormField(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: getVerticalSize(7)),
                      // inputFormator: [LengthLimitingTextInputFormatter(10)],
                      inputType: TextInputType.emailAddress,
                      hintcolor: KColors.grey,
                      // prefixIcon: Icon(
                      //   Icons.phone_android,
                      //   color: KColors.grey,
                      //   size: 20.h,
                      // ),
                      controller: controller.emailController,
                      borderRadius: 10,
                      hint: "email address...",
                      fillColor: Colors.transparent,
                      validator: (value) => Validation.emptyValidation(value!)),
                ),
              ],
            ),
          ),
          getheight(context, 0.060),
          PrimaryElevatedButton(
              text: "Update",
              ontap: () async {
                await controller.updateProfile(context);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
