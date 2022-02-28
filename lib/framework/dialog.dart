import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/framework/container/ternary.dart';

class DialogProvider {
  ///
  /// 显示一个对话框，只有一个按钮，取消则按空白区域即可。减少选择的困惑。
  ///
  /// <p>
  /// ### 参数
  ///
  /// > title
  ///   标题， 信息，提示，错误。
  ///
  /// > message
  ///   内容，消息。
  ///
  @deprecated
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onPressed,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.yellowAccent,
                ),
              ],
            ),
            content: Text(
              message,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  onPressed?.call();
                  Navigator.pop(context, true);
                },
                child: Text("知道了"),
              ),
            ],
          );
        });
  }

  ///
  /// 通知，公告。
  ///
  /// ### 用途
  /// * 提示信息
  /// * 展示内容
  /// * 展示说明
  ///
  /// ### 参数    |参数名|描述|是否必须|
  ///
  /// * context     上下文<Must>
  /// * title       信息标题<Must>
  /// * content     信息内容<Must>
  /// * buttonName  按钮文字。
  /// * onPressed   按钮点击事件响应。
  /// * indent      排版，左边缩进的距离。
  /// * dark        是否强制指定夜间模式或者白天模式，不设置使用系统默认。
  ///
  static Future<T?> notice<T>(
    BuildContext context, {
    required String title,
    required String content,
    String buttonName = "Got it",
    VoidCallback? onPressed,
    double indent = 28,
    bool? dark,
  }) {
    // 取宽，屏幕的60%用于对话框。
    double _width = MediaQuery.of(context).size.width * 0.72;
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    return showDialog<T>(
      context: context,
      // Color(0x9eB2EbF2) 忧郁蓝
      barrierColor: _dark ? Color(0xaa000000) : Color(0x9effffff),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: _dark ? Colors.black45 : Colors.white60,
          // 对话框区域背景色
          elevation: 12.0,
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Container(
                width: _width,
                padding: EdgeInsets.fromLTRB(indent, 28.0, 8.0, 8.0),
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: _dark ? Colors.white : Colors.black87),
                ),
              ),
              SizedBox(
                width: _width,
                child: Divider(
                  height: 18,
                  thickness: 1.8,
                  indent: indent,
                  color: _dark ? Colors.white : Colors.black87,
                ),
              ),
              // content
              Container(
                width: _width,
                padding: EdgeInsets.fromLTRB((indent + 8.0), 8.0, 8.0, 8.0),
                child: Text(
                  content,
                  style:
                      TextStyle(color: _dark ? Colors.white : Colors.black87),
                ),
              ),
              // button
              Container(
                width: _width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 8.0),
                child: TextButton(
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: onPressed ??
                      () {
                        Navigator.of(context).pop();
                      },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  ///
  ///
  ///
  /// Do not use it.
  /// TODO 扩展出内容，仅有布局框架。
  Future<T?> noticeX<T>(
    BuildContext context, {
    required Widget title,
    required Widget content,
    // Widget button = const ElevatedButton(
    //   child: Text("Got it"),
    //   onPressed: null,
    // ),
    Widget? button,
    VoidCallback? onPressed,
    double indent = 28,
    bool? dark,
  }) {
    // 取宽，屏幕的60%用于对话框。
    double _width = MediaQuery.of(context).size.width * 0.72;
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: _dark ? Colors.black45 : Colors.white24,
          // 对话框区域背景色
          elevation: 12.0,
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _width,
                padding: EdgeInsets.fromLTRB(indent, 28.0, 8.0, 8.0),
                child: title,
              ),
              SizedBox(
                width: _width,
                child: Divider(
                  height: 18,
                  thickness: 0.8,
                  indent: indent,
                  color: _dark ? Colors.white : Colors.black87,
                ),
              ),
              Container(
                width: _width,
                padding: EdgeInsets.fromLTRB((indent + 8.0), 8.0, 8.0, 8.0),
                child: content,
              ),
              Container(
                width: _width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 8.0),
                child: button,
              )
            ],
          ),
        );
      },
    );
  }

  ///
  /// 选择项，确定或者取消。
  ///
  /// ### 用途
  /// * 参数选择
  /// * 内容判断
  /// * 条款确认
  ///
  /// ### 参数    |参数名|描述|是否必须|
  ///
  /// * context           上下文<Must>
  /// * title             信息标题<Must>
  /// * centerContent     是否居中显示，默认不居中。
  /// * onTapedRight      按钮点击事件响应。
  /// * onTapedLeft       排版，左边缩进的距离。
  /// * dark              是否强制指定夜间模式或者白天模式，不设置使用系统默认。
  ///
  static Future<T?> dilemma<T>(
    BuildContext context, {
    required String title,
    required String content,
    String rightButton = "OK",
    String leftButton = "CANCEL",
    bool centerContent = false,
    bool? dark,
    VoidCallback? onTapedRight,
    VoidCallback? onTapedLeft,
  }) {
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    Color _fontColor = _dark ? Colors.white : Colors.black;
    return showDialog<T>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: _dark ? Colors.black87 : Colors.white,
          // 对话框区域背景色
          elevation: 12.0,
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          // insetAnimationCurve: Curves.easeInOutQuad,
          // insetAnimationDuration: Duration(milliseconds: 5000),
          child: TernaryContainer(
              inDialog: true,
              header: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: _fontColor,
                        fontSize: 18.0,
                        shadows: kElevationToShadow[4]),
                  )),
              content: Container(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 20.0, left: 20.0, right: 10.0),
                child: Text(
                  content,
                  textAlign: centerContent ? TextAlign.center : TextAlign.left,
                  style: TextStyle(
                    color: _fontColor,
                  ),
                ),
              ),
              footer: Column(
                children: [
                  Divider(
                    color: Colors.grey,
                    height: 2,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: onTapedLeft,
                              child: Text(
                                leftButton,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 48,
                            child: const VerticalDivider(
                              color: Colors.grey,
                              width: 2,
                            )),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: onTapedRight,
                              child: Text(
                                rightButton,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10.0,),
                ],
              )),
        );
      },
    );
  }

  ///
  ///
  ///
  static Future<T?> dilemmaMaterial<T>(
    BuildContext context, {
    required String title,
    required String content,
    String rightButton = "ACCEPT",
    String leftButton = "CANCEL",
    bool centerContent = false,
    bool? dark,
    VoidCallback? onTapedRight,
    VoidCallback? onTapedLeft,
  }) {
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    Color _fontColor = _dark ? Colors.white : Colors.black;
    TextStyle getTextStyle(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return TextStyle(color: Color(0xFF6200EE));
      }
      return TextStyle(color: _fontColor);
    }

    return showDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: onTapedLeft,
              child: Text(leftButton),
              // style: ButtonStyle(
              //     textStyle: MaterialStateProperty.resolveWith((states) => getTextStyle(states)),
              //   backgroundColor: MaterialStateProperty.resolveWith((states) => getTextStyle(states).color),
              // ),
              // style: TextButton.styleFrom(primary: Color(0xff000f0f)),
            ),
            TextButton(
              onPressed: onTapedRight,
              child: Text(
                rightButton,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.orangeAccent),
              ),
              // style: ButtonStyle(
              //   textStyle: MaterialStateProperty.resolveWith((states) => getTextStyle(states)),
              // ),
            )
          ],
        );
      },
    );
  }

  ///
  /// 状态栏，表示成功，失败，奖励等状态的提示
  ///
  /// ### 用途
  /// * 成功/失败事件的显示，说明
  /// * 获取道具事件的说明
  /// * 仅表示一种状态的事件。
  ///
  /// ### 参数    |参数名|描述|是否必须|
  ///
  /// * context           上下文<Must>
  /// * status            表示状态的文字
  /// * statusIcon        表示状态相对于的图标
  /// * closeIcon         右上角关闭按钮的图标
  /// * description       描述文字，用于表示状态获取后的描述。
  ///
  static Future<T?> status<T>(
    BuildContext context, {
    required String status,
    required Widget statusIcon,
    IconData? closeIcon,
    String? description,
  }) {
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 12.0, left: 12.0, bottom: 12.0, right: 10.0),
                margin: EdgeInsets.only(right: 18.0, top: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      Color(0x9a03A9F4),
                      Color(0xFF651FFF),
                      Color(0x9a7C4DFF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                      child: statusIcon,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        status,
                        style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        description ?? "",
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  height: 24,
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: Icon(
                        closeIcon ?? Icons.close_rounded,
                        color: Colors.white,
                        size: 18.0,
                      ),
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}

///
///
/// TODO 用于传递参数，待设计
class DialogStyle {
  /// 对话框背景色
  Color? background;

  /// 对话框内文字颜色
  Color? textColor;

  /// 对话框内按钮颜色
  Color? buttonColor;
}
