import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  /// * context     上下文<Must>
  /// * title       信息标题<Must>
  /// * content     信息内容<Must>
  /// * buttonName  按钮文字
  /// * onPressed   按钮点击事件响应
  /// *
  ///
  static Future notice(
    BuildContext context, {
    required String title,
    required String content,
    String? buttonName,
    VoidCallback? onPressed,
    double indent = 28,
    bool? dark,
  }) {
    // 取宽，屏幕的60%用于对话框。
    double _width = MediaQuery.of(context).size.width * 72 / 100;
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    final GlobalKey _dialogGlobalKey = GlobalKey();
    return showDialog(
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
                padding: EdgeInsets.fromLTRB(indent, 13.0, 8.0, 8.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: _dark ? Colors.white : Colors.black87),
                ),
              ),
              SizedBox(
                width: _dialogGlobalKey.currentContext?.size?.width ?? _width,
                child: Divider(
                  height: 8,
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
                    buttonName ?? "Got it",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: onPressed ?? () {
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
}
