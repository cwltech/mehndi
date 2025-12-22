import 'package:catalougeapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

customToast(String text, Color color, BuildContext context) {
  return toastification.show(
    // optional if you use ToastificationWrapper
    title: Text(
      text,
      style: TextStyle(color: KColors.white),
      textAlign: TextAlign.center,
    ),
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
    autoCloseDuration: const Duration(seconds: 3),
    alignment: Alignment.bottomCenter,
    backgroundColor: color,
    style: ToastificationStyle.simple,
    borderRadius: BorderRadius.circular(50),
    margin: EdgeInsets.all(50),
    borderSide: BorderSide(color: Colors.transparent),
    showIcon: false,
    // ignore: deprecated_member_use
    closeButtonShowType: CloseButtonShowType.none,
    context: context,
  );
}
