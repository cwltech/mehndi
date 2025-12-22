import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import '../../firebaseApi/get_serverKey.dart';
import '../albumPage/view/galleryDetailPage.dart';
import '../homepage/controller/controller.dart';

class WhislistPage extends GetView<HomePageController> {
  WhislistPage({super.key});
//  final HomePageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: "Whislist".f14w4(
                textColor: KColors.persistentBlack,
                fontFamily: Fontfamily.poppins),
          ),
          body: Obx(
            () => controller.whislistList.isEmpty
                ? Center(
                    child: CustomText(
                    text: "No data found!",
                  ))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 190.h),
                    itemBuilder: (context, index) {
                      print(
                          'whishlist length ${controller.whislistList.length}');
                      print('whishlist data ${controller.whislistList}');

                      return InkWell(
                        onTap: () async {
                          var whistlist = controller.whislistList[index];
                          //AlbumPageController albumPageController = Get.find();
                          // HomePageController homePageController = Get.find();
                          // await controller.getSubCategory(context,
                          //     controller.whislistList[index].id.toString());
                          // print(
                          //     "id is ${controller.whislistList[index].id.toString()}");

                          //await controller.catelougeDetailPage(index, context);
                          // final selectedWhislist =
                          //     controller.whislistList[index];
                          //
                          // await controller.getSubCategory(
                          //   context,
                          //   selectedWhislist.id.toString(),
                          // );
                          //
                          // await controller.catelougeDetailPageFromWhishlist(
                          //   selectedWhislist,
                          //   context,
                          // );

                          await controller.saveView(
                              context, whistlist.catalogueId.toString());

                          await controller.getImageSlider(
                            context,
                            whistlist.categoryId.toString(),
                            whistlist.subCategoryId.toString(),
                            whistlist.catalogueId.toString(),
                            "3",
                          );
                          // Getserverkey serviceKey = Getserverkey();
                          // String getServiceKey =
                          //     await serviceKey.getServerKeyToken();
                          // print('serviceKey $getServiceKey');
                          await pageNavigation(AlbumDetailPage());
                        },
                        child: Container(
                          // height: 250.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // color: Color(controller.subCategoryList[index]["colors"]!),
                            image: DecorationImage(
                                image: NetworkImage(
                                    controller.whislistList[index].image!),
                                fit: BoxFit.cover),
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
                                  decoration:
                                      BoxDecoration(color: KColors.vanila),
                                  child: Text(
                                    controller.whislistList[index].heading!,
                                    style: TextStyle(
                                        color: KColors.background,
                                        fontFamily: Fontfamily.poppins,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 8.sp,
                                        shadows: [
                                          Shadow(
                                              color: KColors.white,
                                              offset: Offset(2, 3),
                                              blurRadius: 15)
                                        ]),
                                  )),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () async {
                                        print(
                                            'Deleting ID: ${controller.whislistList[index].id}');
                                        await controller.deleteWhislist(
                                          context,
                                          controller.whislistList[index].id!
                                              .toString(),
                                        );
                                        await controller.getWhislist(context);
                                        print(
                                            'Updated list count: ${controller.whislistList.length}');

                                        // albumPageController.isFavo;urite.value =
                                        //     !albumPageController.isFavourite.value;
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: KColors.pinkColor,
                                        radius: 11.r,
                                        child: Icon(
                                          Icons.close,
                                          color: KColors.white,
                                          size: 12.h,
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: controller.whislistList.length,
                  ),
          )),
    );
  }
}
