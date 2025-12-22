import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.04,
      width: Get.width,
      child: Row(
        children: [
          dividerWidget(KColors.purpleColor,
              KColors.pinkColor.withValues(alpha: 0.1), 10, 0),
          width10,
          "Or continue with".f12w4(
              textColor: KColors.persistentBlack,
              fontFamily: Fontfamily.montserrat,
              fontWeight: FontWeight.w500),
          width10,
          dividerWidget(KColors.pinkColor.withValues(alpha: 0.1),
              KColors.purpleColor, 0, 10)
        ],
      ),
    );
  }

  dividerWidget(
      Color color1, Color color2, double leftPadding, double rightPadding) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: leftPadding, right: rightPadding),
        height: 1.4,
        width: Get.width,
        // color: KColors.grey.withValues(alpha: 0.4),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2],
                stops: [0.1, 0.8])),
      ),
    );
  }
}
