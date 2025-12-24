import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customElevatedButton.dart';
import 'package:catalougeapp/utils/customImageProvider.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:catalougeapp/utils/sizeHelper.dart';
import 'package:catalougeapp/view/paymentGateway/controller/paymentGatewayController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class UpgradePrimiumPage extends StatefulWidget {
  const UpgradePrimiumPage({super.key});
  @override
  State<UpgradePrimiumPage> createState() => _UpgradePrimiumPageState();
}

class _UpgradePrimiumPageState extends State<UpgradePrimiumPage> {
  PaymentGatewayController controller = Get.find();
  late Razorpay razorpay;

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    controller.transactionStatus.value = "Failure";
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    controller.transactionStatus.value = "Success";

    controller.updatePackageDetail(
      context,
    );
    // showAlertDialog(context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  @override
  initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
  }

  @override
  dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 300.h,
        width: Get.width,
        decoration: BoxDecoration(
            color: KColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          children: [
            getheight(context, 0.020),
            Align(
              alignment: Alignment.topCenter,
              child: controller.upgradePackageDetail.value.packageName!.f16w6(
                  textColor: KColors.background,
                  fontSize: 16.sp,
                  fontFamily: Fontfamily.poppins,
                  fontWeight: FontWeight.w600),
            ),
            height10,
            listTileWidget(controller.upgradePackageDetail.value.text1!),
            listTileWidget(controller.upgradePackageDetail.value.text2!),
            listTileWidget(controller.upgradePackageDetail.value.text3!),
            Padding(
              padding: EdgeInsets.only(left: 13.w, top: 15.h),
              child: Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (v) {},
                    activeColor: KColors.pinkColor,
                  ),
                  "₹ ${controller.upgradePackageDetail.value.price}.00 Life time"
                      .f16w6(
                          textColor: KColors.background,
                          fontSize: 12.sp,
                          fontFamily: Fontfamily.poppins,
                          fontWeight: FontWeight.w600),
                ],
              ),
            ),
            getheight(context, 0.040),
            PrimaryElevatedButton(
                text: "Continue",
                ontap: () {
                  var options = {
                    'key': 'rzp_live_ILgsfZCZoFIKMb',
                    'amount':
                        "${controller.upgradePackageDetail.value.price}00",
                    // controller.upgradePackageDetail.value.price
                    'name': 'Mehndiwala',
                    'description': 'Bridal Jewellery',
                    'retry': {'enabled': true, 'max_count': 1},
                    'send_sms_hash': true,
                    'prefill': {
                      'contact': '8888888888',
                      'email': 'test@razorpay.com'
                    },
                    'external': {
                      'wallets': ['paytm']
                    }
                  };

                  razorpay.open(options);
                }),
          ],
        ),
      ),
      body: ListView(
        children: [
          CustomImageProvider.assetsImage(
              image: "assets/images/primiumimg.webp"),
        ],
      ),
    );
  }

  listTileWidget(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, top: 10.h),
      child: Row(
        children: [
          CustomImageProvider.assetsImage(
              image: "assets/icons/check.png", height: 12.h),
          width10,
          Expanded(
            child: SizedBox(
              child: title.f16w6(
                  textColor: KColors.background,
                  fontSize: 10.sp,
                  fontFamily: Fontfamily.poppins,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
