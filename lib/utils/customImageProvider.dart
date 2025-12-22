import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

mixin CustomImageProvider {
  static assetsImage(
      {String? image,
      double? height,
      double? width,
      BoxFit? boxFit,
      Color? color}) {
    return Image.asset(
      image!,
      height: height,
      width: width,
      fit: boxFit,
      color: color,
    );
  }
}

class CustomSvgImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  const CustomSvgImage(
      {super.key,
      this.image = "",
      this.height,
      this.width,
      this.color,
      this.fit = BoxFit.contain});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height,
      width: width,
      color: color,
      fit: fit,
    );
  }
}

class CustomCachedNetworkImage extends StatelessWidget {
  final String image;
  final Widget Function(BuildContext, ImageProvider<Object>)? imagebuilder;
  final Widget Function(BuildContext, String)? placeHolder;
  const CustomCachedNetworkImage(
      {super.key, this.image = "", this.imagebuilder, this.placeHolder});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: image, imageBuilder: imagebuilder, placeholder: placeHolder);
  }
}
