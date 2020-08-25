import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// Block Container
///
/// +-----+
/// |  1  |
/// +-----+
///
/// ### Example:
/// ```dart
/// Block(
///   width: 80.0,
///   height: 80.0,
///   title: "1",
///   color: Colors.blueAccent
/// )
/// ```
///
class Block extends StatelessWidget {
  Block(
      {Key key,
      this.width = 80.0,
      this.height = 80.0,
      this.title = "",
      this.color = Colors.blueAccent})
      : super(key: key);

  ///
  /// 宽
  ///
  final double width;

  ///
  /// 高
  ///
  final double height;

  ///
  /// 标题
  ///
  final String title;

  ///
  /// 背景色
  ///
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: width,
      height: height,
      child: Center(
          child: Text(
        title,
        style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
      )),
    );
  }
}
