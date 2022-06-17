import 'package:flutter/material.dart';
import 'package:plume/widget/block.dart';

// 所有和颜色相关的Widget自定义实现

///
/// 颜色值
///
/// 标识颜色
/// ```
/// +---------------+
/// | ▪ 0xff000000  |
/// +---------------+
/// ```
///
class ColorValueWidget extends StatelessWidget {
  ColorValueWidget({this.color = Colors.black});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Block(
            width: 10,
            height: 10,
            color: color,
          ),
          SizedBox(
            width: 5,
          ),
          Text(color.value.toRadixString(16)),
        ],
      ),
    );
  }
}

///
/// 颜色选择下拉列表
///
/// ```
/// +-------------------------------------+
/// |  Label              ▪ 0xffffffff 🔽 ｜
/// +-------------------------------------+
/// ```
///
class ColorSelector extends StatefulWidget {
  ColorSelector({
    required this.label,
    this.labelStyle,
    required this.colors,
    this.onChanged,
  });

  /// 标题
  final String label;
  final TextStyle? labelStyle;
  final List<Color> colors;
  final ValueChanged<Color>? onChanged;

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  /// 标签
  late String _label;

  /// 标签样式
  late TextStyle _labelStyle;

  /// 当前选中颜色（默认取列表中的第一个）
  late Color _color;

  @override
  void initState() {
    super.initState();
    _label = widget.label;
    _labelStyle = widget.labelStyle ?? TextStyle();
    _color = widget.colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _label,
            style: _labelStyle,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton<Color>(
              value: _color,
              items: widget.colors
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: ColorValueWidget(
                        color: e,
                      )))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _color = value!;
                });
                widget.onChanged!.call(_color);
              },
            ),
          ),
        ],
      ),
    );
  }
}
