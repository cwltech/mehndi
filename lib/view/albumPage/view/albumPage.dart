import 'package:catalougeapp/utils/colors.dart';

import 'package:catalougeapp/utils/customText.dart';

import 'package:catalougeapp/utils/sizeHelper.dart';

import 'package:catalougeapp/view/albumPage/widget/catelougeWidget.dart';
import 'package:catalougeapp/view/albumPage/widget/customDropDownWidget.dart';
import 'package:catalougeapp/view/albumPage/widget/galleryCategoryWidget.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final ScrollController scrollController = ScrollController();
  final HomePageController controller = Get.find();

  var isLoadingMore = false.obs;
  final int pageSize = 10;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore.value &&
          controller.hasMoreData.value) {
        // prevent multiple triggers
        isLoadingMore.value = true;

        // increment page in controller
        controller.pagiNationValue.value++;

        await controller.catelougeListByCategory(
          context,
          controller.categoryId.value,
          controller.subCategoryId.value,
        );

        isLoadingMore.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchWidget(),
        backgroundColor: Colors.white,
        toolbarHeight: 50.h,
      ),
      body: Obx(
        () => Column(
          children: [
            CategoryMenu(),
            getheight(context, 0.020),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
              child: Row(
                children: [
                  CustomDropDownWidget(
                    list: controller.categoryList2,
                    value: controller.categoryValue2.value,
                    controller: controller,
                    ontap: () {},
                  ),
                  width10,
                  controller.catelougeTypeList.isEmpty
                      ? SizedBox()
                      : CustomCategoryDropDownWidget(
                          list: controller.catelougeTypeList,
                          value: controller.categoryValue.value,
                          controller: controller,
                          ontap: () {},
                        ),
                ],
              ),
            ),
            height15,
            Expanded(
              child: Obx(() {
                if (controller.catelougeListByCategoryList.isEmpty &&
                    !isLoadingMore.value) {
                  return Center(
                    child: "No data".f16w6(textColor: KColors.persistentBlack),
                  );
                }

                return GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 230.h,
                    crossAxisSpacing: 0,
                  ),
                  itemCount: controller.catelougeListByCategoryList.length +
                      (controller.hasMoreData.value ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >=
                        controller.catelougeListByCategoryList.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    return CatelougeWidget(
                        controller: controller, index: index);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
