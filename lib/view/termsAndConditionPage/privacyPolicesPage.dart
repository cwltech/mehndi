import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivacyPolicesPage extends GetView<HomePageController> {
  const PrivacyPolicesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Privacy Policies ".f14w4(
            textColor: KColors.persistentBlack,
            fontFamily: Fontfamily.poppins,
            fontWeight: FontWeight.w600),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.termsAndConditionData.value.pageData![0].heading!
              .f14w4(
                  textColor: KColors.persistentBlack,
                  fontFamily: Fontfamily.poppins,
                  fontWeight: FontWeight.w600)
              .paddingAll(10),
          Html(
            shrinkWrap: true,
            data:
                controller.termsAndConditionData.value.pageData![0].description,
            style: {
              "body": Style(
                fontSize: FontSize(13.sp),
                textAlign: TextAlign.justify,
                // fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            },
          ),
        ],
      ),
    );
  }
}
