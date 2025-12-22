import 'dart:convert';
import 'package:catalougeapp/apiService/apiErrorHandling.dart';
import 'package:catalougeapp/apiService/apiService.dart';
import 'package:catalougeapp/apiService/service_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class ApiRepo {
  final Api _api = Api();
  Response? response;
  Options options = Options(
      headers: {'Authorization': 'Bearer ""'},
      validateStatus: (_) => true,
      contentType: 'application/json',
      responseType: ResponseType.json);

  //  ${LocalStorage.token2.value}
  //***********************signInApi***************************/

  Future signIn(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.singIn, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future updateTokenApi(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.updateToken, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future otpVerify(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.otpVerify, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        // Get.snackbar("Error", response.statusCode.toString(),
        //     snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getCategory(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.getCategory,
        options: options,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  // Future<Map<String, dynamic>?> getPopupNotification() async {
  //   try {
  //     final url = Uri.parse("https://mehendiwalaa.com/getPopupNotification");

  //     final response = await http.get(
  //       url,
  //       headers: {"Accept": "application/json"},
  //     );

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> decoded = jsonDecode(response.body);
  //       debugPrint("Decoded popup response: $decoded");
  //       return decoded; // must return the Map
  //     } else {
  //       debugPrint("Popup API failed: ${response.statusCode}");
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint("Popup API exception: $e");
  //     return null;
  //   }
  // }

  Future<Map<String, dynamic>?> getPopupNotification(
      BuildContext context) async {
    try {
      final response = await _api.request.get(
        ServiceConstant.getPopUpNotification,
        options: options,
      );

      if (response.statusCode == 200) {
        final data =
            response.data is String ? jsonDecode(response.data) : response.data;

        if (data is Map<String, dynamic>) {
          return data;
        } else {
          if (kDebugMode) {}
          return null;
        }
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } catch (e, s) {
      if (kDebugMode) {
        debugPrint("getPopupNotification error: $e\n$s");
      }
      return null;
    }
  }

  Future getSubCategory(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.getSubCategory, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getBanner(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.banner,
        options: options,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getHomeSubCategoryList(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.getHomeSubcategoryList,
        options: options,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getTermsAndConditionPage(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.getPageDetail,
        options: options,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future catelougeListBtCategory(data, context) async {
    try {
      final response = await _api.request.post(
          ServiceConstant.catalougeListByCategory,
          data: data,
          options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future saveView(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.saveView, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future saveWhislist(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.saveWhislist, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getWhislist(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.getWhislist, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future deleteWhislist(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.deleteWhislist, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future search(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.search, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future catelougeDetail(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.catelougeDetail, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getProfile(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.getProfile, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future updaterProfile(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.updateProfile, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getCatelougeType(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.catelougeType, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future filter(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.filter, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future sendEnquiry(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.sendEnquiry, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getImageSlider(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.imageSlider, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getPackageDetail(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.packageDetail,
        options: options,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future updatePackageDetail(data, context) async {
    try {
      final response = await _api.request.post(
          ServiceConstant.updatePackageDetail,
          data: data,
          options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getPageDetail(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.getPageDetail,
        options: options,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future saveNotification(data, context) async {
    try {
      final response = await _api.request.post(
          ServiceConstant.saveNotificationToken,
          data: data,
          options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }

  Future getEquiry(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.getEnquiry, data: data, options: options);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data) as Map<String, dynamic>;
        return responseData;
      } else {
        ErrorHandling.getExceptionMessage(
            response.statusCode.toString(), context);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }
}
