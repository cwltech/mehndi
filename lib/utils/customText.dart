import 'package:catalougeapp/utils/customTextstyle.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

extension ExtendedString on String {
//  static const strFontFamily = "";

  Text f10w4(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f10w4.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));
  Text f13w5(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f13w5.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));
  Text f12w4(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight,
          bool? softWrap,
          double? fontSize,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          softWrap: softWrap,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f12w4.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));
  Text f14w4(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          double? height,
          FontWeight? fontWeight,
          double? fontSize,
          TextDecoration? decoration,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f14w4.copyWith(
              color: textColor,
              height: height,
              fontSize: fontSize,
              decoration: decoration,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));
  Text f16w4(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          double? height,
          FontWeight? fontWeight = FontWeight.w400,
          double? fontSize,
          TextDecoration? decoration,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f16w6.copyWith(
              color: textColor,
              height: height,
              fontSize: fontSize,
              decoration: decoration,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));

  Text f24w7(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight = FontWeight.w700,
          double? fontSize,
          TextDecoration? decoration,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f24w5.copyWith(
              color: textColor,
              fontSize: fontSize,
              decoration: decoration,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));
  Text f16w7(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight = FontWeight.w700,
          double? fontSize,
          TextDecoration? decoration,
          TextOverflow? overflow,
          FontStyle? fontStyle,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f16w5.copyWith(
              color: textColor,
              fontSize: fontSize,
              decoration: decoration,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              fontStyle: fontStyle,
              decorationColor: decorationColor));

  Text f18w7(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight = FontWeight.w700,
          double? fontSize,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f18w6.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));
  Text f16w6(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextDecoration? decoration,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f16w5.copyWith(
              color: textColor,
              decoration: decoration,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));
  Text f18w6(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f18w6.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));

  Text f20w5(
          {Color? textColor = KColors.white,
          TextAlign? textAlign = TextAlign.start,
          int? maxLines,
          FontWeight? fontWeight,
          double? fontSize,
          TextOverflow? overflow,
          String? fontFamily,
          Color? decorationColor}) =>
      Text(this,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          style: KTextStyle.f24w5.copyWith(
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              decorationColor: decorationColor));
}

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final double? wordSpacing;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;
  final String? fontFamily;
  const CustomText(
      {this.textOverflow,
      this.textDecoration,
      this.wordSpacing,
      this.textAlign,
      this.fontStyle,
      this.fontWeight,
      this.fontSize,
      this.text = "",
      this.color,
      this.fontFamily,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
        decoration: textDecoration,
        fontFamily: fontFamily,
        letterSpacing: wordSpacing,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
