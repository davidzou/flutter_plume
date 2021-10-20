import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/tools/dialog.dart';

class DialogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () {
              DialogProvider.show(context, title: "信息", message: "        \"一鼓作气，再而衰，三而竭\"。");
            },
            icon: Icon(Icons.wb_incandescent_outlined),
            label: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("简单提示显示信息，一个按钮"),
                Text(
                  "描述",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
                )
              ],
            ),
          ),
          /// Notice白天
          TextButton.icon(
            onPressed: () {
              DialogProvider.notice(
                context,
                title: "信息",
                content: "中国国家統計局が18日発表した2021年7～9月期の国内総生産（GDP）は、物価変動の影響を除いた実質で前年同期比4・9％増となった。6四半期連続のプラス成長だが、4～6月期（7・9％増）から大きく減速した。前期比でも0・2％増（4～6月期は1・2％増）と低調だった。",
                indent: 28,
                dark: false,
              );
            },
            icon: Icon(Icons.message_outlined),
            label: Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notice弹窗白天模式(通知或者告知类的信息)", maxLines: 1,),
                  Text("标题加内容，以及一个知道了按钮事件。有白天和黑夜两种模式。知道了按钮可以关闭弹窗，也可以点击空白区域关闭弹窗。", maxLines: 2, style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),),
                ],
              ),
            ),
          ),
          /// Notice黑夜
          TextButton.icon(
            onPressed: () {
              DialogProvider.notice(
                context,
                title: "信息",
                content: "中国国家統計局が18日発表した2021年7～9月期の国内総生産（GDP）は、物価変動の影響を除いた実質で前年同期比4・9％増となった。6四半期連続のプラス成長だが、4～6月期（7・9％増）から大きく減速した。前期比でも0・2％増（4～6月期は1・2％増）と低調だった。",
                indent: 28,
                dark: true,
              );
            },
            icon: Icon(Icons.message_outlined),
            label: Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Notice弹窗黑夜模式(通知或者告知类的信息)", maxLines: 1,),
                  Text("标题加内容，以及一个知道了按钮事件。有白天和黑夜两种模式。知道了按钮可以关闭弹窗，也可以点击空白区域关闭弹窗。", maxLines: 2, style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
