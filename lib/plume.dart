library plume;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

///
/// 选择横屏和竖屏的布局
/// Example:
///
///   class Main extends StatefulWidget {
///      build(BuildContext context) {
///       return RWOrientationBuilder(landscape: Center(child: Text('landscape')), portrait: Center(child: Text('portrait')),);
///     }
///   }
///
@Deprecated("[OrientationResponsible] instead it.")
class RWOrientationBuilder extends StatelessWidget {
  RWOrientationBuilder({this.landscape, this.portrait})
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

///
///  界面底部按钮，宽度为整屏，高度自适应，按照字体大小
///
class RWLoginButton extends StatelessWidget {
  RWLoginButton({this.title, this.onPressed, this.textStyle, this.backgroundColor});

  final VoidCallback onPressed;
  final String title;
  final TextStyle textStyle;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        height: textStyle.fontSize + 30,
        child: ElevatedButton(
          child: Text(
            title,
            style: textStyle,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

///
///
///
class RWWidget {
  BoxDecoration border() {
    return BoxDecoration(
      // 边框颜色和宽度
      border: Border(
        top: BorderSide(width: 1.0, color: Color(0x99888888)),
        left: BorderSide(width: 1.0, color: Color(0x99888888)),
        right: BorderSide(width: 1.0, color: Color(0x99888888)),
        bottom: BorderSide(width: 1.0, color: Color(0x99888888)),
      ),
      // 背景色
      color: Colors.white,
      // 边框阴影
      boxShadow: [
        BoxShadow(color: Color(0x99cccccc), offset: Offset(5.0, 5.0), blurRadius: 10.0, spreadRadius: 2.0),
        BoxShadow(color: Color(0x99aaaaaa), offset: Offset(1.0, 1.0)),
      ],
    );
  }
}
