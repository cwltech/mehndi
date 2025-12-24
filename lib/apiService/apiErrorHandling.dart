import 'dart:io';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customToast.dart';
import 'package:dio/dio.dart';

class ErrorHandling {
  static getExceptionMessage(dynamic error, context) async {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError: // no internet or DNS issue

          customToast(
            "No Internet Connection",
            KColors.red.withValues(alpha: 0.7),
            context,
          );
          break;

        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          customToast(
            "Request timed out. Please try again.",
            KColors.red.withValues(alpha: 0.7),
            context,
          );
          break;

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode.toString();
          _handleHttpError(statusCode, context);
          break;

        default:
          customToast(
            "Something went wrong. Please try again later.",
            KColors.red.withValues(alpha: 0.7),
            context,
          );
      }
    } else if (error is SocketException) {
      // Pure socket exception (e.g., internet turned off)
      customToast(
        "No Internet Connection",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
    } else {
      // _handleHttpError(error, context);
      customToast(
        "Unexpected error occurred",
        KColors.red.withValues(alpha: 0.7),
        context,
      );
    }
  }

  static void _handleHttpError(String? statusCode, context) {
    switch (statusCode) {
      case '400':
        customToast(
          "Bad Request",
          KColors.red.withValues(alpha: 0.7),
          context,
        );
        break;
      case '201':
        customToast("No data", KColors.red.withValues(alpha: 0.7), context);
        break;
      case '404':
        customToast(
          "Data Not Found",
          KColors.red.withValues(alpha: 0.7),
          context,
        );
        break;
      case '500':
        customToast(
          "Internal Server Error",
          KColors.red.withValues(alpha: 0.7),
          context,
        );
        break;
      case '409':
        customToast(
          "Conflict Error",
          KColors.red.withValues(alpha: 0.7),
          context,
        );
        break;
      case '401':
        customToast(
            "Invalid or expired token", KColors.persistentBlack, context);

        break;
      case '504':
        customToast(
          "Server Timeout",
          KColors.red.withValues(alpha: 0.7),
          context,
        );
        break;
      default:
        // customToast(
        //   "Unexpected Server Error",
        //   AppColor.red.withValues(alpha: 0.7),
        //   context,
        // );
        break;
    }
  }
}
