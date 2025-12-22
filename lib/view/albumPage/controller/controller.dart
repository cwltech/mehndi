import 'package:catalougeapp/apiService/apiRepo.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customToast.dart';
import 'package:catalougeapp/utils/loader.dart';
import 'package:catalougeapp/utils/localStorage.dart';
import 'package:catalougeapp/view/searchPage/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class AlbumPageController extends GetxController {
  RxInt sliderIndex = 0.obs;
  RxBool isFavourite = false.obs;
  RxBool isShowCategoryDetailImage = true.obs;
  RxInt categorySliderIndex = 0.obs;
  final LocalStorage _localStorage = Get.find();
  LocalStorage get localStorage => _localStorage;

  RxList<SearchModel> searchList = <SearchModel>[].obs;

  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  //controller.profileModel.value.mobile.toString();
  late TextEditingController searchController;
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController emailController;
  late TextEditingController desController;
  late TextEditingController functionController;

  RxString serachImage = "".obs;
  RxString searchHeading = "".obs;
  RxString searchId = "".obs;

  Future<void> saveWhisList(context, String id, String status) async {
    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
      "catalogue_id": id,
      "status": status,
    });

    try {
      showloadingIndicators();
      await ApiRepo().saveWhislist(formData, context).then((value) async {
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

  Future<void> sendEnquiry(
    context,
    String id,
  ) async {
    final formData = dio.FormData.fromMap({
      "catalogue_id": id,
      "name": nameController.text,
      "mobile_no": mobileController.text,
      "city": desController.text,
      "function_date": selectedDate.value,
      "function_name": functionController.text,
      "user_id": localStorage.userid.value,
    });
    try {
      showloadingIndicators();
      await ApiRepo().sendEnquiry(formData, context).then((value) async {
        if (value["status"] == "1") {
          customToast(
            value["message"],
            KColors.darkGreen.withValues(alpha: 0.7),
            context,
          );

          nameController.text;
          emailController.text;
          mobileController.text;
          desController.text;
          selectedDate.value = "";
        } else {}
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> search(
    context,
  ) async {
    final formData = dio.FormData.fromMap({
      "keyword": searchController.text,
    });
    try {
      showloadingIndicators();
      await ApiRepo().search(formData, context).then((value) async {
        if (value["status"] == "1") {
          searchList.value = (value["data"] as List)
              .map((e) => SearchModel.fromJson(e))
              .toList();
        } else {}
      });
      hideLoading();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  RxString selectedDate = "".obs;

  Future<void> selectDate(BuildContext context) async {
    final DateTime today = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today, // 👈 start from today
      firstDate: today, // 👈 disable past dates
      lastDate: DateTime(2030), // 👈 up to 2030 (you can adjust)
      builder: (context, child) {
        // Optional: make it consistent with your theme
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.deepPurple, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate.toString();
      print('📅 Selected date: ${selectedDate.value}');
    }
  }

  Rx albumImage = "".obs;
  Rx albumHeading = "".obs;

  void fetchMobile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? mob = pref.getString("autoMob");

    if (mob != null && mob.isNotEmpty) {
      mobileController.text = mob;
    }
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    nameController = TextEditingController();
    mobileController = TextEditingController();
    emailController = TextEditingController();
    desController = TextEditingController();
    functionController = TextEditingController();
    super.onInit();
    fetchMobile();
  }

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    desController.dispose();
    functionController.dispose();
    super.dispose();
  }

  //deleteWhislist
  //HomePageController homePageController = Get.find();
  Future<void> deleteWhislist(context, String id) async {
    final formData = dio.FormData.fromMap({
      "wishlist_id": id,
    });

    try {
      await ApiRepo().deleteWhislist(formData, context).then((value) async {
        if (value["status"] == "0") {
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
