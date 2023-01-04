import 'package:flutter/material.dart';

abstract class Themes {
  get appBarTextStyle;
}

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color shrinePink100 = Color(0xFFFEDBD0);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color shrineBrown900 = Color(0xFF442B2D);
const Color shrineBrown600 = Color(0xFF7D4F52);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;

const ColorScheme shrineColorScheme = ColorScheme(
  primary: shrinePink100,
  // primaryVariant: shrineBrown900,
  primaryContainer: shrineBrown900,
  secondary: shrineBrown900,
  // secondaryVariant: shrineBrown900,
  secondaryContainer: shrineBrown900,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: shrineBrown900,
  onSecondary: shrineBrown900,
  onSurface: shrineBrown900,
  onBackground: shrineBrown900,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

/// 默认Theme配置
class DefaultThemes extends Themes {
  ///
  /// AppBar 文字样式
  /// 带阴影的标题文字，文字颜色位白色，主题色注意。
  ///
  @override
  get appBarTextStyle => const TextStyle(
      color: Colors.white,
      fontSize: 18,
      shadows: _shadows4,
      letterSpacing: 1.8,
      fontWeight: FontWeight.w500);

  static const List<BoxShadow> _shadows4 = <BoxShadow>[
    const BoxShadow(
        offset: Offset(0.0, 2.0),
        blurRadius: 4.0,
        spreadRadius: -1.0,
        color: const Color(0x33000000)),
    const BoxShadow(
        offset: Offset(0.0, 4.0),
        blurRadius: 5.0,
        spreadRadius: 0.0,
        color: const Color(0x24000000)),
    const BoxShadow(
        offset: Offset(0.0, 1.0),
        blurRadius: 10.0,
        spreadRadius: 0.0,
        color: const Color(0x1F000000)),
  ];

  static ThemeData base() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      toggleableActiveColor: shrinePink400,
      primaryColor: Colors.lightBlueAccent,
      // buttonColor: shrinePink100,
      scaffoldBackgroundColor: shrineBackgroundWhite,
      cardColor: shrineBackgroundWhite,
      // textSelectionColor: shrinePink100,
      errorColor: shrineErrorRed,
      buttonTheme: const ButtonThemeData(
        colorScheme: shrineColorScheme,
        textTheme: ButtonTextTheme.normal,
      ),
      primaryIconTheme: _customIconTheme(base.iconTheme),
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      // accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      iconTheme: _customIconTheme(base.iconTheme),
      dialogTheme: DialogTheme(
        backgroundColor: shrinePink100,
      ),
      colorScheme: shrineColorScheme.copyWith(secondary: shrineBrown900),
    );
  }

  static IconThemeData _customIconTheme(IconThemeData original) {
    return original.copyWith(color: shrineBrown900);
  }

  static TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          caption: base.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: defaultLetterSpacing,
          ),
          button: base.button!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: defaultLetterSpacing,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: shrineBrown900,
          bodyColor: shrineBrown900,
        );
  }
}
