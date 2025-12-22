import 'package:catalougeapp/apiService/apiRepo.dart';
import 'package:catalougeapp/utils/loader.dart';
import 'package:catalougeapp/utils/localStorage.dart';
import 'package:catalougeapp/view/upgradePrimiumPage/model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class PaymentGatewayController extends GetxController {
  Rx<UpgradePackageModel> upgradePackageDetail = UpgradePackageModel().obs;

  RxString transactionStatus = "".obs;

  Future<void> getPackageDetail(context) async {
    try {
      await ApiRepo().getPackageDetail(context).then((value) async {
        if (value["status"] == "1") {
          upgradePackageDetail.value =
              UpgradePackageModel.fromJson(value["data"]);
        } else {}
      });
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  final LocalStorage _localStorage = Get.find();
  LocalStorage get localStorage => _localStorage;

  Future<void> updatePackageDetail(
    context,
  ) async {
    final formData = dio.FormData.fromMap({
      "user_id": localStorage.userid.value,
      "transaction_id": DateTime.now().microsecondsSinceEpoch.toString(),
      "transaction_date": DateTime.now().toString(),
      "transaction_status": transactionStatus.value
    });
    try {
      showloadingIndicators();
      await ApiRepo()
          .updatePackageDetail(formData, context)
          .then((value) async {
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
  void onInit() {
    //getPackageDetail(Get.context);
    super.onInit();
  }

  // @override
  // void dispose() {
  //   razorpay.clear();

  //   super.dispose();
  // }

  // @override
  // void onClose() {
  //   razorpay.clear();
  //   super.onClose();
  // }
}
