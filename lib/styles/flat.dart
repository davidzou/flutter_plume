import 'package:flutter/widgets.dart';

/// 扁平化设置
class FlatStyles {
  ///
  /// 一般模式
  ///
  static get normal => TextStyle();

  ///
  /// 黑夜模式
  ///
  static get normalDark => TextStyle();

  ///
  /// 边距
  ///
  static get padding => const EdgeInsets.all(18.0);

  ///
  /// 行距 标题文字和下面内容的距离间隔
  ///
  static get lineSpace => 8.0;

  ///
  /// 边框
  ///
  static get decoration => BoxDecoration(
      color: FlatStyles.backgroundColor,
      border: Border(
        left: BorderSide(width: 1.0, color: FlatStyles.frameColor),
        top: BorderSide(width: 1.0, color: FlatStyles.frameColor),
        right: BorderSide(width: 1.0, color: FlatStyles.frameColor),
        bottom: BorderSide(width: 1.0, color: FlatStyles.frameColor),
      ));

  ///
  /// 边框颜色
  /// dart模式  0x99ebebeb
  /// light模式 0xfffefefe
  ///
  static get frameColor => const Color(0xfffefefe);

  ///
  /// 背景颜色
  /// dart模式  0xff3c3c3c
  /// light模式 0xffececec
  ///
  static get backgroundColor => const Color(0xffececec);
}
