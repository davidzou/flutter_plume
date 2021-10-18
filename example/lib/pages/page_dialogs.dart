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
          TextButton.icon(
            onPressed: () {
              DialogProvider.notice(context, title: "信息", content: "北朝鮮では重罪とされる金（ゴールド）の密輸。昨年、両江道（リャンガンド）の恵山（ヘサン）では、58キロもの金の密輸事件が摘発され、密輸業者、国境警備隊の副小隊長、中隊の保衛指導員ら7人が逮捕された。"
                  "ドラマ『推しの王子様』（フジテレビ系／毎週木曜22時）の公式インスタグラムが21日、主演を務める比嘉愛未と渡邊圭祐の2ショットを公開。第1話終盤で二人が出会う「始まりのシーン」のオフショットが、まるでお笑いコンビのようだと反響を呼んでいる。",
              indent: 28, dark: false,);
            },
            icon: Icon(Icons.call),
            label: Text("自定义弹窗"),
          ),
        ],
      ),
    );
  }
}
