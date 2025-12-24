import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/shimmer.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../albumPage/view/albumPage.dart';

class Showsubcategorypage extends GetView<HomePageController> {
  const Showsubcategorypage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: customSearchWidget(),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: getVerticalSize(10)),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                height: Get.height,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...Iterable.generate(controller.categoryList.length)
                          .map((e) => controller.categoryList[e].id == null
                              ? SizedBox()
                              : Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(2),
                                      height: 43.h,
                                      width: 105.w,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color((math.Random()
                                                              .nextDouble() *
                                                          0xFFFFFF)
                                                      .toInt())
                                                  .withValues(alpha: 1.0)),
                                          color: KColors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30),
                                              bottomRight:
                                                  Radius.circular(30))),
                                    ),
                                    Obx(
                                      () => InkWell(
                                        borderRadius: BorderRadius.circular(30),
                                        onTap: () {
                                          controller.indexes.value = e;
                                          controller.categoryId.value =
                                              controller.categoryList[e].id
                                                  .toString();
                                          controller.getSubCategory(
                                              context,
                                              controller.categoryList[e].id
                                                  .toString());
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(2),
                                          height: 40.h,
                                          width: 105.w,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: e ==
                                                          controller
                                                              .indexes.value
                                                      ? KColors.mehroom
                                                      : KColors.grey.withValues(
                                                          alpha: 0.2),
                                                  width: 1.4),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(30),
                                                  bottomRight:
                                                      Radius.circular(30)),
                                              gradient: LinearGradient(
                                                begin: Alignment.topRight,
                                                end: Alignment.bottomLeft,
                                                colors: e ==
                                                        controller.indexes.value
                                                    ? [
                                                        KColors.pinkColor,
                                                        KColors.purpleColor
                                                      ]
                                                    : [
                                                        KColors.white,
                                                        Color((math.Random()
                                                                        .nextDouble() *
                                                                    0xFFFFFF)
                                                                .toInt())
                                                            .withValues(
                                                                alpha: 0.1)
                                                      ],
                                              )),
                                          child: Row(
                                            children: [
                                              width5,
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: SizedBox(
                                                  width: 86.w,
                                                  child: controller
                                                      .categoryList[e].category
                                                      .toString()
                                                      .f14w4(
                                                          textColor: e ==
                                                                  controller
                                                                      .indexes
                                                                      .value
                                                              ? KColors.white
                                                              : KColors
                                                                  .background,
                                                          fontFamily: Fontfamily
                                                              .poppins,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 10.sp),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                    ],
                  ),
                ),
              ),
              Obx(
                () => Expanded(
                  child: SizedBox(
                      height: Get.height,
                      child: controller.subCategoryListUpdate.isEmpty
                          ? Center(
                              child: "No data"
                                  .f16w6(textColor: KColors.background),
                            )
                          : ListView(
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    ...Iterable.generate(controller
                                            .subCategoryListUpdate.length)
                                        .map((e) {
                                      return controller.subCategoryListUpdate[e]
                                                  .image
                                                  .toString() ==
                                              "null"
                                          ? SizedBox()
                                          : CustomCachedNetworkImage(
                                              image: controller
                                                  .subCategoryListUpdate[e]
                                                  .image
                                                  .toString(),
                                              imagebuilder: (context, index1) {
                                                return InkWell(
                                                  onTap: () async {
                                                    controller
                                                        .selectedSubCategoryIndex
                                                        .value = e;
                                                    // controller.indexes.value =
                                                    //     e;
                                                    controller.pagiNationValue
                                                        .value = 0;
                                                    controller.subCategoryId
                                                            .value =
                                                        controller
                                                            .subCategoryListUpdate[
                                                                e]
                                                            .id
                                                            .toString();

                                                    await controller.catelougeListByCategory(
                                                        context,
                                                        controller
                                                            .categoryId.value,
                                                        controller.subCategoryId
                                                            .value);

                                                    await controller
                                                        .getCatelougeType(
                                                            Get.context,
                                                            controller
                                                                .categoryId
                                                                .value);

                                                    await pageNavigation(
                                                        AlbumPage());
                                                  },
                                                  child: Container(
                                                    height: 150.h,
                                                    width: 100.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      // color: Color(controller.subCategoryList[index]
                                                      //     ["colors"]!),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              controller
                                                                  .subCategoryListUpdate[
                                                                      e]
                                                                  .image
                                                                  .toString()),
                                                          fit: BoxFit.cover),
                                                    ),
                                                    margin: EdgeInsets.all(4),
                                                    child: Stack(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 10.w,
                                                                    bottom:
                                                                        10.h),
                                                            width: Get.width,
                                                            height: 25.h,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: KColors
                                                                        .vanila),
                                                            child: Text(
                                                              controller
                                                                  .subCategoryListUpdate[
                                                                      e]
                                                                  .subcat!,
                                                              style: TextStyle(
                                                                color: KColors
                                                                    .background,
                                                                fontFamily:
                                                                    Fontfamily
                                                                        .poppins,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize:
                                                                    7.4.sp,
                                                                shadows: [
                                                                  Shadow(
                                                                      color: KColors
                                                                          .white,
                                                                      offset:
                                                                          Offset(
                                                                              2,
                                                                              3),
                                                                      blurRadius:
                                                                          15)
                                                                ],
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              placeHolder: (p0, p1) =>
                                                  BannerShimmer(
                                                    height: 150.h,
                                                    width: 100.w,
                                                  ));
                                    })
                                  ],
                                ),
                              ],
                            )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
