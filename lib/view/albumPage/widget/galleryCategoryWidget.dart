import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryMenu extends GetView<HomePageController> {
  final Function? ontap;
  const CategoryMenu({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.grey.withValues(alpha: 0.1),
      height: 105.h,
      width: Get.width,
      child: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.only(left: 0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            // final isSelected = index == controller.indexes.value;
            return InkWell(
              onTap: () async {
                controller.indexes.value = index;
                controller.subCategoryId.value =
                    controller.subCategoryListUpdate[index].id.toString();
                await controller.catelougeListByCategory(
                    context,
                    controller.categoryId.value,
                    controller.subCategoryId.value);
              },
              child: controller.subCategoryListUpdate[index].image == null
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCachedNetworkImage(
                            image:
                                controller.subCategoryListUpdate[index].image!,
                            imagebuilder: (p0, p1) => Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color:
                                          KColors.grey.withValues(alpha: 0.1),
                                      spreadRadius: 5,
                                      offset: Offset(0, 6))
                                ],
                              ),
                              child: Container(
                                height: 60.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: KColors.white,
                                    gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        KColors.pinkColor,
                                        KColors.purpleColor
                                      ],
                                    )),
                                // radius: 35.r,
                                // backgroundColor: KColors.white,
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  height: 65.h,
                                  width: 65.w,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: KColors.white,
                                      image: DecorationImage(
                                          image: p1, fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                          ),
                          height5,
                          //   placeHolder: (p0, p1) => HomeSubCategoryShimmer(
                          //     height: 50.h,
                          //     width: 50.w,
                          //   ),
                          // ),

                          Obx(
                            () => SizedBox(
                              width: 100,
                              child: controller
                                  .subCategoryListUpdate[index].subcat
                                  .toString()
                                  .f13w5(
                                      textColor:
                                          controller.indexes.value == index
                                              ? KColors.purpleColor
                                              : KColors.persistentBlack,
                                      fontSize: 9.sp,
                                      fontFamily: Fontfamily.montserrat,
                                      fontWeight: FontWeight.w700,
                                      textAlign: TextAlign.center),
                            ),
                          )
                        ],
                      ),
                    ),
            );
          },
          itemCount: controller.subCategoryListUpdate.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
