import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//
// 所有的标签类控件。
//
//

/// 数字选择器
class NumberSelector extends StatefulWidget {
  NumberSelector({
    this.leading = const Text(""),
    this.trailing,
    this.start,
    this.end,
    this.array,
    this.value,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.onChanged,
  }) : assert((start != null || end != null) || array != null);

  final Widget leading;
  final Widget? trailing;

  /// 数字选择器起始数字
  final int? start;

  /// 数字选择器终止数字
  final int? end;

  /// 默认值, 初始化值，当前那个值被选中。
  final int? value;

  /// 给定数组
  final List<int>? array;

  final Function(int? value)? onChanged;

  final MainAxisAlignment mainAxisAlignment;

  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  late List<int> _array;
  int? _value;

  @override
  void initState() {
    super.initState();
    if (widget.array != null) {
      _array = widget.array!;
    } else {
      _array = <int>[];
      for (int i = widget.start!; i < widget.end!; i++) {
        _array.add(i);
      }
    }
    _value = widget.value ?? _array[0];
    assert(_array.contains(_value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 16.0),
            child: widget.leading,
          ),
          DropdownButton<int>(
            value: _value,
            items: _array
                .map((e) => DropdownMenuItem<int>(value: e, child: Text("$e")))
                .toList(),
            onChanged: (value) {
              _value = value;
              setState(() {});
              widget.onChanged?.call(_value);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 5.0),
            child: widget.trailing ?? Text(""),
          ),
        ],
      ),
    );
  }
}
