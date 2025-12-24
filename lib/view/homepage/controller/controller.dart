import 'dart:async';
import 'package:catalougeapp/apiService/apiRepo.dart';
import 'package:catalougeapp/utils/loader.dart';
import 'package:catalougeapp/utils/localStorage.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/view/albumPage/controller/controller.dart';
import 'package:catalougeapp/view/albumPage/view/galleryDetailPage.dart';
import 'package:catalougeapp/view/albumPage/widget/actionWallpaperbutton.dart';
import 'package:catalougeapp/view/homepage/model/bannerModel.dart';
import 'package:catalougeapp/view/homepage/model/categoryModel.dart';
import 'package:catalougeapp/view/homepage/model/catelougeListByCategoryModel.dart';
import 'package:catalougeapp/view/homepage/model/catelougeTypeModel.dart';
import 'package:catalougeapp/view/homepage/model/homeSubcategoryModel.dart';
import 'package:catalougeapp/view/homepage/model/subCategoryModel.dart';
import 'package:catalougeapp/view/homepage/widget.dart';
import 'package:catalougeapp/view/mainPage/controller.dart';
import 'package:catalougeapp/view/paymentGateway/controller/paymentGatewayController.dart';
import 'package:catalougeapp/view/profilePage/controller/controller.dart';
import 'package:catalougeapp/view/termsAndConditionPage/model.dart';
import 'package:catalougeapp/view/whislistPage/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_manager_plus/wallpaper_manager_plus.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../utils/reviewHelper.dart';

class HomePageController extends GetxController {
  AlbumPageController albumPageController = Get.find();
  ProfilePageController profilePageController = Get.find();
  PaymentGatewayController paymentGatewayController = Get.find();
  MainPageController mainPageController = Get.find();
  RxInt indexes = 0.obs;
  RxInt selectedSubCategoryIndex = (-1).obs;
  RxInt newbannerIndex = 0.obs;
  RxString categoryId = "".obs;
  RxString subCategoryId = "".obs;
  RxString categoryValue = "".obs;
  RxString categoryValue2 = "All Image/Videos".obs;
  RxString swipeLeftOrRight = "".obs;
  RxString shareLink = "".obs;
  RxString getImageStatus = "".obs;
  // var canSwipeLeft = true.obs;
  // var canSwipeRight = true.obs;
  final RxBool canSwipeLeft = true.obs;
  final RxBool canSwipeRight = true.obs;
  final RxBool isReverting = false.obs;
  final RxBool disableInfiniteScrolling = true.obs;

  late YoutubePlayerController controller;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxList<CategoryListModel> categoryList = <CategoryListModel>[].obs;
  RxList<SubcategoryModel> subCategoryListUpdate = <SubcategoryModel>[].obs;
  RxList<BannerModel> bannerList = <BannerModel>[].obs;
  RxList<HomeSubcategoryModel> getHomeSubCategoryList =
      <HomeSubcategoryModel>[].obs;
  RxList<CatelougeListByCategoryModel> catelougeListByCategoryList =
      <CatelougeListByCategoryModel>[].obs;
  RxList<CatelougeListByCategoryModel> catelougeListByCategoryList2 =
      <CatelougeListByCategoryModel>[].obs;
  RxList<WhislistModel> whislistList = <WhislistModel>[].obs;

  RxList<CatelougeTypeModel> catelougeTypeList = <CatelougeTypeModel>[].obs;

  final LocalStorage _localStorage = Get.find();
  LocalStorage get localStorage => _localStorage;

  RxString catelougeId = "".obs;
  RxString catelougeHeading = "".obs;
  RxString catelougeDescription = "".obs;
  RxString catelougeImage = "".obs;
  RxInt catelougePrevproduct = 0.obs;
  RxInt catelougeNextproduct = 0.obs;
  RxString catelougEnquiryType = "".obs;
  // Rx<AdRequest> adRequest = AdRequest().obs;
  // BannerAd? bannerAd;
  // InterstitialAd? interstitialAd;
  // RewardedAd? rewardedAd;

  Rx<TermsAndPolicyModel> termsAndConditionData = TermsAndPolicyModel().obs;

  RxList<CatelougeListByCategoryModel> categoryDetailList =
      <CatelougeListByCategoryModel>[].obs;

  final WallpaperManagerPlus wallpaperManagerPlus = WallpaperManagerPlus();

  RxBool isWallpaperLoading = false.obs;

