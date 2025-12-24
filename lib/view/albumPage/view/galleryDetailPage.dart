import 'dart:io';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/albumPage/view/productEnquiryPage.dart';
import 'package:catalougeapp/view/albumPage/widget/video%5BPlayer.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AlbumDetailPage extends StatefulWidget {
  const AlbumDetailPage({super.key});

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  late CarouselSliderController controller;
  late PageController pageController;

  Future<void> saveImage(BuildContext context, String url) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    late String message;
    var random = Random();
    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        message = 'Image saved to disk';
      }
    } catch (e) {
      message = e.toString();
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFe91e63),
      ));
    }

    if (message != null) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFe91e63),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    controller = CarouselSliderController();
  }

  HomePageController homePageController = Get.find();

  Future<void> downloadAndShareImage(String imageUrl) async {
    final tempDir = await getTemporaryDirectory();
    final filePath = "${tempDir.path}/image.jpg";

    final response = await Dio().download(imageUrl, filePath);
    if (response.statusCode == 200) {
      const message = '''
🌟 Check Out This Amazing Design! 🌟
Hey friends! 🎉
Mehndiwalaa.com  provides professional, high-quality Bridal Mehndi & all type of Mehndi services all over India, right at your doorstep. We use 100% organic herbal mehndi and have our own professionally certified Bridal Mehndi artists in your city.

Please download our mobile app

Android: https://play.google.com/store/apps/details?id=com.catalougeapp.app&pcampaignid=web_share 
''';
      await Share.shareXFiles(
        [XFile(filePath)],
        text: message,
        subject: "Mehndiwala App",
      );
    } else {}
  }

  void precacheImages(BuildContext context) {
    for (var element in homePageController.categoryDetailList) {
      if (element.type != "2" && element.image != null) {
        precacheImage(NetworkImage(element.image!), context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //HomePageController homePageController = Get.find();
    precacheImages(context);
    return Scaffold(
      appBar: AppBar(
        title: customSearchWidget(),
        backgroundColor: Colors.white,
        toolbarHeight: 50.h,
      ),
      body: homePageController.getImageStatus.value == "0"
          ? Center(
              child: Text('No data '),
            )
          : Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  color: Colors.grey.shade400,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Listener(
                        onPointerMove: (moveEvent) {
                          if (moveEvent.delta.dx > 0) {
                            homePageController.swipeLeftOrRight.value = "1";
                            homePageController.disableInfiniteScrolling.value =
                                true;
                            debugPrint("left");
                          } else {
                            homePageController.swipeLeftOrRight.value = "2";
                            debugPrint("right");
                          }
                        },
                        child: Obx(
                          () {
                            final list = homePageController.categoryDetailList;
                            final currentIndex = homePageController
                                .albumPageController.sliderIndex.value;
                            final lastIndex = list.length - 1;
                            return CarouselSlider(
                              items: homePageController.categoryDetailList
                                  .map((element) {
                                return SizedBox(
                                  height: Get.height * 0.60,
                                  width: Get.width, // force full screen width
                                  child: element.type == "2"
                                      ? CustomVideoPlayer(
                                          videoUrl: element.videoUrl,
                                          width: Get.width,
                                          ontap: () {},
                                          //height: 600.h,
                                          ishide: false,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: element.image!,
                                          fit: BoxFit.cover,
                                          width: Get.width,
                                          height: Get.height * 0.60,
                                          // height: 600.h,
                                          placeholder: (context, url) =>
                                              const Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fadeInDuration:
                                              Duration.zero, // remove fade
                                          fadeOutDuration: Duration.zero,
                                        ),
                                );
                              }).toList(),
                              options: CarouselOptions(
                                scrollPhysics: currentIndex == 0
                                    ? const BouncingScrollPhysics() // disables left swipe
                                    : currentIndex == lastIndex
                                        ? const ClampingScrollPhysics() // disables right swipe
                                        : const BouncingScrollPhysics(),
                                height: Get.height * 0.60,
                                viewportFraction: 1, // full width per item
                                enlargeCenterPage:
                                    false, // remove extra padding
                                enableInfiniteScroll: homePageController
                                    .disableInfiniteScrolling.value,
                                reverse: true,
                                autoPlay: false,
                                onPageChanged: (v, c) async {
                                  final list =
                                      homePageController.categoryDetailList;
                                  final previousIndex = homePageController
                                      .albumPageController.sliderIndex.value;

                                  // Guard: list is empty
                                  if (list.isEmpty) {
                                    return;
                                  }
                                  // Guard: invalid index
                                  if (v < 0 || v >= list.length) {
                                    return;
                                  }

                                  // Update slider index safely
                                  homePageController.albumPageController
                                      .sliderIndex.value = v;

                                  // Only call getImageSlider if list has data for that direction
                                  final swipeDir =
                                      homePageController.swipeLeftOrRight.value;
                                  if (swipeDir == "1" || swipeDir == "2") {
                                    try {
                                      final itemId = list[v].id.toString();
                                      final response = await homePageController
                                          .getImageSlider(
                                        context,
                                        homePageController.categoryId.value,
                                        homePageController.subCategoryId.value,
                                        itemId,
                                        swipeDir,
                                      );

                                      // If API returned status 0, do NOT clear the current list
                                      if (homePageController
                                              .getImageStatus.value ==
                                          "0") {
                                        if (swipeDir == "1") {
                                          homePageController
                                              .canSwipeRight.value = false;
                                        } else {
                                          homePageController
                                              .canSwipeLeft.value = false;
                                        }

                                        homePageController.isReverting.value =
                                            true;
                                        await controller.animateToPage(
                                          previousIndex,
                                          duration:
                                              const Duration(milliseconds: 800),
                                          curve: Curves.easeOut,
                                        );
                                        homePageController.isReverting.value =
                                            false;

                                        return;
                                      }
                                    } catch (e) {}
                                  }
                                },

                                scrollDirection: Axis.horizontal,
                              ),
                              carouselController: controller,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 500.h,
                        width: Get.width,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () => downloadAndShareImage(
                                    homePageController
                                        .categoryDetailList[homePageController
                                            .albumPageController
                                            .sliderIndex
                                            .value]
                                        .image!,
                                  ),
                                  child: CustomSvgImage(
                                    image: ConstantValue.shareIcon,
                                    height: 30.h,
                                  ),
                                ),
                                height20,
                                Obx(() {
                                  if (homePageController.isLoading.value) {
                                    return SizedBox(
                                      height: 30.h,
                                      width: 30.h,
                                      child: Center(
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2)),
                                    );
                                  }

                                  final index = homePageController
                                      .albumPageController.sliderIndex.value;
                                  final item = homePageController
                                      .categoryDetailList[index];
                                  return InkWell(
                                    onTap: () async {
                                      await homePageController
                                          .albumPageController
                                          .saveWhisList(
                                        context,
                                        item.id.toString(),
                                        item.wishlist == 0 ? "1" : "0",
                                      );
                                      await homePageController.getImageSlider(
                                          context,
                                          homePageController.categoryId.value,
                                          homePageController
                                              .subCategoryId.value,
                                          homePageController
                                              .categoryDetailList[
                                                  homePageController
                                                      .albumPageController
                                                      .sliderIndex
                                                      .value]
                                              .id
                                              .toString(),
                                          "3");
                                      homePageController.getWhislist(context);
                                    },
                                    child: CustomSvgImage(
                                      image: homePageController
                                                  .categoryDetailList[
                                                      homePageController
                                                          .albumPageController
                                                          .sliderIndex
                                                          .value]
                                                  .wishlist ==
                                              1
                                          //   item.wishlist == 1
                                          ? ConstantValue.favouritefilled
                                          : ConstantValue.favouriteOutline,
                                      height: 30.h,
                                    ),
                                  );
                                }),
                                height20,
                                InkWell(
                                  onTap: () async {
                                    saveImage(
                                        context,
                                        homePageController
                                            .categoryDetailList[
                                                homePageController
                                                    .albumPageController
                                                    .sliderIndex
                                                    .value]
                                            .image!);
                                  },
                                  child: CustomImageProvider.assetsImage(
                                      image: "assets/images/Group 33736.png",
                                      height: 30.h),
                                ),
                                Spacer(),
                                CustomSvgImage(
                                  image: ConstantValue.appPrimaryLogo,
                                  height: 50.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => homePageController.isWallpaperLoading.value
                      ? LinearProgressIndicator()
                      : SizedBox(),
                ),
                getheight(context, 0.020),
                Obx(
                  () => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getHorizontalSize(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            homePageController.categoryDetailList.isEmpty
                                ? SizedBox(
                                    width: 250.w,
                                  )
                                : SizedBox(
                                    width: 250.w,
                                    child: homePageController
                                        .categoryDetailList[homePageController
                                            .albumPageController
                                            .sliderIndex
                                            .value]
                                        .heading
                                        .toString()
                                        .f16w6(
                                            textColor: KColors.persistentBlack,
                                            fontSize: 17.sp,
                                            fontFamily: Fontfamily.poppins),
                                  ),
                            Row(
                              children: [
                                //Text("Sku Id: "),
                                "SKU Id: ".f16w6(
                                    textColor: KColors.persistentBlack,
                                    fontSize: 14.sp,
                                    fontFamily: Fontfamily.poppins),
                                Obx(
                                  () => homePageController.isLoading.value
                                      ? CircularProgressIndicator()
                                      : homePageController
                                                  .categoryDetailList[
                                                      homePageController
                                                          .albumPageController
                                                          .sliderIndex
                                                          .value]
                                                  .skuId
                                                  .toString() ==
                                              "null"
                                          ? SizedBox()
                                          : homePageController
                                              .categoryDetailList[
                                                  homePageController
                                                      .albumPageController
                                                      .sliderIndex
                                                      .value]
                                              .skuId
                                              .toString()
                                              .f16w6(
                                                  textColor:
                                                      KColors.persistentBlack,
                                                  fontSize: 14.sp,
                                                  fontFamily:
                                                      Fontfamily.poppins),
                                ),
                              ],
                            )
                          ],
                        ),
                        width10,
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              //=>
                              // print("cudgfsdnksddhvhjdbhdg"),

                              if (homePageController
                                      .categoryDetailList[homePageController
                                          .albumPageController
                                          .sliderIndex
                                          .value]
                                      .bookingType ==
                                  "2") {
                                pageNavigation(ProductEnquiryPage());

                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                var autoMob = pref.getString("autoMob")!;
                                var autoName = pref.getString("autoName")!;
                                homePageController.albumPageController
                                    .mobileController.text = autoMob;
                                homePageController.albumPageController
                                    .nameController.text = autoName;
                              } else {
                                pageNavigation(ProductEnquiryPage());
                                //  pageNavigation(UpgradePrimiumPage());
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: KColors.background,
                                  gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      KColors.pinkColor,
                                      KColors.purpleColor
                                    ],
                                  )),
                              child: homePageController
                                          .categoryDetailList[homePageController
                                              .albumPageController
                                              .sliderIndex
                                              .value]
                                          .bookingType ==
                                      "2"
                                  //   homePageController.catelougEnquiryType.value == "1"
                                  // ? "Book Now".f16w4(
                                  //     fontSize: 12.sp, fontWeight: FontWeight.w500)
                                  ? "Enquiry Now".f16w4(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500)
                                  : "Enquiry Now".f16w4(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => Align(
                    alignment: Alignment.topLeft,
                    child: homePageController.catelougeDescription.value
                        .toString()
                        .f16w6(
                            textColor: KColors.persistentBlack,
                            fontSize: 10.sp,
                            fontFamily: Fontfamily.poppins)
                        .paddingAll(10),
                  ),
                ),
                homePageController.setWallpaper(
                    context,
                    homePageController
                        .categoryDetailList[homePageController
                            .albumPageController.sliderIndex.value]
                        .image!)
              ],
            ),
    );
  }
}
