import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

actionWallPaperButton(String text, Function ontap) {
  return InkWell(
    onTap: () {
      ontap();
    },
    child: Container(
        alignment: Alignment.center,
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: KColors.background,
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [KColors.pinkColor, KColors.purpleColor],
            )),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
              margin: EdgeInsets.all(3),
              alignment: Alignment.center,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: KColors.white,
              ),
              child: text.f16w4(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  textColor: KColors.persistentBlack),
            ),
          ],
        )),
  );
}
