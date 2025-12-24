import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';

class AboutUsPage extends GetView<HomePageController> {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "About Us".f14w4(
            textColor: KColors.persistentBlack,
            fontFamily: Fontfamily.poppins,
            fontWeight: FontWeight.w600),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.termsAndConditionData.value.pageData![2].heading!
              .f14w4(
                  textColor: KColors.persistentBlack,
                  fontFamily: Fontfamily.poppins,
                  fontWeight: FontWeight.w600)
              .paddingAll(10),
          Html(
            shrinkWrap: true,
            data:
                controller.termsAndConditionData.value.pageData![2].description,
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         