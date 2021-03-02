import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// 用于显示年的控件。
///
/// * 一般用于日历控件顶部
///
class YearsWidget extends StatefulWidget {
  YearsWidget({
    @required this.onChanged,
    this.init,
    this.suffix = " 年",
    this.style = const TextStyle(fontSize: 18.0),
  }) : assert(onChanged != null);

  /// 监听变更
  final ValueChanged<int> onChanged;

  /// 初始值
  final int init;

  /// 后缀，就是显示在年后面的内容
  final String suffix;

  /// 字体样式
  final TextStyle style;

  @override
  _YearsWidgetState createState() => _YearsWidgetState();
}

class _YearsWidgetState extends State<YearsWidget> {
  int _years;

  ValueNotifier<int> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _years = widget.init ?? DateTime.now().year;
    _valueNotifier = ValueNotifier(_years);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Icon(Icons.keyboard_arrow_left),
          onTap: () {
            _valueNotifier.value -= 1;
            widget.onChanged.call(_valueNotifier.value);
          },
        ),
        ValueListenableBuilder(
          valueListenable: _valueNotifier,
          builder: (BuildContext context, int value, Widget child) {
            return Text(
              "$value${widget.suffix}",
              style: widget.style,
            );
          },
        ),
        InkWell(
          child: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            _valueNotifier.value += 1;
            widget.onChanged.call(_valueNotifier.value);
          },
        ),
      ],
    );
  }
}
