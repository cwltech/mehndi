import 'package:cached_network_image/cached_network_image.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/albumPage/controller/controller.dart';
import 'package:catalougeapp/view/albumPage/view/productEnquiryPage.dart';
import 'package:catalougeapp/view/albumPage/widget/actionWallpaperbutton.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/widget.dart';
import 'package:catalougeapp/view/upgradePrimiumPage/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:math';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';

// import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_manager_plus/wallpaper_manager_plus.dart';

class SearchDeatilPage extends StatefulWidget {
  const SearchDeatilPage({super.key});

  @override
  State<SearchDeatilPage> createState() => _SearchDeatilPageState();
}

class _SearchDeatilPageState extends State<SearchDeatilPage> {
  final WallpaperManagerPlus wallpaperManagerPlus = WallpaperManagerPlus();

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
  Widget build(BuildContext context) {
    AlbumPageController albumPageController = Get.find();
    HomePageController homePageController = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: customSearchWidget(),
          backgroundColor: Colors.white,
          toolbarHeight: 50.h,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageBuilder: (context, imageProvider) => Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: Get.width,
                          height: 480.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                    imageUrl: albumPageController.serachImage.value,
                    placeholder: (context, url) => SizedBox(
                      height: 400.h,
                      width: Get.width,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  SizedBox(
                    height: 450.h,
                    width: Get.width,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomSvgImage(
                              image: ConstantValue.shareIcon,
                              height: 30.h,
                            ),
                            height20,
                            Obx(
                              () => InkWell(
                                onTap: () async {
                                  albumPageController.isFavourite.value =
                                      !albumPageController.isFavourite.value;

                                  await albumPageController.saveWhisList(
                                    context,
                                    albumPageController.searchId.value,
                                    homePageController
                                                .categoryDetailList[
                                                    homePageController
                                                        .albumPageController
                                                        .sliderIndex
                                                        .value]
                                                .wishlist ==
                                            0
                                        ? "1"
                                        : "0",
                                  );

                                  //  homePageController.getWhislist(context);
                                },
                                child: CustomSvgImage(
                                  image: albumPageController.isFavourite.value
                                      ? ConstantValue.favouritefilled
                                      : ConstantValue.favouriteOutline,
                                  height: 30.h,
                                ),
                              ),
                            ),
                            height20,
                            InkWell(
                              onTap: () async {
                                saveImage(context,
                                    albumPageController.serachImage.value);
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
            getheight(context, 0.030),
            Obx(
              () => Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: getHorizontalSize(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 250.w,
                      child: albumPageController.searchHeading.value.f16w6(
                          textColor: KColors.persistentBlack,
                          fontSize: 17.sp,
                          fontFamily: Fontfamily.poppins),
                    ),
                    width10,
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          //=>
                          // print("cudgfsdnksddhvhjdbhdg"),

                          if (homePageController
                                  .categoryDetailList[homePageController
                                      .albumPageController.sliderIndex.value]
                                  .bookingType ==
                              "2") {
                            pageNavigation(ProductEnquiryPage());
                          } else {
                            pageNavigation(UpgradePrimiumPage());
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          width: 100.w,
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
                          child: "Book Now".f16w4(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  actionWallPaperButton("Set as Homepage", () {
                    showLogoutDialog(context, "Set Wallpaper?",
                        'Are you sure you want to set Wallpaper!', () async {
                      homePageController.setwallpaper(
                          WallpaperManagerPlus.homeScreen,
                          albumPageController.serachImage.value,
                          context);
                      Navigator.pop(context);
                    }, "Ok");
                  }),
                  actionWallPaperButton("Set as Lockscreen", () {
                    showLogoutDialog(context, "Set Wallpaper?",
                        'Are you sure you want to set Wallpaper!', () async {
                      homePageController.setwallpaper(
                          WallpaperManagerPlus.lockScreen,
                          albumPageController.serachImage.value,
                          context);

                      Navigator.pop(context);
                    }, "Ok");
                  }),
                  actionWallPaperButton("Set as Both", () {
                    showLogoutDialog(context, "Set Wallpaper?",
                        'Are you sure you want to set Wallpaper!', () async {
                      homePageController.setwallpaper(
                          WallpaperManagerPlus.bothScreens,
                          albumPageController.serachImage.value,
                          context);

                      Navigator.pop(context);
                    }, "Ok");
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
