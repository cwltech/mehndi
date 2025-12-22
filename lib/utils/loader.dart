import 'package:catalougeapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showloadingIndicators() {
  Get.dialog(const Center(
      child: RepaintBoundary(
          child: CircularProgressIndicator(
    color: KColors.white,
  ))));
}

hideLoading() {
  if (Get.isDialogOpen!) {
    Get.back();
  }
}
