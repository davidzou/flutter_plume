// 所有Picker标准化控件

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// 标准化文字滚动Picker
///
/// <code>
/// CupertinoPickerX(
///   items: ["时间", "长度", "面积", "体积", "质量", "人民币"],
///   onSelectedItemChanged: (index) {
///     _indexChangedValueNotifier.value = index;
///   },
/// )
/// </code>
///
/// ### 参数
/// |参数名|描述|是否必须|
/// |:--|:--|:--|
/// |onSelectedItemChanged|item改变回调函数|否|
/// |items|选择项|是|
/// |color|字体颜色|否，默认主题色|
/// |fontSize|字体大小|否，默认14.0|
///
class CupertinoPickerX extends StatelessWidget {
  CupertinoPickerX({
    Key? key,
    this.onSelectedItemChanged,
    required this.items,
    this.color,
    this.fontSize = 14.0,
  }) : super(key: key);

  final ValueChanged<int>? onSelectedItemChanged;
  final List<String> items;
  final Color? color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      children: items
          .map((e) => Text(
                e,
                style: TextStyle(color: Theme.of(context).copyWith(primaryColor: color).primaryColor.withOpacity(0.6), fontSize: fontSize),
              ))
          .toList(),
      onSelectedItemChanged: onSelectedItemChanged,
      diameterRatio: 0.6,
      itemExtent: (fontSize * 1.5),
      looping: true,
      magnification: 1.5,
      squeeze: 0.6,
      selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
        background: Colors.transparent,
      ),
    );
  }
}
