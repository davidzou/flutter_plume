import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


///
/// 用于显示年的控件。
///
/// ```
///   |&lt;  &lt;  2000年 1月  &gt; &gt;|
/// ```
///
/// * 一般用于日历控件顶部
///
class YearsMonthWidget extends StatefulWidget {
  YearsMonthWidget({
    @required this.onYearChanged,
    @required this.onMonthChanged,
    this.initByYear,
    this.initByMonth,
    this.suffixByYear = " 年",
    this.suffixByMonth = " 月",
    this.minYear = 1970,
    this.maxYear = 2030,
    this.style = const TextStyle(fontSize: 18.0),
  }) : assert(onYearChanged != null);

  /// 监听变更
  final ValueChanged<int> onYearChanged;
  final ValueChanged<int> onMonthChanged;

  /// 初始值
  final int initByYear;
  final int initByMonth;
  /// 最小值
  final int minYear;
  /// 最大值
  final int maxYear;

  /// 后缀，就是显示在年后面的内容
  final String suffixByYear;
  final String suffixByMonth;

  /// 字体样式
  final TextStyle style;

  @override
  _YearsMonthWidgetState createState() => _YearsMonthWidgetState();
}

class _YearsMonthWidgetState extends State<YearsMonthWidget> {
  int _year;
  int _month;

  ValueNotifier<int> _yearNotifier;
  ValueNotifier<int> _monthNotifier;

  @override
  void initState() {
    super.initState();
    _year = widget.initByYear ?? DateTime.now().year;
    _month = widget.initByMonth ?? DateTime.now().month;
    _yearNotifier = ValueNotifier(_year);
    _monthNotifier = ValueNotifier(_month);
  }

  @override
  void dispose() {
    _yearNotifier.dispose();
    _monthNotifier.dispose();
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
          child: Icon(Icons.first_page),
          onTap: () {
            if(_yearNotifier.value > widget.minYear) {
              _yearNotifier.value -= 1;
              widget.onYearChanged.call(_yearNotifier.value);
            }
          },
        ),
        InkWell(
          child: Icon(Icons.chevron_left),
          onTap: () {
            if(_monthNotifier.value > 1) {
              _monthNotifier.value -= 1;
              widget.onMonthChanged.call(_monthNotifier.value);
            } else {
              if(_yearNotifier.value > widget.minYear) {
                _monthNotifier.value = 12;
                _yearNotifier.value -= 1;
                widget.onYearChanged.call(_yearNotifier.value);
                widget.onMonthChanged.call(_monthNotifier.value);
              }
            }
          },
        ),
        // 年
        ValueListenableBuilder(
          valueListenable: _yearNotifier,
          builder: (BuildContext context, int value, Widget child) {
            return Text(
              "$value${widget.suffixByYear}",
              style: widget.style,
            );
          },
        ),
        // 月
        ValueListenableBuilder(
          valueListenable: _monthNotifier,
          builder: (BuildContext context, int value, Widget child) {
            return Text(
              "$value${widget.suffixByMonth}",
              style: widget.style,
            );
          },
        ),
        InkWell(
          child: Icon(Icons.chevron_right),
          onTap: () {
            if(_monthNotifier.value < 12) {
              _monthNotifier.value += 1;
              widget.onMonthChanged.call(_monthNotifier.value);
            } else {
              if(_yearNotifier.value < widget.maxYear) {
                _monthNotifier.value = 1;
                _yearNotifier.value += 1;
                widget.onMonthChanged.call(_monthNotifier.value);
                widget.onYearChanged.call(_yearNotifier.value);
              }
            }
          },
        ),
        InkWell(
          child: Icon(Icons.last_page),
          onTap: () {
            if(_yearNotifier.value < widget.maxYear) {
              _yearNotifier.value += 1;
              widget.onYearChanged.call(_yearNotifier.value);
            }
          },
        ),
      ],
    );
  }
}


///
/// 用于显示年的控件。
///
/// ```
/// &lt; 2000年 &gt;
/// ```
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
