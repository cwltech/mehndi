import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      this.inputType = TextInputType.text,
      this.label,
      this.maxLength = 18,
      this.readOnly = false,
      this.isObscureText = false,
      this.isCollapsed = false,
      this.validator,
      this.onChanged,
      this.prefixText,
      this.onTapAction,
      this.inputFormator,
      this.trailing,
      this.padding,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.shape,
      this.hint,
      this.isPrefix,
      this.isMaxLength,
      this.textInputAction,
      this.maxLines,
      this.isSuffix,
      this.ontap,
      this.focusNode,
      this.focusNodes,
      this.length,
      this.isObscurring,
      this.suffixIcon,
      this.contentPadding,
      this.keys,
      this.prefixIcon,
      this.borderRadius,
      this.fillColor,
      this.counterText,
      this.errorcolor,
      this.hintcolor,
      this.onFieldSubmitted,
      this.textCapitalization = TextCapitalization.none})
      : super(key: key);

  final double? borderRadius;
  final TextEditingController controller;
  final InputBorder? shape;
  final TextInputType? inputType;
  final String? label, prefixText, counterText;
  final bool readOnly, isObscureText, isCollapsed;
  final Widget? trailing;
  final int? maxLength;
  final EdgeInsets? padding;
  final List<TextInputFormatter>? inputFormator;
  final AutovalidateMode? autovalidateMode;
  final VoidCallback? onTapAction;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? focusNodes;
  final String? Function(String?)? onFieldSubmitted;
  final TextCapitalization? textCapitalization;

  final TextInputAction? textInputAction;
  final String? hint;
  final bool? isPrefix, isMaxLength, maxLines, isSuffix, isObscurring;
  final Function? ontap;
  final FocusNode? focusNode;
  final int? length;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Key? keys;
  final Widget? prefixIcon;
  final Color? fillColor, hintcolor, errorcolor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization!,
      style: TextStyle(color: KColors.persistentBlack, fontSize: 14.sp),
      cursorHeight: 12,
      onTap: () {
        // ontap!();
      },
      cursorColor: KColors.persistentBlack,
      inputFormatters: inputFormator,
      enableSuggestions: true,
      readOnly: readOnly,
      autovalidateMode: autovalidateMode,
      key: keys,
      onChanged: onChanged,
      obscureText: isObscureText,
      obscuringCharacter: "*",
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      maxLines: maxLines == true ? 6 : 1,
      controller: controller,
      maxLength: isMaxLength == true ? length : null,

      // onChanged: (v) {
      //   if (v.contains(RegExp(r'[1-10]'))) {
      //     return null;
      //   } else
      //     "enter valid mobile number";
      // },
      keyboardType: inputType,
      validator: validator,
      decoration: InputDecoration(
        enabled: true,
        fillColor: fillColor,
        filled: true,
        contentPadding: contentPadding,
        counterText: counterText,
        labelText: label,
        suffixIcon: isSuffix == true ? suffixIcon : null,
        prefixIcon: prefixIcon,
        labelStyle: const TextStyle(color: KColors.persistentBlack),
        helperStyle: const TextStyle(color: KColors.persistentBlack),
        errorStyle: TextStyle(color: errorcolor),
        hintText: hint,
        hintStyle: TextStyle(color: hintcolor, fontSize: 12.sp),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }
}

unfocusField() {
  return FocusManager.instance.primaryFocus?.unfocus();
}

// class FormFiledWidget extends StatelessWidget {
//   final String? label, hint, hint2;
//   final IconData? icon;
//   final bool? isIcon, isHide, isMaxLength, maxLines;
//   final IconData? suffixIcon;
//   final Function? ontap;
//   final TextEditingController? controller;
//   final String? Function(String?)? validation;
//   final String? Function(String?)? onChnaged;
//   final TextInputType? textInputType;
//   final List<TextInputFormatter>? inputFormator;
//   final int? length;

//   const FormFiledWidget(
//       {this.label,
//       this.hint,
//       this.hint2,
//       this.icon,
//       this.isIcon,
//       this.isHide,
//       this.suffixIcon,
//       this.ontap,
//       this.controller,
//       this.validation,
//       this.onChnaged,
//       this.textInputType,
//       this.inputFormator,
//       this.maxLines,
//       this.isMaxLength,
//       this.length,
//       super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         label!.f14w4(
//             fontFamily: Fontfamily.montserrat,
//             textColor: KColors.persistentBlack,
//             fontWeight: FontWeight.w600,
//             fontSize: 13.sp),
//         getheight(Get.context, 0.005),
//         CustomFormField(
//           maxLength: isMaxLength == true ? length : null,
//           maxLines: maxLines == true ? 8 : 1,
//           isObscurring: false,
//           isObscureText: isHide!,
//           validator: validation,
//           onChanged: onChnaged,
//           inputType: textInputType,
//           inputFormator: inputFormator,
//           borderRadius: 10,
//           fillColor: KColors.widgetBackgroundColor,
//           isPrefix: true,

//           contentPadding:
//               EdgeInsets.symmetric(horizontal: getHorizontalSize(16)),
//           controller: controller!,
//           hint: hint,

//           // label: hint2,
//           isSuffix: true,
//           prefixIcon: isIcon!
//               ? IconButton(
//                   onPressed: () {
//                     ontap!();
//                   },
//                   icon: Icon(
//                     suffixIcon,
//                     color: KColors.grey,
//                   ))
//               : const SizedBox(),
//         ),
//       ],
//     );
//   }
// }
