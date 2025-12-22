import 'package:get/get.dart';

pageNavigation(dynamic page) {
  return Get.to(page,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 700));
}