  Future<void> setwallpaper(location, String img, context) async {
    isWallpaperLoading.value = true;
    final file = await DefaultCacheManager().getSingleFile(img);
    try {
      final result = await wallpaperManagerPlus.setWallpaper(file, location);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(result ?? ''),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error Setting Wallpaper'),
        ),
      );
      debugPrint(e.toString());
    }

    isWallpaperLoading.value = false;
  }

  setWallpaper(context, String image) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          actionWallPaperButton("Set as Homepage", () {
            showLogoutDialog(context, "Set Wallpaper?",
                'Are you sure you want to set Wallpaper!', () async {
              setwallpaper(
                  WallpaperManagerPlus.homeScreen,
                  categoryDetailList[albumPageController.sliderIndex.value]
                      .image!,
                  context);
              Navigator.pop(context);
            }, "Ok");
          }),
          actionWallPaperButton("Set as Lockscreen", () {
            showLogoutDialog(context, "Set Wallpaper?",
                'Are you sure you want to set Wallpaper!', () async {
              setwallpaper(
                  WallpaperManagerPlus.lockScreen,
                  categoryDetailList[albumPageController.sliderIndex.value]
                      .image!,
                  context);

              Navigator.pop(context);
            }, "Ok");
          }),
          actionWallPaperButton("Set as Both", () {
            showLogoutDialog(context, "Set Wallpaper?",
                'Are you sure you want to set Wallpaper!', () async {
              setwallpaper(
                  WallpaperManagerPlus.bothScreens,
                  categoryDetailList[albumPageController.sliderIndex.value]
                      .image!,
                  context);

              Navigator.pop(context);
            }, "Ok");
          }),
        ],
      ),
    );
  }

  catelougeDetailPage(index, BuildContext context) async {
    albumPageController.albumImage.value =
        catelougeListByCategoryList[index!].image!;
    albumPageController.albumHeading.value =
        catelougeListByCategoryList[index!].heading!;
    await saveView(context, catelougeListByCategoryList[index!].id.toString());
    // await deleteWhislist(
    //     context, catelougeListByCategoryList[index!].id.toString());
    await getImageSlider(
        // ignore: use_build_context_synchronously
        context,
        categoryId.value,
        subCategoryId.value,
        catelougeListByCategoryList[index!].id.toString(),
        "3");

    await pageNavigation(AlbumDetailPage());
    albumPageController.isShowCategoryDetailImage.value = true;
    albumPageController.categorySliderIndex.value = index!;
  }

  Future<void> catelougeDetailPageFromWhishlist(
      WhislistModel selectedItem, BuildContext context) async {
    albumPageController.albumImage.value = selectedItem.image!;
    albumPageController.albumHeading.value = selectedItem.heading!;

    await saveView(context, selectedItem.id.toString());

    await getImageSlider(
      context,
      categoryId.value,
      subCategoryId.value,
      selectedItem.id.toString(),
      "3",
    );

    await pageNavigation(AlbumDetailPage());

    albumPageController.isShowCategoryDetailImage.value = true;
    albumPageController.categorySliderIndex.value =
        0; // since it's not from catelougeListByCategoryList
  }

  Future<void> getHomeSubcategoryList(context) async {
    try {
      await ApiRepo().getHomeSubCategoryList(context).then((value) async {
        if (value["status"] == "1") {
          getHomeSubCategoryList.value = (value["data"] as List)
              .map((e) => HomeSubcategoryModel.fromJson(e))
              .toList();
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Timer? _usageTimer;
  Future<void> checkAndStartTimer() async {
    final prefs = await SharedPreferences.getInstance();
    bool alreadyShown = prefs.getBool("reviewPopupShown") ?? false;

    if (!alreadyShown) {
      _usageTimer = Timer(const Duration(seconds: 100), () {
        ReviewHelper.requestReview();
        prefs.setBool("reviewPopupShown", true); // Mark as shown
      });
    }
  }

  Future<void> getTermsAndCondition(context) async {
    try {
      await ApiRepo().getTermsAndConditionPage(context).then((value) async {
        if (value["status"] == "1") {
          termsAndConditionData.value =
              TermsAndPolicyModel.fromJson(value["data"]);
        } else {
          termsAndConditionData.value =
              TermsAndPolicyModel.fromJson(value["data"]);
        }
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> getAboutUs(context) async {
    try {
      await ApiRepo().getTermsAndConditionPage(context).then((value) async {
        if (value["status"] == "1") {
          termsAndConditionData.value =
              TermsAndPolicyModel.fromJson(value["data"]);
        } else {
          termsAndConditionData.value =
              TermsAndPolicyModel.fromJson(value["data"]);
        }
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> getPageDetail(context) async {
    try {
      await ApiRepo().getPageDetail(context).then((value) async {
        if (value["status"] == "1") {
          shareLink.value = value["data"]["share_link"];
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future<void> getBanner(context) async {
    try {
      await ApiRepo().getBanner(context).then((value) async {
        if (value["status"] == "1") {
          bannerList.value = (value["data"] as List)
              .map((e) => BannerModel.fromJson(e))
              .toList();
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  RxBool isCategoryDataLoading = false.obs;

  Future<void> getCategoryList(context) async {
    isCategoryDataLoading.value = true;
    try {
      await ApiRepo().getCategory(context).then((value) async {
        if (value["status"] == "1") {
          categoryList.value = (value["data"] as List)
              .map((e) => CategoryListModel.fromJson(e))
              .toList();
          hideLoading();
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
    isCategoryDataLoading.value = false;
  }

  Future<void> getSubCategory(context, String id) async {
    final formData = dio.FormData.fromMap({
      "category": id,
    });

    try {
      // showloadingIndicators();
      await ApiRepo().getSubCategory(formData, context).then((value) async {
        if (value["status"] == "1") {
          subCategoryListUpdate.value = (value["data"] as List)
              .map((e) => SubcategoryModel.fromJson(e))
              .toList();
          hideLoading();
        } else {
          subCategoryListUpdate.value = (value["data"] as List)
              .map((e) => SubcategoryModel.fromJson(e))
              .toList();
        }
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> deleteWhislist(context, String id) async {
    final formData = dio.FormData.fromMap({
      "wishlist_id": id,
    });
    try {
      await ApiRepo().deleteWhislist(formData, context).then((value) async {
        if (value["status"] == "1") {
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> saveView(
    context,
    String id,
  ) async {
    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
      "catalogue_id": id,
      "view": "1"
    });

    print('catalog id $id');
    print('user id ${localStorage.userid.value}');
    try {
      showloadingIndicators();
      await ApiRepo().saveView(formData, context).then((value) async {
        if (value["status"] == "1") {
        } else {}
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getWhislist(
    context,
  ) async {
    await localStorage.getUserId();
    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
    });
    try {
      //showloadingIndicators();
      await ApiRepo().getWhislist(formData, context).then((value) async {
        if (value["status"] == "1") {
          whislistList.value = (value["data"] as List)
              .map((e) => WhislistModel.fromJson(e))
              .toList()
              .reversed
              .toList();
          hideLoading();
        } else {
          whislistList.value = (value["data"] as List)
              .map((e) => WhislistModel.fromJson(e))
              .toList()
              .reversed
              .toList();
        }
      });
      // hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  RxInt pagiNationValue = 0.obs;
  RxBool hasMoreData = true.obs;

  Future<void> catelougeListByCategory(
    context,
    String id,
    String subCategoryId,
  ) async {
    final formData = dio.FormData.fromMap({
      "category": id,
      "subcat": subCategoryId,
      "start": pagiNationValue.value * 10, // offset = page * limit
    });

    try {
      // ✅ show loader only for first page
      if (pagiNationValue.value == 0) {
        showloadingIndicators();
        hasMoreData.value = true; // reset when starting fresh
      }

      final value = await ApiRepo().catelougeListBtCategory(formData, context);

      if (value["status"] == "1") {
        final newItems = (value["data"] as List)
            .map((e) => CatelougeListByCategoryModel.fromJson(e))
            .toList();

        // ✅ deduplicate
        final existingIds =
            catelougeListByCategoryList.map((e) => e.id).toSet();
        final filtered =
            newItems.where((item) => !existingIds.contains(item.id)).toList();

        if (pagiNationValue.value == 0) {
          catelougeListByCategoryList.value = newItems;
        } else {
          catelougeListByCategoryList.addAll(filtered);
        }

        // ✅ update hasMoreData
        if (newItems.length < 10) {
          hasMoreData.value = false; // no more data
        }
      } else {
        catelougeListByCategoryList.clear();
        hasMoreData.value = false;
      }
    } catch (e) {
      if (kDebugMode) print(e);
    } finally {
      if (pagiNationValue.value == 0) {
        hideLoading();
      }
    }
  }

  Future<void> catelougeDetail(
    context,
    String id,
  ) async {
    final formData = dio.FormData.fromMap({
      "id": id,
    });
    try {
      await ApiRepo().catelougeDetail(formData, context).then((value) async {
        if (value["status"] == "1") {
          catelougeId.value = value["data"]["id"].toString();
          catelougeHeading.value = value["data"]["heading"];
          catelougeDescription.value = value["data"]["description"];
          catelougeImage.value = value["data"]["image"];
          catelougeNextproduct.value = value["data"]["next_product"];
          catelougePrevproduct.value = value["data"]["prev_product"];
          catelougEnquiryType.value = value["data"]["bookingtype"];
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getCatelougeType(context, String id) async {
    final formData = dio.FormData.fromMap({
      "category_id": id,
    });

    try {
      showloadingIndicators();
      await ApiRepo().getCatelougeType(formData, context).then((value) async {
        if (value["status"] == "1") {
          catelougeTypeList.value = (value["data"] as List)
              .map((e) => CatelougeTypeModel.fromJson(e))
              .toList();

          categoryValue.value = catelougeTypeList[0].cataloguecategory!;
        } else {
          catelougeTypeList.value = (value["data"] as List)
              .map((e) => CatelougeTypeModel.fromJson(e))
              .toList();
          // errorCustomToast(value["message"], context);
        }
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> filter(context, String id, String subcat, String catelougeType,
      String type) async {
    final formData = dio.FormData.fromMap({
      "category": id,
      "subcat": subcat,
      "catalogue_type": catelougeType,
      "type": type,
    });

    try {
      showloadingIndicators();
      await ApiRepo().filter(formData, context).then((value) async {
        if (value["status"] == "1") {
          catelougeListByCategoryList.value = (value["data"] as List)
              .map((e) => CatelougeListByCategoryModel.fromJson(e))
              .toList();
        } else {
          catelougeListByCategoryList.value = (value["data"] as List)
              .map((e) => CatelougeListByCategoryModel.fromJson(e))
              .toList();
          // errorCustomToast(value["message"], context);
        }
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  RxBool isLoading = false.obs;

  Future<void> getImageSlider(BuildContext context, String id, String subcat,
      String catelougeIds, String side) async {
    final formData = dio.FormData.fromMap({
      "category_id": id,
      "sub_category_id": subcat,
      "catalogue_id": catelougeIds,
      "side": side,
      "user_id": localStorage.userid.value,
    });

    try {
      isLoading.value = true;

      final value = await ApiRepo().getImageSlider(formData, context);
      getImageStatus.value = value["status"];

      if (value["status"] == "1" && value["data"] != null) {
        // Clear and add new data
        categoryDetailList.clear();
        categoryDetailList
            .add(CatelougeListByCategoryModel.fromJson(value["data"]));
        catelougeId.value = catelougeIds;
        disableInfiniteScrolling.value = true;
      } else {
        disableInfiniteScrolling.value = false;
        // API returned 0 or no data, don't crash
        debugPrint("⚠️ getImageSlider returned status 0 or empty data");
        // Optionally show a message to the user
        // e.g., "No more images in this direction"
        //categoryDetailList.clear();
      }

      categoryDetailList.refresh();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      debugPrint("❌ getImageSlider error: $e");
    }
  }

  RxList<CatelougeTypeModel> categoryList2 = <CatelougeTypeModel>[
    CatelougeTypeModel(id: 1, cataloguecategory: "Image"),
    CatelougeTypeModel(id: 2, cataloguecategory: "Video"),
    CatelougeTypeModel(id: 3, cataloguecategory: "All Image/Videos"),
  ].obs;

  // NotificationController notificationController = Get.find();
  // LocalStorage loc
  Future<void> saveNotoificationToken(
    context,
  ) async {
    await localStorage.getUserId();
    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
      "fcm_id": localStorage.notiToken.value,
    });

    try {
      // showloadingIndicators();
      await ApiRepo().saveNotification(formData, context).then((value) async {
        if (value["status"] == "1") {
        } else {}
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void onReady() {
    profilePageController.getProfile(Get.context);
    saveNotoificationToken(Get.context);
    getTermsAndCondition(Get.context);
    getWhislist(Get.context);
    getCategoryList(Get.context);
    getBanner(Get.context);
    getHomeSubcategoryList(Get.context);

    super.onReady();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
