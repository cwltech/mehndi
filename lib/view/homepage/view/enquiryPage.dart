// import 'package:catalougeapp/utils/colors.dart';
// import 'package:catalougeapp/utils/customText.dart';
// import 'package:catalougeapp/utils/fontfamilly.dart';
// import 'package:catalougeapp/view/profilePage/controller/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/state_manager.dart';

// class EquiryPage extends GetView<ProfilePageController> {
//   const EquiryPage({super.key});
// //  final HomePageController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             automaticallyImplyLeading: false,
//             title: "Whislist".f14w4(
//                 textColor: KColors.persistentBlack,
//                 fontFamily: Fontfamily.poppins),
//           ),
//           body: Obx(
//             () => controller.enquiryList.isEmpty
//                 ? Center(
//                     child: CustomText(
//                     text: "No data found!",
//                   ))
//                 : GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2, mainAxisExtent: 190.h),
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () async {
//                           // await controller.getSubCategory(
//                           //     context, controller.categoryId.value);
//                           // pageNavigation(AlbumPage());
//                         },
//                         child: Container(
//                           // height: 250.h,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             // color: Color(controller.subCategoryList[index]["colors"]!),
//                             image: DecorationImage(
//                                 image: NetworkImage(
//                                     controller.enquiryList[index].image!),
//                                 fit: BoxFit.cover),
//                           ),
//                           margin: EdgeInsets.all(4),
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               Container(
//                                   alignment: Alignment.center,
//                                   margin: EdgeInsets.only(
//                                       right: 10.w, bottom: 10.h),
//                                   width: Get.width,
//                                   height: 20.h,
//                                   decoration:
//                                       BoxDecoration(color: KColors.vanila),
//                                   child: Text(
//                                     controller.enquiryList[index].heading!,
//                                     style: TextStyle(
//                                         color: KColors.background,
//                                         fontFamily: Fontfamily.poppins,
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 8.sp,
//                                         shadows: [
//                                           Shadow(
//                                               color: KColors.white,
//                                               offset: Offset(2, 3),
//                                               blurRadius: 15)
//                                         ]),
//                                   )),
//                               // Align(
//                               //   alignment: Alignment.topRight,
//                               //   child: Padding(
//                               //     padding: const EdgeInsets.all(8.0),
//                               //     child: InkWell(
//                               //         onTap: () async {
//                               //           // print(
//                               //           //     'Deleting ID: ${controller.whislistList[index].id}');
//                               //           // await controller.deleteWhislist(
//                               //           //   context,
//                               //           //   controller.whislistList[index].id!
//                               //           //       .toString(),
//                               //           // );
//                               //           // await controller.getWhislist(context);
//                               //           // print(
//                               //           //     'Updated list count: ${controller.whislistList.length}');

//                               //           // albumPageController.isFavo;urite.value =
//                               //           //     !albumPageController.isFavourite.value;
//                               //         },
//                               //         child: CircleAvatar(
//                               //           backgroundColor: KColors.pinkColor,
//                               //           radius: 11.r,
//                               //           child: Icon(
//                               //             Icons.close,
//                               //             color: KColors.white,
//                               //             size: 12.h,
//                               //           ),
//                               //         )),
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: controller.enquiryList.length,
//                   ),
//           )),
//     );
//   }
// }

import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/view/profilePage/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../../utils/pageNavigation.dart';
import '../../albumPage/view/galleryDetailPage.dart';
import '../controller/controller.dart';

class EquiryPage extends GetView<ProfilePageController> {
  EquiryPage({super.key});
  // final HomePageController hcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: "Enquiry".f14w4(
                textColor: KColors.persistentBlack,
                fontFamily: Fontfamily.poppins),
          ),
          body: Obx(() => controller.enquiryList.isEmpty
              ? Center(
                  child: CustomText(
                  text: "No data found!",
                ))
              : ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (contex, index) {
                    return Card(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            controller.enquiryList[index].date.toString(),
                            style: TextStyle(
                                color: KColors.background,
                                fontFamily: Fontfamily.poppins,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                shadows: [
                                  Shadow(
                                      color: KColors.white,
                                      offset: Offset(2, 3),
                                      blurRadius: 15)
                                ]),
                          ),
                        ),
                        Wrap(
                          children: [
                            ...Iterable.generate(controller
                                    .enquiryList[index].catalogue!.length)
                                .map((e) => InkWell(
                                      onTap: () async {
                                        final HomePageController hcontroller =
                                            Get.put(HomePageController());

                                        final catalogue = controller
                                            .enquiryList[index].catalogue![e];

                                        await hcontroller.saveView(
                                          context,
                                          catalogue.catalogueId.toString(),
                                        );

                                        await hcontroller.getImageSlider(
                                          context,
                                          catalogue.categoryId.toString(),
                                          catalogue.subCategoryId.toString(),
                                          catalogue.catalogueId.toString(),
                                          "3",
                                        );

                                        await pageNavigation(AlbumDetailPage());
                                      },
                                      child: Container(
                                        height: 150.h,
                                        width: 160.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.amber,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(controller
                                                .enquiryList[index]
                                                .catalogue![e]
                                                .image
                                                .toString()),
                                          ),
                                        ),
                                        margin: EdgeInsets.all(4),
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Container(
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    right: 10.w, bottom: 10.h),
                                                width: Get.width,
                                                height: 20.h,
                                                decoration: BoxDecoration(
                                                    color: KColors.vanila),
                                                child: Text(
                                                  controller.enquiryList[index]
                                                      .catalogue![e].heading
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: KColors.background,
                                                      fontFamily:
                                                          Fontfamily.poppins,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 8.sp,
                                                      shadows: [
                                                        Shadow(
                                                            color:
                                                                KColors.white,
                                                            offset:
                                                                Offset(2, 3),
                                                            blurRadius: 15)
                                                      ]),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                      ],
                    ));
                  },
                  itemCount: controller.enquiryList.length,
                ))),
    );
  }
}
