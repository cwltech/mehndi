import 'package:flutter/widgets.dart';

class OneWayScrollPhysics extends ScrollPhysics {
  final bool allowLeft;
  final bool allowRight;

  const OneWayScrollPhysics({
    required this.allowLeft,
    required this.allowRight,
    ScrollPhysics? parent,
  }) : super(parent: parent);

  @override
  OneWayScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return OneWayScrollPhysics(
      allowLeft: allowLeft,
      allowRight: allowRight,
      parent: buildParent(ancestor),
    );
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    final double overscroll = value - position.pixels;

    // Swiping left → overscroll < 0
    if (overscroll < 0 && !allowLeft) {
      return overscroll; // block left swipe
    }

    // Swiping right → overscroll > 0
    if (overscroll > 0 && !allowRight) {
      return overscroll; // block right swipe
    }

    return 0.0; // allow
  }
}
