import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/model/catelougeTypeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropDownWidget extends StatelessWidget {
  final HomePageController? controller;
  final String? value;
  final List<CatelougeTypeModel>? list;
  final Function? ontap;
  const CustomDropDownWidget(
      {super.key,
      required this.value,
      required this.list,
      this.controller,
      this.ontap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: 
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: KColors.purpleColor),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 33.h,
        width: Get.width,
        child: DropdownButton<String>(
          dropdownColor: KColors.white,
          hint: "Select state".f12w4(textColor: KColors.borderColor),
          isExpanded: true,
          value: value,
          icon: Icon(Icons.arrow_drop_down_outlined),
          elevation: 16,
          style: const TextStyle(color: KColors.goldColor),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            // setState(() {
            //   dropdownValue = value!;
            // });
          },
          items: list!.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
                value: value.cataloguecategory,
                child: Text(
                  value.cataloguecategory!,
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: KColors.persistentBlack,
                      fontFamily: Fontfamily.poppins,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  controller!.categoryValue2.value = value.cataloguecategory!;
                  controller!.filter(
                      context,
                      controller!.categoryId.value,
                      controller!.subCategoryId.value,
                      value.cataloguecategory!,
                      "");
                  // ontap!();
                  // mainPageController.statevalue
                  //     .value = value.state!;
                  // mainPageController.getCity(
                  //     context,
                  //     value.id.toString());
                  // mainPageController
                  //         .mainStateId.value =
                  //     value.id.toString();
                  Get.back();
                });
          }).toList(),
        ),
      ),
    );
  }
}

class CustomCategoryDropDownWidget extends StatelessWidget {
  final HomePageController? controller;
  final String? value;
  final List<CatelougeTypeModel>? list;
  final Function? ontap;
  const CustomCategoryDropDownWidget(
      {super.key,
      required this.value,
      required this.list,
      this.controller,
      this.ontap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: KColors.purpleColor),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 33.h,
        width: Get.width,
        child: DropdownButton<String>(
          dropdownColor: KColors.white,
          hint: "Type".f12w4(textColor: KColors.persistentBlack),
          isExpanded: true,
          value: value,
          icon: Icon(Icons.arrow_drop_down_outlined),
          elevation: 16,
          style: const TextStyle(color: KColors.goldColor),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            // setState(() {
            //   dropdownValue = value!;
            // });
          },
          items: list!.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
                value: value.cataloguecategory,
                child: Text(
                  value.cataloguecategory!,
                  style: TextStyle(
                      fontSize: 9.sp,
                      color: KColors.persistentBlack,
                      fontFamily: Fontfamily.poppins,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  controller!.categoryValue.value = value.cataloguecategory!;
                  controller!.filter(
                      context,
                      controller!.categoryId.value,
                      controller!.subCategoryId.value,
                      "",
                      value.cataloguecategory!);
                  // ontap!();
                  // mainPageController.statevalue
                  //     .value = value.state!;
                  // mainPageController.getCity(
                  //     context,
                  //     value.id.toString());
                  // mainPageController
                  //         .mainStateId.value =
                  //     value.id.toString();
                  Get.back();
                });
          }).toList(),
        ),
      ),
    );
  }
}
