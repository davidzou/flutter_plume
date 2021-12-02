import 'package:flutter/widgets.dart';
import 'dart:math' as math;

///
/// 90度旋转页面
/// 翻页效果动画
///
class DegreeAngleRotationTransition extends AnimatedWidget {
  const DegreeAngleRotationTransition({
    Key? key,
    required Animation<double> turns,
    // this.alignment = Alignment.center,
    this.filterQuality,
    this.direction = TextDirection.rtl,
    this.child,
  }) : super(key: key, listenable: turns);

  /// The animation that controls the rotation of the child.
  ///
  /// If the current value of the turns animation is v, the child will be
  /// rotated v * 2 * pi radians before being painted.
  Animation<double> get turns => listenable as Animation<double>;

  /// The filter quality with which to apply the transform as a bitmap operation.
  ///
  /// {@macro flutter.widgets.Transform.optional.FilterQuality}
  final FilterQuality? filterQuality;

  /// A direction in which this child flows by animate.
  final TextDirection direction;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Alignment _alignment;
    double _angle;
    if (direction == TextDirection.rtl) {
      // 从右至左
      _alignment = turns.status == AnimationStatus.forward
          ? Alignment.bottomRight
          : Alignment.bottomLeft;
      _angle = turns.value * (math.pi) * 0.5 - math.pi * 0.5;
      if (turns.status == AnimationStatus.forward) {
        _angle = -(turns.value) * (math.pi) * .5 + math.pi * 0.5;
      }
    } else {
      // 从左到右
      _alignment = turns.status == AnimationStatus.forward
          ? Alignment.bottomLeft
          : Alignment.bottomRight;
      _angle = -(turns.value * (math.pi) * 0.5) - math.pi * 1.5;
      if (turns.status == AnimationStatus.forward) {
        _angle = turns.value * math.pi * 0.5 + math.pi * 1.5;
      }
    }
    return Transform(
      transform: Matrix4.rotationZ(_angle)..rotateY(_angle),
      alignment: _alignment,
      filterQuality: filterQuality,
      child: child,
    );
  }
}
