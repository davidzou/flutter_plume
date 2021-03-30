import 'package:flutter/widgets.dart';

///
/// 选择横屏和竖屏的布局
/// Example:
///
///   class Main extends StatefulWidget {
///      build(BuildContext context) {
///       return OrientationBuilder(landscape: Center(child: Text('landscape')), portrait: Center(child: Text('portrait')),);
///     }
///   }
///
class OrientationResponsible extends StatelessWidget {
  OrientationResponsible({this.landscape, this.portrait})
      : assert(landscape != null),
        assert(portrait != null);

  /// 屏幕竖屏的布局
  final Widget landscape;

  /// 屏幕横屏的布局
  final Widget portrait;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.landscape) {
          return landscape;
        }
        return portrait;
      },
    );
  }
}