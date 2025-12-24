import 'dart:convert';
import 'package:catalougeapp/apiService/apiErrorHandling.dart';
import 'package:catalougeapp/apiService/apiService.dart';
import 'package:catalougeapp/apiService/service_constant.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customToast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      final response = await _api.request.post(
        ServiceConstant.singIn,
        data: data,
        options: options,
      );

      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future updateTokenApi(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.updateToken, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future otpVerify(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.otpVerify, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getCategory(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.getCategory,
        options: options,
      );
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getPopupNotification(context) async {
    try {
      final response = await _api.request.get(
        ServiceConstant.getPopUpNotification,
        options: options,
      );

      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getSubCategory(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.getSubCategory, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getBanner(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.banner,
        options: options,
      );
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getHomeSubCategoryList(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.getHomeSubcategoryList,
        options: options,
      );
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getTermsAndConditionPage(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.getPageDetail,
        options: options,
      );
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future catelougeListBtCategory(data, context) async {
    try {
      final response = await _api.request.post(
          ServiceConstant.catalougeListByCategory,
          data: data,
          options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future saveView(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.saveView, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future saveWhislist(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.saveWhislist, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getWhislist(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.getWhislist, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future deleteWhislist(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.deleteWhislist, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future search(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.search, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future catelougeDetail(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.catelougeDetail, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getProfile(dynamic data, context) async {
    try {
      final response = await _api.request.post(
        ServiceConstant.getProfile,
        data: data,
        options: options,
      );

      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future updaterProfile(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.updateProfile, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getCatelougeType(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.catelougeType, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future filter(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.filter, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future sendEnquiry(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.sendEnquiry, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getImageSlider(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.imageSlider, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getPackageDetail(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.packageDetail,
        options: options,
      );
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future updatePackageDetail(data, context) async {
    try {
      final response = await _api.request.post(
          ServiceConstant.updatePackageDetail,
          data: data,
          options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getPageDetail(context) async {
    try {
      Response response = await _api.request.get(
        ServiceConstant.getPageDetail,
        options: options,
      );
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future saveNotification(data, context) async {
    try {
      final response = await _api.request.post(
          ServiceConstant.saveNotificationToken,
          data: data,
          options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }

  Future getEquiry(data, context) async {
    try {
      final response = await _api.request
          .post(ServiceConstant.getEnquiry, data: data, options: options);
      if (response.statusCode == 200) {
        // Handle case where Dio returns a JSON string or map
        final responseData =
            response.data is String ? jsonDecode(response.data) : response.data;

        return responseData as Map<String, dynamic>;
      } else {
        ErrorHandling.getExceptionMessage(
          response.statusCode.toString(),
          context,
        );
        return null;
      }
    } on DioException catch (e) {
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
      debugPrint(e.toString());

      return null;
    } catch (e) {
      debugPrint("❌ Unexpected error: $e");
      return null;
    }
  }
}
