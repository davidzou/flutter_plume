import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plume/calendar/constant/constant.dart';
import 'package:plume/calendar/tools/date_math.dart';

///
/// 日历相关计算工具。
///
/// ```
///   Calendar().getPage().map((e) => Center(child: e)).toList();
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
  List<Widget> getPage(BuildContext context, InnerCalendar innerCalendar, {int year, int month}) {
    /// 要显示哪年？
    int _year = year ?? DateTime.now().year;
    /// 要显示哪个月？
    int _month = month ?? DateTime.now().month;
    /// 一共要有多少个Widget，即天
    int _days = DateMath().getDaysOfMonth(_month, year: _year);
    print("year:$_year   month:$_month");
    int offset = DateTime(_year, _month, 1).weekday;
    return _getScope(context, innerCalendar, _year, _month, _days, offset);
  }

  ///
  /// 计算区域
  ///
  /// * days    每个月的天数
  /// * offset   偏移量
  ///
  List<Widget> _getScope(BuildContext context, InnerCalendar innerCalendar, int year, int month, int days, int offset) {
    print("days:$days  offset:$offset");

    //
    // 排序方式
    // * 0  -- 日  一  二  三  四  五  六
    // * 1  -- 一  二  三  四  五  六  日
    //
    int _tuning = 0;
    assert(_tuning == 0 || _tuning == 1);

    List<String> _tuningTitle;
    if (_tuning == 0) {
      _tuningTitle = BIBLE_WEEK_TITLE;
    } else {
      _tuningTitle = CHINA_WEEK_TITLE;
    }
    assert(_tuningTitle.length == 7);

    List<Widget> children = <Widget>[];
    bool spec = (offset - _tuning) % 7 != 0;

    int _num = days + (spec ? (offset - _tuning) : 0);
    for (int i = 0; i < _num; i++) {
      if (i < (offset - _tuning) && spec) {
        /// FIXME 前要保留上个月的结束，后要保留下个月的开始
        /// 填空位
        children.add(Text(""));
      } else {
        if (!spec) {
          children.add(Text("${(i + 1)}"));
        } else {
          int day = (i + 1) - (offset - _tuning);
          // children.add(Text("$day"));
          children.add(
              innerCalendar?.buildDayChild(context, year, month, day) ??
                  Text("$day"));
        }
      }
    }
    // 头部标题，标记星期几，具体展现方式见实现
    children.insertAll(0, _tuningTitle.map((e) => Text(e)));
    return children;
  }

}

///
/// 周表
///
class WeekDayClip {
  WeekDayClip(this.dayOfWeek);
  final int dayOfWeek;

  @override
  String toString() {
    return 'WeekDayClip{dayOfWeek: $dayOfWeek}';
  }

}

///
/// 日历碎片，每个日历所在的
///
class DayClip {
  DayClip(this.day);

  final int day;

  @override
  String toString() {
    return 'DayModel{day: $day}';
  }
}


/// 可扩展日历设置。
///
/// ```
/// class CalendarPage extends StatelessWidget with ExCalendar {
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       appBar: AppBar(
///         title: Text("日历"),
///       ),
///       body: CalendarWidget(
///         extra: this,
///       ),
///     );
///   }
/// }
///
/// class ExCalendar implements InnerCalendarMiXin {
///   @override
///   Widget buildDayChild(BuildContext context, int year, int month, int day) {
///     return InkWell(child: Text("$day"), onTap: () {
///       print(day);
///     },);
///   }
/// }
/// ```
abstract class InnerCalendar {
  /// 构建每一个日期子类布局，其中用于显示日期，和点击效果？。
  external Widget buildDayChild(
      BuildContext context, int year, int month, int day);
}

/// 默认
mixin InnerCalendarMiXin on InnerCalendar {
  @override
  Widget buildDayChild(BuildContext context, int year, int month, int day) {
    // 只是日期的显示。
    return Text("$day");
  }
}

// /// 自定义扩展
// class ExCalendar implements InnerCalendarMiXin {
//   @override
//   Widget buildDayChild(BuildContext context, int year, int month, int day) {
//     return InkWell(
//       child: Text("$day"),
//       onTap: () {
//         // 找数据，并显示。数据本地化存储
//         print(day);
//       },
//     );
//   }
// }