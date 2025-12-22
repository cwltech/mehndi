import 'dart:async';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/constantValue.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/mainPage/controller.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/localStorage.dart';
import '../../utils/reviewHelper.dart';
import '../homepage/showsubCategoryPage.dart';
import '../login/controller/loginPageController.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rate_my_app/rate_my_app.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// BannerAd? bannerAd1;
// BannerAd? bannerAd2;
// BannerAd? bannerAd;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // AdRequest? adRequest;
  // InterstitialAd? interstitialAd;
  // RewardedAd? rewardedAd;
  Timer? _usageTimer;
  bool _popupShown = false;
  final LocalStorage _localStorage = Get.find();
  LocalStorage get localStorage => _localStorage;
  MainPageController controller = Get.find();
  SignInPageController loginController = Get.find();
  HomePageController homePageController = Get.find();
  late RateMyApp rateMyApp;

  @override
  void initState() {
    super.initState();

    _checkAndStartTimer();
    //loginController.updateToken(context);
    Future.delayed(Duration.zero, () async {
      await controller.getPopUpNotification(context);
      await loginController.updateToken(context);
      controller.popUpNotificationData.value.status == "1"
          ? Future.delayed(const Duration(seconds: 60), () {
              if (!mounted || _popupShown) return;
              if (localStorage.userid.value != null) {
                _popupShown = true;
                _showAdsPopup();
              }
            })
          : null;
    });
  }

  Future<void> _checkAndStartTimer() async {
    final prefs = await SharedPreferences.getInstance();

    debugPrint("⏳ Waiting before showing review dialog...");

    _usageTimer = Timer(const Duration(seconds: 90), () async {
      try {
        await ReviewHelper.requestReview();

        // ✅ Mark as shown — user won’t see again
        await prefs.setBool("reviewPopupShown", true);
        debugPrint("✅ reviewPopupShown set true after successful request");
      } catch (e) {
        debugPrint("⚠️ Review request failed: $e");
      }
    });
  }

  void showCustomRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        double userRating = 0.0;
        final TextEditingController commentController = TextEditingController();
        final InAppReview inAppReview = InAppReview.instance;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Rate Our App"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("How would you rate your experience?"),
              const SizedBox(height: 10),

              // ⭐ Rating bar
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  userRating = rating;
                },
              ),

              const SizedBox(height: 15),

              // 📝 Feedback text field (optional)
              TextField(
                controller: commentController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Tell us what we can improve...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Submit"),
              onPressed: () async {
                Navigator.pop(context);

                if (userRating >= 4) {
                  try {
                    if (await inAppReview.isAvailable()) {
                      // ✅ Opens native Google Play popup
                      await inAppReview.requestReview();
                    } else {
                      // Fallback: open Play Store link if native review not available
                      final Uri url = Uri.parse(
                        "https://play.google.com/store/apps/details?id=com.catalougeapp.app",
                      );
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    }
                  } catch (e) {
                    debugPrint("In-app review error: $e");
                  }
                } else {
                  final feedback = commentController.text.trim();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        feedback.isNotEmpty
                            ? "Thanks for your feedback: \"$feedback\""
                            : "Thanks for your feedback!",
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showAdsPopup() {
    final data = controller.popUpNotificationData.value;

    Get.dialog(
      Dialog(
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 20), // remove default margin
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: InteractiveViewer(
            // optional: allows zooming/panning
            child: Container(
          margin: EdgeInsets.symmetric(vertical: getVerticalSize(110)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(data.image!))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black54,
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await homePageController.getSubCategory(
                      context, data.categoryId.toString());
                  pageNavigation(Showsubcategorypage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.black54,
                  ),
                  alignment: Alignment.center,
                  height: 45.h,
                  width: Get.width,
                  padding: const EdgeInsets.all(12),
                  child: data.text!.f16w4(),
                ),
              ),
              // ),
            ],
          ),
        )),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void dispose() {
    _usageTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container(
            //   color: Colors.transparent,
            //   height: 80.h,
            //   width: Get.width,
            //   child: AdWidget(ad: bannerAd!),
            // ),
            Container(
              height: 50.h,
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
                color: KColors.white,
              ),
              child: Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.bottomNavigationBarindex.value = 0;
                          // controller.getPopUpNotification(context);
                          // _showAdsPopup();
                          // Getserverkey.getServerKeyToken();
                        },
                        child: Container(
                          color: KColors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvgImage(
                                image: controller
                                            .bottomNavigationBarindex.value ==
                                        0
                                    ? ConstantValue.bottomNavigationBarHome2Icon
                                    : ConstantValue.bottomNavigationBarHomeIcon,
                                height: 15.h,
                              ),
                              height5,
                              "Home".f16w6(
                                textColor: KColors.persistentBlack,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.bottomNavigationBarindex.value = 1;
                        },
                        child: Container(
                          color: KColors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvgImage(
                                image:
                                    controller.bottomNavigationBarindex.value ==
                                            1
                                        ? ConstantValue
                                            .bottomNavigationBarFavourite2Icon
                                        : ConstantValue
                                            .bottomNavigationBarFavouriteIcon,
                                height: 15.h,
                              ),
                              height5,
                              "Favourite".f16w6(
                                textColor: KColors.persistentBlack,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.bottomNavigationBarindex.value = 2;
                          controller.profilePageController.getEnquiry(context);
                        },
                        child: Container(
                          color: KColors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvgImage(
                                image:
                                    controller.bottomNavigationBarindex.value ==
                                            2
                                        ? ConstantValue.primium2Icon
                                        : ConstantValue.primiumIcon,
                                height: 15.h,
                              ),
                              height5,
                              "Enquiry".f16w6(
                                textColor: KColors.persistentBlack,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          controller.profilePageController.isBackButtonShow
                              .value = false;
                          await controller.profilePageController.getProfile(
                            context,
                          );
                          controller.bottomNavigationBarindex.value = 3;
                        },
                        child: Container(
                          color: KColors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvgImage(
                                image: controller
                                            .bottomNavigationBarindex.value ==
                                        3
                                    ? ConstantValue.bottomNavigationBarUser2Icon
                                    : ConstantValue.bottomNavigationBarUserIcon,
                                height: 15.h,
                              ),
                              height5,
                              "Profile".f16w6(
                                textColor: KColors.persistentBlack,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          DoubleBack(
            message: "Press back again to close",
            background: KColors.goldColor,
            child: Obx(
              () => controller.pages[controller.bottomNavigationBarindex.value],
            ),
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: FloatingActionButton(
                onPressed: () async {
                  final Uri whatsappUrl = Uri.parse(
                    "https://wa.me/918630159154?text=Hello",
                  );

                  if (await canLaunchUrl(whatsappUrl)) {
                    await launchUrl(
                      whatsappUrl,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    Get.snackbar("Error", "Could not open WhatsApp");
                  }
                },
                backgroundColor: Color(0xff25d366),
                child: CustomImageProvider.assetsImage(
                    image: "assets/icons/social.png")),
          ),
        ],
      ),
    );
  }
}
