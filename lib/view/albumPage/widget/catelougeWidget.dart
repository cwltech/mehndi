import 'dart:ui';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/shimmer.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/upgradePrimiumPage/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CatelougeWidget extends StatelessWidget {
  final HomePageController? controller;
  final int? index;
  const CatelougeWidget({super.key, this.controller, this.index});

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
        image: controller!.catelougeListByCategoryList[index!].image.toString(),
        imagebuilder: (context, image) {
          return InkWell(
              onTap: () {
                controller!.catelougeListByCategoryList[index!].primium == "1"
                    ? pageNavigation(UpgradePrimiumPage())
                    : controller!.catelougeDetailPage(index, context);
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Obx(
                        () => Container(
                          margin: EdgeInsets.all(5.h),
                          // width: 180.w,
                          height: 230.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    controller!
                                        .catelougeListByCategoryList[index!]
                                        .image,
                                  ))),
                          child: controller!.catelougeListByCategoryList[index!]
                                      .primium ==
                                  "1"
                              ? BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 10.0, sigmaY: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white
                                            .withValues(alpha: 0.0)),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      controller!.catelougeListByCategoryList[index!].primium ==
                              "0"
                          ? SizedBox()
                          : Padding(
                              padding: EdgeInsets.all(10.w),
                              child: CircleAvatar(
                                radius: 15.r,
                                backgroundColor: KColors.persistentBlack,
                                child: CustomImageProvider.assetsImage(
                                    image: "assets/icons/crown.png",
                                    height: 15.h),
                              )),
                      if (controller!
                              .catelougeListByCategoryList[index!].type ==
                          "2")
                        Positioned(
                          bottom:
                              MediaQuery.of(context).size.height * 0.13, //120,
                          right: MediaQuery.of(context).size.width * 0.19, //80,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                    ],
                  )));
        },
        placeHolder: (p0, p1) => BannerShimmer(
              height: 160.h,
              width: 220.w,
            ));
  }
}
