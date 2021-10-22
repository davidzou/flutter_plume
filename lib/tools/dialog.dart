import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/framework/container/ternary.dart';

class DialogProvider {
  static GlobalKey _dialogGlobalKey = GlobalKey();

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
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800),
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
  /// ### 参数
  ///
  /// |参数名|描述|是否必须|
  /// |:--|:--|:--|
  /// |context|上下文|<Must>|
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
    double _width = MediaQuery.of(context).size.width * 72 / 100;
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    return showDialog<T>(
      context: context,
      barrierColor: _dark ? Color(0xaa000000) : Color(0x88B2EbF2),
      builder: (BuildContext context) {
        return Dialog(
          key: _dialogGlobalKey,
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
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
                padding: EdgeInsets.fromLTRB(indent, 28.0, 8.0, 8.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: _dark ? Colors.white : Colors.black87),
                ),
              ),
              SizedBox(
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
                child: Divider(
                  height: 18,
                  thickness: 0.8,
                  indent: indent,
                  color: _dark ? Colors.white : Colors.black87,
                ),
              ),
              Container(
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
                padding: EdgeInsets.fromLTRB((indent + 8.0), 8.0, 8.0, 8.0),
                child: Text(
                  content,
                  style: TextStyle(color: _dark ? Colors.white : Colors.black87),
                ),
              ),
              Container(
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 8.0),
                child: TextButton(
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      fontSize: 16.0,
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
  Future<T?> noticeX<T>(
    BuildContext context, {
    required Widget title,
    required Widget content,
    Widget button = const ElevatedButton(
      child: Text("Got it"),
      onPressed: null,
    ),
    VoidCallback? onPressed,
    double indent = 28,
    bool? dark,
  }) {
    // 取宽，屏幕的60%用于对话框。
    double _width = MediaQuery.of(context).size.width * 72 / 100;
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          key: _dialogGlobalKey,
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
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
                padding: EdgeInsets.fromLTRB(indent, 28.0, 8.0, 8.0),
                child: title,
              ),
              SizedBox(
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
                child: Divider(
                  height: 18,
                  thickness: 0.8,
                  indent: indent,
                  color: _dark ? Colors.white : Colors.black87,
                ),
              ),
              Container(
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
                padding: EdgeInsets.fromLTRB((indent + 8.0), 8.0, 8.0, 8.0),
                child: content,
              ),
              Container(
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
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
  static Future dilemma(BuildContext context, {required String title, bool centerContent = false, VoidCallback? onTapedRight, VoidCallback? onTapedLeft}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          key: _dialogGlobalKey,
          // backgroundColor: Color(0xffe5e5e5),
          backgroundColor: Colors.white,
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
                    "请选择",
                    style: TextStyle(color: Colors.black, fontSize: 18.0, shadows: kElevationToShadow[4]),
                  )),
              content: Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 10.0),
                  child: Text("内容部分，你想展示些什么，或者你能选择什么，来拿出来！", textAlign: centerContent ? TextAlign.center : TextAlign.left,),),
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
                                "同 意",
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
                                "不同意",
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
}

class DialogStyle {
  /// 对话框背景色
  Color? background;

  /// 对话框内文字颜色
  Color? textColor;

  /// 对话框内按钮颜色
  Color? buttonColor;
}
