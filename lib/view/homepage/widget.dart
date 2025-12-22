import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/view/albumPage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/showsubCategoryPage.dart';
import 'package:catalougeapp/view/searchPage/view.dart';
import 'package:flutter/material.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryWidget extends StatelessWidget {
  final Function? ontap;
  const CategoryWidget({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap!();
      },
      child: Container(
        // margin: EdgeInsets.all(7),
        // height: 200.h,
        width: 180.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            border: Border.all(color: KColors.grey.withValues(alpha: 0.1)),
            color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCachedNetworkImage(
              image:
                  "https://s3-alpha-sig.figma.com/img/327a/455a/1c09fb74a0243c000f2394ba7aef0d73?Expires=1736726400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=m-pZBFEWi1Effsfo9gDsRdwRTYQGxMQ3kV43U6apUAqtLvuUnPebDiZkIukCsiZndOcgLvmQtBVaVbfKCe1oj74A-Gfh7BF6bttrqkmixgVSqZxKYP~ULoPAtx5DJKjIhOvflzoMp3n-mBXJ7EZTlOCI4~9p-Lzd~VEouqRnGlh3QwhhysJfNVNWrbtYbJLKfJVxARXgxofQEs3fjzJHF~joJrqzr8uxBIeCthi0gMLBUPdwah0ADBV20ukey6XbYEEUGQG4gskN6KWMsI8vmx5E6UtFZPPu0AYBaLuE5XE33mIwSNBELa6UChiAZOm-H4ALtCifqHo2G7Ug1z5y7w__",
              imagebuilder: (context, img) {
                return Container(
                  height: 120.h,
                  margin: EdgeInsets.all(0),
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(image: img, fit: BoxFit.cover)),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white54),
                        height: 23.h,
                        width: 25.w,
                        child: Icon(
                          Icons.bookmark_outline,
                          color: KColors.mehroom,
                          size: 15.h,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  getheight(context, 0.005),
                  "Intercontinental Chennai....".toString().f13w5(
                      textColor: KColors.persistentBlack,
                      fontSize: 10.sp,
                      fontFamily: Fontfamily.poppins,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center),
                  getheight(context, 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: "Vadanemmelli, Chennai".toString().f13w5(
                              textColor: KColors.grey,
                              fontSize: 8.sp,
                              fontFamily: Fontfamily.poppins,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            size: 13.h,
                            color: KColors.yellow,
                          ),
                          "4.4".toString().f13w5(
                              textColor: KColors.mehroom,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center),
                          " (12) ".toString().f13w5(
                              textColor: KColors.mehroom,
                              fontSize: 7.sp,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center)
                        ],
                      )
                    ],
                  ),
                  getheight(context, 0.005),
                  Row(
                    children: [
                      CustomImageProvider.assetsImage(
                          image: "assets/icons/weddingHallicon.png",
                          height: 11.h),
                      width2,
                      Expanded(
                        child: SizedBox(
                          child: "Wedding Halls, Marriage Garden/ Lawns"
                              .toString()
                              .f13w5(
                                  textColor: KColors.grey,
                                  fontSize: 8.sp,
                                  fontFamily: Fontfamily.poppins,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      width15,
                      Row(
                        children: [
                          Icon(
                            Icons.group_outlined,
                            size: 12.h,
                            color: KColors.grey,
                          ),
                          width2,
                          "500-700px".toString().f13w5(
                              textColor: KColors.grey,
                              fontSize: 7.sp,
                              fontFamily: Fontfamily.poppins,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ],
                      )
                    ],
                  ),
                  getheight(context, 0.010),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          "₹ 90,000 ".toString().f13w5(
                              textColor: KColors.mehroom,
                              fontSize: 10.sp,
                              fontFamily: Fontfamily.poppins,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                          "per plate (Veg.)".toString().f13w5(
                              textColor: KColors.mehroom,
                              fontSize: 6.sp,
                              fontFamily: Fontfamily.poppins,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                      Row(
                        children: [
                          CustomImageProvider.assetsImage(
                              image: "assets/icons/chat.png",
                              height: 12.h,
                              color: KColors.mehroom),
                          width10,
                          CustomImageProvider.assetsImage(
                              image: "assets/icons/call.png",
                              height: 12.h,
                              color: KColors.mehroom),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> showLogoutDialog(context, String title, String subTitle,
    Function onTaps, String buttonText) async {
  return showDialog<void>(
    context: context,
    // barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: KColors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: KColors.grey)),
        title: title.f16w4(
            textColor: KColors.persistentBlack,
            fontSize: 17.sp,
            fontWeight: FontWeight.w600),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                subTitle,
                style: const TextStyle(color: KColors.persistentBlack),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LogoutButton(
                text: "Cancel",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
              LogoutButton(
                  text: buttonText,
                  ontap: () {
                    onTaps();
                  }),
            ],
          )
        ],
      );
    },
  );
}

class LogoutButton extends StatelessWidget {
  final String? text;
  final Function? ontap;
  const LogoutButton({super.key, this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: KColors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () async {
          ontap!();
          // await controller.localStorage.deleteToken();
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => LoginPage()),
          //     (Route<dynamic> route) => false);
          // Get.offAll(const LoginPage());
        },
        child:
            text!.f16w4(textColor: KColors.persistentBlack, fontSize: 12.sp));
  }
}

listTileWidget(
  context,
  String text,
  Function(bool)? ontap,
) {
  return Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      onExpansionChanged: ontap,
      iconColor: KColors.white,
      collapsedIconColor: KColors.white,
      title: text.f16w4(
        textColor: KColors.persistentBlack,
        fontSize: 12.sp,
        fontFamily: Fontfamily.poppins,
      ),
    ),
  );
}

customDivider() {
  return Container(
    height: 2,
    width: Get.width,
    color: KColors.grey.withValues(alpha: 0.1),
  );
}

class CustomCarouselSlider extends GetView<HomePageController> {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            CarouselSlider(
                items: controller.bannerList
                    .map((element) => CustomCachedNetworkImage(
                          image: element.image.toString(),
                          imagebuilder: (context, img) {
                            return InkWell(
                              onTap: () {
                                launchUrl(Uri.parse(element.link!));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: getHorizontalSize(2)),
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: KColors.white,
                                    image: DecorationImage(
                                        image: img, fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            );
                          },
                          placeHolder: (p0, p1) => Center(
                              child: RepaintBoundary(
                                  child: CircularProgressIndicator())),
                        ))
                    .toList(),
                options: CarouselOptions(
                  // scrollPhysics: NeverScrollableScrollPhysics(),
                  height: 100.h,
                  aspectRatio: 1.2,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.2,
                  onPageChanged: (index, pageChanged) {
                    controller.newbannerIndex.value = index;
                  },
                  scrollDirection: Axis.horizontal,
                )),
            height10,
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...Iterable.generate(controller.bannerList.length)
                      .map((e) => Container(
                            // margin: const EdgeInsets.all(2),
                            height: 7,
                            width: 10.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(5),
                              color: controller.newbannerIndex.value == e
                                  ? KColors.pinkColor
                                  : KColors.pinkColor.withValues(alpha: 0.3),
                            ),
                          ))
                ],
              ),
              // ),
            )
          ],
        ));
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class CommonCategoryWidget extends StatelessWidget {
  final HomePageController controller;
  final int index;
  final List list;
  const CommonCategoryWidget({
    super.key,
    required this.controller,
    required this.index,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () async {
            controller.indexes.value = index;
            controller.categoryId.value =
                controller.categoryList[index].id.toString();
            await controller.getSubCategory(
                context, controller.categoryList[index].id.toString());
            pageNavigation(Showsubcategorypage());
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(5),
            height: 130.h,
            width: 165.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: KColors.background,
              image: DecorationImage(
                image: NetworkImage(controller.categoryList[index].image!),
                fit: BoxFit.cover,
                // colorFilter: new ColorFilter.mode(
                //     KColors.persistentBlack,
                //     BlendMode.softLight),
              ),
            ),
            child: Stack(
              children: [
                Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    height: 25.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: KColors.vanila),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.categoryList[index].category
                            .toString()
                            .f13w5(
                                textColor: KColors.persistentBlack,
                                fontSize: 10.sp,
                                fontFamily: Fontfamily.poppins,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.center),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}

customSearchWidget() {
  AlbumPageController albumPageController = Get.find();
  return InkWell(
    onTap: () {
      albumPageController.searchController.clear();
      albumPageController.searchList.clear();
      pageNavigation(SearchPage());
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
      margin: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
      height: 35.h,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: KColors.white,
          image: DecorationImage(
              image: AssetImage(ConstantValue.searchBg), fit: BoxFit.cover)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstantValue.searchAnyKeyword.f14w4(
            textColor: KColors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            fontFamily: Fontfamily.poppins,
          ),
          CustomSvgImage(
            image: ConstantValue.searchIcon,
            height: 10.h,
          ),
        ],
      ),
    ),
  );
}
