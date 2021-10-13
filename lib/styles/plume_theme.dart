
import 'package:flutter/material.dart';

abstract class Themes {
  get appBarTextStyle;
}

/// 默认Theme配置
class DefaultThemes extends Themes{
  
  ///
  /// AppBar 文字样式
  /// 带阴影的标题文字，文字颜色位白色，主题色注意。
  ///
  @override
  get appBarTextStyle => const TextStyle(color: Colors.white, fontSize: 18, shadows: _shadows4, letterSpacing: 1.8, fontWeight: FontWeight.w500);

  static const List<BoxShadow> _shadows4 = <BoxShadow>[
    const BoxShadow(offset: Offset(0.0, 2.0), blurRadius: 4.0, spreadRadius: -1.0, color: const Color(0x33000000)),
    const BoxShadow(offset: Offset(0.0, 4.0), blurRadius: 5.0, spreadRadius: 0.0, color: const Color(0x24000000)),
    const BoxShadow(offset: Offset(0.0, 1.0), blurRadius: 10.0, spreadRadius: 0.0, color: const Color(0x1F000000)),
  ];

}

