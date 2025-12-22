import 'package:catalougeapp/utils/colors.dart';
import 'package:catalougeapp/utils/customText.dart';
import 'package:catalougeapp/utils/fontfamilly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Color? buttonColor;
  final bool? isGradient;
  final Color? textColor;
  const CustomElevatedButton(
      {super.key,
      this.text,
      this.buttonColor,
      this.isGradient,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        alignment: Alignment.center,
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isGradient! ? null : buttonColor,
            gradient: isGradient!
                ? LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.yellow,
                      KColors.persistentBlack.withValues(alpha: 0.9),
                    ],
                  )
                : null),
        child: text!.f14w4(
            textColor: textColor,
            fontFamily: Fontfamily.montserrat,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp),
      ),
    );
  }
}

class PrimaryElevatedButton extends StatelessWidget {
  final String? text;
  final Function? ontap;

  const PrimaryElevatedButton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        ontap!();
      },
      child: Container(
        alignment: Alignment.center,
        height: 42.h,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [KColors.pinkColor, KColors.purpleColor],
            )),
        child: text!.f16w4(
            textColor: KColors.white,
            fontFamily: Fontfamily.poppins,
            fontWeight: FontWeight.w700,
            fontSize: 13.sp),
      ),
    );
  }
}

class InactiveButton extends StatelessWidget {
  final String? text;
  final Function? ontap;

  const InactiveButton({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 42.h,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [KColors.grey, KColors.grey.withValues(alpha: 0.5)],
          )),
      child: "OTP Sent".f16w4(
          textColor: KColors.persistentBlack.withValues(alpha: 0.2),
          fontFamily: Fontfamily.poppins,
          fontWeight: FontWeight.w700,
          fontSize: 13.sp),
    );
  }
}

class Bounceable extends StatefulWidget {
  /// Set it to `null` to disable `onTap`.
  final VoidCallback? onTap;
  final void Function(TapUpDetails)? onTapUp;
  final void Function(TapDownDetails)? onTapDown;
  final VoidCallback? onTapCancel;

  /// The reverse duration of the scaling animation when `onTapUp`.
  final Duration? duration;

  /// The duration of the scaling animation when `onTapDown`.
  final Duration? reverseDuration;

  /// The reverse curve of the scaling animation when `onTapUp`.
  final Curve curve;

  /// The curve of the scaling animation when `onTapDown`..
  final Curve? reverseCurve;

  /// The scale factor of the child widget. The valid range of `scaleFactor` is from `0.0` to `1.0`.
  final double scaleFactor;

  /// How the internal gesture detector should behave during hit testing.
  final HitTestBehavior? hitTestBehavior;

  final Widget child;

  const Bounceable({
    Key? key,
    required this.onTap,
    required this.child,
    this.onTapUp,
    this.onTapDown,
    this.onTapCancel,
    this.duration = const Duration(milliseconds: 200),
    this.reverseDuration = const Duration(milliseconds: 00),
    this.curve = Curves.decelerate,
    this.reverseCurve = Curves.decelerate,
    this.scaleFactor = 0.8,
    this.hitTestBehavior,
  })  : assert(
          scaleFactor >= 0.0 && scaleFactor <= 1.0,
          "The valid range of scaleFactor is from 0.0 to 1.0.",
        ),
        super(key: key);

  @override
  State<Bounceable> createState() => _BounceableState();
}

class _BounceableState extends State<Bounceable>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
    reverseDuration: widget.reverseDuration,
    value: 1.0,
    upperBound: 1.0,
    lowerBound: widget.scaleFactor,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
    reverseCurve: widget.reverseCurve,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  void _onTap() {
    if (widget.onTap != null) widget.onTap!();

    _controller.reverse().then((_) {
      _controller.forward();
    });
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTapUp != null) widget.onTapUp!(details);
    _controller.forward();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTapDown != null) widget.onTapDown!(details);
    _controller.reverse();
  }

  void _onTapCancel() {
    if (widget.onTapCancel != null) widget.onTapCancel!();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: widget.hitTestBehavior,
        onTapCancel: widget.onTap != null ? _onTapCancel : null,
        onTapDown: widget.onTap != null ? _onTapDown : null,
        onTapUp: widget.onTap != null ? _onTapUp : null,
        onTap: widget.onTap != null ? _onTap : null,
        child: ScaleTransition(
          scale: _animation,
          child: widget.child,
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final Function ontap;
  final String textButton;
  final Color? textcolor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? radius;
  final String? fontFamily;

  const CustomTextButton(
      {super.key,
      required this.ontap,
      required this.textButton,
      this.textcolor,
      this.fontWeight,
      this.fontSize,
      this.radius,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          ontap();
        },
        child: Text(
          textButton,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textcolor,
              fontFamily: fontFamily),
        ));
  }
}
