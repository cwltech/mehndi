import 'package:catalougeapp/utils/localStorage.dart';
import 'package:catalougeapp/view/albumPage/controller/controller.dart';
import 'package:catalougeapp/view/homepage/controller/controller.dart';
import 'package:catalougeapp/view/login/controller/loginPageController.dart';
import 'package:catalougeapp/view/mainPage/controller.dart';
import 'package:catalougeapp/view/otpPage/controller/controller.dart';
import 'package:catalougeapp/view/paymentGateway/controller/paymentGatewayController.dart';
import 'package:catalougeapp/view/profilePage/controller/controller.dart';
import 'package:catalougeapp/view/upgradePrimiumPage/controller.dart';
import 'package:get/get.dart';

class GetxBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInPageController>(() => SignInPageController(),
        fenix: true);
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<OTPPageController>(() => OTPPageController(), fenix: true);
    Get.lazyPut<AlbumPageController>(() => AlbumPageController(), fenix: true);
    Get.lazyPut<MainPageController>(() => MainPageController(), fenix: true);
    Get.lazyPut<ProfilePageController>(() => ProfilePageController(),
        fenix: true);
    Get.lazyPut<LocalStorage>(() => LocalStorage(), fenix: true);
    Get.lazyPut<PaymentGatewayController>(() => PaymentGatewayController(),
        fenix: true);
    Get.lazyPut<UpgradePrimiumController>(() => UpgradePrimiumController(),
        fenix: true);
    // Get.lazyPut<NotificationController>(() => NotificationController(),
    //     fenix: true);
  }
}
