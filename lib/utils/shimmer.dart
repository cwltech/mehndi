import 'package:catalougeapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BannerShimmer extends StatelessWidget {
  final double? height;
  final double? width;
  const BannerShimmer({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        baseColor: KColors.grey.withValues(alpha: 0.7),
        highlightColor: Colors.grey.withValues(alpha: 0.2),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: KColors.white,
          ),
          width: Get.width,
        ),
      ),
    );
  }
}
