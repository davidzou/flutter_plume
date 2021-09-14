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
        ],
      ),
    );
  }
}
