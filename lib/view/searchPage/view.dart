import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/customformfileds.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/pageNavigation.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/utils/validation.dart';
import 'package:catalougeapp/view/albumPage/controller/controller.dart';
import 'package:catalougeapp/view/searchPage/searchDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<AlbumPageController> {
  const SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KColors.pinkColor.withValues(alpha: 0.5),
          title: "Search".f14w4(
              textColor: KColors.persistentBlack,
              fontFamily: Fontfamily.poppins,
              fontWeight: FontWeight.w600),
        ),
        body: Column(
          children: [
            height15,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: CustomTextFormField(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: getVerticalSize(7)),
                  inputType: TextInputType.name,
                  hintcolor: KColors.grey,
                  prefixIcon: Icon(
                    Icons.search,
                    color: KColors.grey,
                    size: 20.h,
                  ),
                  isSuffix: true,
                  suffixIcon: TextButton(
                    onPressed: () {
                      controller.search(
                        context,
                      );
                    },
                    child: "Search"
                        .f14w4(
                            textColor: KColors.persistentBlack,
                            fontFamily: Fontfamily.poppins,
                            fontWeight: FontWeight.w600,
                            fontSize: 10.sp)
                        .paddingAll(8),
                  ),
                  controller: controller.searchController,
                  borderRadius: 10,
                  hint: "search...",
                  fillColor: Colors.transparent,
                  validator: (value) => Validation.emptyValidation(value!),
                  onFieldSubmitted: (p0) {
                    controller.search(
                      context,
                    );
                  },
                ),
              ),
            ),
            height10,
            Obx(
              () => Expanded(
                child: SizedBox(
                    height: Get.height,
                    child: controller.searchList.isEmpty
                        ? Center(
                            child:
                                "No data!".f14w4(textColor: KColors.background),
                          )
                        : GridView.builder(
                            padding: EdgeInsets.all(10),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, mainAxisExtent: 150.h),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  controller.serachImage.value =
                                      controller.searchList[index].image!;
                                  controller.searchHeading.value =
                                      controller.searchList[index].heading!;
                                  controller.searchId.value =
                                      controller.searchList[index].heading!;

                                  await pageNavigation(SearchDeatilPage());
                                },
                                child: Container(
                                  height: 250.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Color(controller.subCategoryList[index]
                                    //     ["colors"]!),
                                    image: DecorationImage(
                                        image: NetworkImage(controller
                                            .searchList[index].image!),
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
                                          decoration: BoxDecoration(
                                              color: KColors.vanila),
                                          child: Text(
                                            controller
                                                .searchList[index].heading!,
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
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: controller.searchList.length,
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
