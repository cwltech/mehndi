// ignore: file_names

import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/view/albumPage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactusPage extends GetView<AlbumPageController> {
  const ContactusPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: "Contact Us".f16w4(
            textColor: KColors.persistentBlack, fontFamily: Fontfamily.poppins),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () async {
                  if (await canLaunchUrl(
                      Uri.parse("https://share.google/EBHRQfhx063svx3kh"))) {
                    await launchUrl(
                        Uri.parse("https://share.google/EBHRQfhx063svx3kh"));
                  } else {
                    throw 'Could not launch this url';
                  }

                  // openEmail(
                  //   email: 'support@mehndiwala.com',
                  //   subject: '',
                  //   body: '',
                  // );
                },
                leading: Icon(
                  Icons.email_outlined,
                  size: 18.h,
                ),
                title: "Address".f14w4(
                    textColor: KColors.persistentBlack,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
                subtitle:
                    "MEHNDI WALA : A17, near Metro Station Akshardham, Ganesh Nagar, Pandav Nagar, New Delhi, Delhi, 110092"
                        .f14w4(
                            textColor: KColors.persistentBlack,
                            fontSize: 12.sp,
                            fontFamily: Fontfamily.poppins),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 12.h,
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  openEmail(
                    email: 'support@mehndiwala.com',
                    subject: '',
                    body: '',
                  );
                },
                leading: Icon(
                  Icons.email_outlined,
                  size: 18.h,
                ),
                title: "Email ID".f14w4(
                    textColor: KColors.persistentBlack,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
                subtitle: "support@mehendiwalaa.com".f14w4(
                    textColor: KColors.persistentBlack,
                    fontSize: 12.sp,
                    fontFamily: Fontfamily.poppins),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 12.h,
                ),
              ),
              Divider(),
              // height20,
              ListTile(
                onTap: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: "+918979181601",
                  );

                  if (await canLaunchUrl(launchUri)) {
                    await launchUrl(launchUri);
                  } else {
                    throw 'Could not launch +918979181601';
                  }
                },
                leading: Icon(
                  Icons.call,
                  size: 18.h,
                ),
                title: "Mobile number".f14w4(
                    textColor: KColors.persistentBlack,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
                subtitle: "+918979181601".f14w4(
                    textColor: KColors.persistentBlack,
                    fontSize: 12.sp,
                    fontFamily: Fontfamily.poppins),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 12.h,
                ),
              ),
              Divider(),

              ListTile(
                onTap: () async {
                  final Uri launchUri = Uri(
                    scheme: 'tel',
                    path: "+918630159154",
                  );

                  if (await canLaunchUrl(launchUri)) {
                    await launchUrl(launchUri);
                  } else {
                    throw 'Could not launch +918630159154';
                  }
                },
                leading: Icon(
                  Icons.call,
                  size: 18.h,
                ),
                title: "Mobile number".f14w4(
                    textColor: KColors.persistentBlack,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600),
                subtitle: "+918630159154".f14w4(
                    textColor: KColors.persistentBlack,
                    fontSize: 12.sp,
                    fontFamily: Fontfamily.poppins),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 12.h,
                ),
              ),
              Divider(),
              // getheight(context, 0.040),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialMediaButton(() async {
                    final Uri whatsappUrl = Uri.parse(
                      "https://www.instagram.com/mehndiwala001?igsh=dzhndjFjNmk3emp1",
                    );

                    if (await canLaunchUrl(whatsappUrl)) {
                      await launchUrl(
                        whatsappUrl,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      Get.snackbar("Error", "Could not open Instagram");
                    }
                  }, "assets/icons/instagram (1).png"),
                  socialMediaButton(() async {
                    final Uri whatsappUrl = Uri.parse(
                      "https://www.facebook.com/share/1G9Q1axGts/",
                    );

                    if (await canLaunchUrl(whatsappUrl)) {
                      await launchUrl(
                        whatsappUrl,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      Get.snackbar("Error", "Could not open Facebook");
                    }
                  }, "assets/icons/facebook.png"),
                  // socialMediaButton(() {}, "assets/icons/message.png"),
                  socialMediaButton(() async {
                    final Uri whatsappUrl = Uri.parse(
                      "https://wa.me/918630159154?text=Hello",
                    );

                    if (await canLaunchUrl(whatsappUrl)) {
                      await launchUrl(
                        whatsappUrl,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      Get.snackbar("Error", "Could not open WhatsApp");
                    }
                  }, "assets/icons/social.png"),
                  socialMediaButton(() async {
                    final Uri whatsappUrl = Uri.parse(
                      "https://www.linkedin.com/company/mehndiwalaa/",
                    );

                    if (await canLaunchUrl(whatsappUrl)) {
                      await launchUrl(
                        whatsappUrl,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      Get.snackbar("Error", "Could not open Linkden");
                    }
                  }, "assets/icons/linkedin.png"),
                ],
              ),
              height10,
            ],
          ),
        ),
      ),
    );
  }

  socialMediaButton(Function ontap, String img) {
    return MaterialButton(
      minWidth: 40.w,
      onPressed: () {
        ontap();
      },
      child: CustomImageProvider.assetsImage(image: img, height: 30.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100)),
    );
  }

  Future<void> openEmail({
    required String email,
    String subject = '',
    String body = '',
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email app';
    }
  }
}
