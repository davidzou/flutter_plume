import 'package:flutter/widgets.dart';

///
/// 日历相关计算工具。
///
/// ```
///   getPage().map((e) => Center(child: e)).toList();
/// ```
///
/// ```
///    1  2  3  4  5  6  7
///    8  9 10 11 12 13 14
///   15 16 17 18 19 20 21
///   22 23 24 25 26 27 28
///   29 30 31
/// ```
///
class Calendar {
  ///
  /// 计算显示区域。
  ///
  /// 月
  ///
  List<Widget> getPage({int year, int month}) {
    /// 要显示哪年？
    int _year = year ?? DateTime.now().year;

    /// 要显示哪个月？
    int _month = month ?? DateTime.now().month;

    /// 一共要有多少个Widget，即天
    int _days = getMonthDays(_month);
    print("year:$_year   month:$_month");
    int offset = DateTime(_year, _month, 1).weekday;
    return _getScope(_days, offset);
  }

  ///
  /// 计算区域
  ///
  /// * days    每个月的天数
  /// * offset   偏移量
  ///
  List<Widget> _getScope(int days, int offset) {
    print("days:$days  offset:$offset");
    List<Widget> children = <Widget>[];
    bool spec = (offset - 1) % 7 != 0;

    int _num = days + (spec ? (offset - 1) : 0);
    for (int i = 0; i < _num; i++) {
      if (i < (offset - 1) && spec) {
        children.add(Text(""));
      } else {
        if (!spec) {
          children.add(Text("${(i + 1)}"));
        } else {
          children.add(Text("${(i + 1) - (offset - 1)}"));
        }
      }
    }
    return children;
  }

  ///
  /// 获得每个月的天数，闰月也就是2月通过年获取
  ///
  /// * year  要获取的那一年的，用于计算
  ///
  getMonthDays(int month, {int year}) {
    assert(month < 12 && month > 0);
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      case 4:
      case 6:
      case 9:
      case 11:
        return 30;
      case 2:
        if (((year ?? DateTime.now().year) - 2000) % 4 == 0) {
          return 29;
        }
        return 28;
    }
  }

}

abstract class DayClip {
  Widget build(BuildContext context);
}

mixin DayClipMixin on DayClip {

}