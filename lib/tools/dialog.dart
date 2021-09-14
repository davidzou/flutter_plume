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
  static Future<bool?> show(BuildContext context, {required String title, required String message, }) {
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
                  Icons.warning,
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
                  Navigator.pop(context, true);
                },
                child: Text("没问题，一鼓作气！"),
              ),
            ],
          );
        });
  }

}
