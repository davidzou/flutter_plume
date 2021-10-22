
import 'package:flutter/material.dart';

///
/// 3部分组成的容器。
///
/// 头部，内容，和底部。
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
  });

  final Widget header;
  final Widget content;
  final Widget footer;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  ///
  /// 用于判断是否在对话框中使用，对话框的宽度一般设置为屏宽的72%。此值默认为false
  ///
  final bool inDialog;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 72 / 100;
    return Container(
      width: inDialog ? _width : null,
      child: Column(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          header,
          content,
          footer,
        ],
      ),
    );
  }
}