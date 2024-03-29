import 'package:flutter/material.dart';

///
/// 标题
///
/// 应用场景：段落标题，分段主题等。
///
/// +----------------------------+
/// || title                     |
/// || subTitle                  |
/// +----------------------------+
///
/// ### Example:
///
/// ```dart
///   Column(
///     children: <Widget>[
///       HeaderTitle.h1("标题")，
///       Text("正文内容"),
///     ]
///   )
/// ```
///
/// > version: [1.0.0]
///
class HeadTitle extends StatelessWidget {
  ///
  /// @param title      标题文字
  /// @param subTitle   副标题文字
  /// @param color      主题色
  ///
  const HeadTitle(this.title, {Key? key, this.subTitle, this.color = const Color(0xff2d85f0), this.titleStyle, this.subTitleStyle}) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final String? subTitle;
  final String? subTitleStyle;
  final Color color;

  _titleStyle() {
    return TextStyle(color: color, fontSize: 18.0, fontWeight: FontWeight.bold);
  }

  _subTitleStyle() {
    return TextStyle(
      color: color,
      fontSize: 14.0,
    );
  }

  factory HeadTitle.h1(String title) {
    return HeadTitle(
      title,
      titleStyle: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory HeadTitle.h2(String title) {
    return HeadTitle(
      title,
      titleStyle: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory HeadTitle.h3(String title) {
    return HeadTitle(
      title,
      titleStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory HeadTitle.h4(String title) {
    return HeadTitle(
      title,
      titleStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory HeadTitle.h5(String title) {
    return HeadTitle(
      title,
      titleStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  factory HeadTitle.h6(String title) {
    return HeadTitle(
      title,
      titleStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> _children(String title, String? subTitle) {
    List<Widget> list = [];
    // if (title != null) {
    var tx = Text(
      title,
      style: titleStyle ?? _titleStyle(),
    );
    list.add(tx);
    // }
    if (subTitle != null) {
      var subTx = Text(
        subTitle,
        style: subTitleStyle ?? _subTitleStyle(),
      );
      list.add(subTx);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 2, color: color),
            bottom: BorderSide(width: 2, color: color),
            left: BorderSide(width: 10, color: color),
            right: BorderSide(width: 2, color: color),
          ),
//        boxShadow: 0 0 0 1px #5F5A4B, 1px 1px 6px 1px rgba(10, 10, 0, 0.5)
          boxShadow: [
            BoxShadow(color: Color(0xff5f5a4b), offset: Offset(0, 0), spreadRadius: 1),
            BoxShadow(color: Color.fromARGB(127, 10, 10, 0), offset: Offset(1, 1), spreadRadius: 1, blurRadius: 6),
          ]),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _children(title, subTitle),
        ),
      ),
    );
  }
}

///
/// 标题，仅文字。字体大小设置默认，样式随主题。
///
/// +------------------+
/// ｜ head            ｜
/// +------------------+
///
/// See Also:
/// [TextTheme.headlineSmall]
///
class HeaderSmall extends StatelessWidget {
  const HeaderSmall({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        this.title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

///
/// 标题，仅文字。字体大小设置默认，样式随主题。
///
/// +------------------+
/// ｜ head            ｜
/// +------------------+
///
/// See Also:
/// [TextTheme.headlineMedium]
///
class HeaderMedium extends StatelessWidget {
  const HeaderMedium({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        this.title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

///
/// 标题，仅文字。字体大小设置默认，样式随主题。
///
/// +------------------+
/// ｜ head            ｜
/// +------------------+
///
/// See Also:
/// [TextTheme.headlineLarge]
///
class HeaderLarge extends StatelessWidget {
  const HeaderLarge({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        this.title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
