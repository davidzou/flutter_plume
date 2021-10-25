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
/// > version: [1.0.0]
///
class Block extends StatelessWidget {
  Block({
    Key? key,
    this.width = 80.0,
    this.height = 80.0,
    this.title,
    this.color = Colors.blueAccent,
  }) : super(key: key);

  factory Block.normal({String title = "", TextStyle? style, double? width, double? height, Color? color}) {
    return Block(
      width: width ?? 80.0,
      height: height ?? 80.0,
      color: color ?? Colors.blueAccent,
      title: Text(
        title,
        style: style ?? TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
      ),
    );
  }

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
  final Widget? title;

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
      child: Center(child: title),
    );
  }
}
