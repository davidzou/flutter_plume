import 'package:flutter/material.dart';

///
/// 3部分组成的容器。
///
/// 头部，内容，和底部。
/// <pre>
///  direction=[Axis.vertical]        direction=[Axis.horizontal]
///  +---------------------+        +-------------------------+
///  |+-------------------+|        |+-------+-------+-------+|
///  || Header part       ||        ||Header |Content|Footer ||
///  |+-------------------+|        ||       |       |       ||
///  || Content part      ||        || part  | part  | part  ||
///  |+-------------------+|        ||       |       |       ||
///  ||  Footer part      ||        ||       |       |       ||
///  |+-------------------+|        |+-------+-------+-------+|
///  |TernaryContainer     |        |TernaryContainer         |
///  +---------------------+        +-------------------------+
/// </pre>
///
/// * 如果要使用在Dialog中，设置选项inDialog为true，这样就会设置容器的宽度最大在屏幕的72%。否则以全屏宽度计。
///
class TernaryContainer extends StatelessWidget {
  TernaryContainer({
    Key? key,
    required this.header,
    required this.content,
    required this.footer,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.min,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.inDialog = false,
    this.direction = Axis.vertical,
  });

  final Widget header;
  final Widget content;
  final Widget footer;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final Axis direction;

  ///
  /// 用于判断是否在对话框中使用，对话框的宽度一般设置为屏宽的72%。此值默认为false
  ///
  final bool inDialog;

  /// 竖向布局
  Widget _vertical() {
    return Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        header,
        content,
        footer,
      ],
    );
  }

  /// 横向布局
  Widget _horizontal() {
    return Row(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        header,
        content,
        footer,
      ],
    );
  }

  Widget _childBuild() {
    if (direction == Axis.horizontal) {
      return _horizontal();
    }
    return _vertical();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.72;
    return Container(
      width: inDialog ? _width : null,
      child: _childBuild(),
    );
  }
}


/// 带图片的布局，三部分
class TernaryImageContainer extends StatelessWidget {
  const TernaryImageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Icon(Icons.star),
          Column(
            children: [
              Text("abc"),
              Text("sdjkke"),
            ],
          )
        ],
      ),
    );
  }
}
