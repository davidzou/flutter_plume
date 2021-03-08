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
  List<CalendarClip> getPage(BuildContext context, InnerCalendar innerCalendar,
      {List<DayClipModel> data, int year, int month,}) {
    /// 要显示哪年？
    int _year = year ?? DateTime
        .now()
        .year;

    /// 要显示哪个月？
    int _month = month ?? DateTime
        .now()
        .month;

    /// 一共要有多少个Widget，即天
    int _days = DateMath().getDaysOfMonth(_month, year: _year);
    print("year:$_year   month:$_month");
    int offset = DateTime(_year, _month, 1).weekday;


    return _getScope(
        context,
        innerCalendar,
        data,
        _year,
        _month,
        _days,
        offset);
  }

  ///
  /// 计算区域
  ///
  /// * days    每个月的天数
  /// * offset   偏移量
  ///
  List<CalendarClip> _getScope(BuildContext context,
      InnerCalendar innerCalendar, List<DayClipModel> data, int year, int month,
      int days, int offset,) {
    print("days:$days  offset:$offset");

    //
    // 排序方式
    // * 0  -- 日  一  二  三  四  五  六
    // * 1  -- 一  二  三  四  五  六  日
    //
    int _tuning = 0;
    assert(_tuning == 0 || _tuning == 1);

    List<int> _tuningTitle;
    if (_tuning == 0) {
      _tuningTitle = BIBLE_WEEK_TITLE;
    } else {
      _tuningTitle = CHINA_WEEK_TITLE;
    }
    assert(_tuningTitle.length == 7);

    // 每个DayClip的数据
    // List<Widget> children = <Widget>[];
    //
    List<CalendarClip> dayClips = <CalendarClip>[];
    // 如果开头就是7天的偏移，那么就不需要补充。
    bool spec = (offset - _tuning) % 7 != 0;
    // 总量（包含了前面的补空，后面不算）
    int _num = days + (spec ? (offset - _tuning) : 0);
    for (int i = 0; i < _num; i++) {
      if (i < (offset - _tuning) && spec) {
        /// FIXME 前要保留上个月的结束，后要保留下个月的开始
        // 填空位
        dayClips.add(DayClip(DayClipModel(year: year, month: month, day: -1),
            innerCalendar: innerCalendar));
      } else {
        // 每天
        if (!spec) {
          DayClipModel _dayClipModel = data?.firstWhere((
              DayClipModel element) =>
          (element.year == year && element.month == month &&
              element.day == i + 1));
          print(_dayClipModel);
          dayClips.add(DayClip(_dayClipModel, innerCalendar: innerCalendar));
        } else {
          int _day = (i + 1) - (offset - _tuning);
          DayClipModel _dayClipModel = data.firstWhere((DayClipModel element) =>
          (element.year == year && element.month == month && element.day == _day));

          print(_dayClipModel);
          dayClips.add(DayClip(_dayClipModel, innerCalendar: innerCalendar));
        }
      }
    }
    // 头部标题，标记星期几，具体展现方式见实现
    dayClips.insertAll(0, _tuningTitle.map((e) => WeekDayClip(e)));
    return dayClips;
  }

}

///
/// 周表
///
class WeekDayClip extends CalendarClip {
  WeekDayClip(this.dayOfWeek);

  final int dayOfWeek;

  getData() => dayOfWeek;

  Widget build() {
    switch (dayOfWeek) {
      case DateTime.monday:
        return Text("一");
      case DateTime.tuesday:
        return Text("二");
      case DateTime.wednesday:
        return Text("三");
      case DateTime.thursday:
        return Text("四");
      case DateTime.friday:
        return Text("五");
      case DateTime.saturday:
        return Text("六");
      case DateTime.sunday:
        return Text("日", style: TextStyle(color: Colors.orange),);
    }
  }

  @override
  String toString() {
    return 'WeekDayClip{dayOfWeek: $dayOfWeek}';
  }
}

///
/// 日
///
class DayClip extends CalendarClip {
  // DayClip(this._year, this.month, this.day, {this.innerCalendar});
  DayClip(this.dayClipModel, {this.innerCalendar});

  // final int _year;
  // final int month;
  // ///
  // /// 每日，-1为空
  // ///
  // final int day;
  final DayClipModel dayClipModel;
  final InnerCalendar innerCalendar;

  getData() {
    return innerCalendar != null ? innerCalendar.getData(
        dayClipModel.year, dayClipModel.month, dayClipModel.day) : null;
  }

  Widget build() {
    return dayClipModel.day == -1 ? Text("") : (innerCalendar != null
        ? innerCalendar.buildDayClip(dayClipModel)
        : Text("${dayClipModel.day}"));
  }

  @override
  String toString() {
    return 'DayClip{$dayClipModel}';
  }

}

///
/// 日历碎片，每个日历所在的
///
/// 作用：
///   * 展示标题用
///   * 展示日期用
///
abstract class CalendarClip {
  getData();

  Widget build();
}

class DayClipModel {
  DayClipModel({this.data, this.year, this.month, this.day});

  final dynamic data;

  final int year;
  final int month;
  final int day;

  @override
  String toString() {
    return 'DayClipModel{year: $year, month: $month, day: $day}';
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

  /// 获取数据
  external DayClipModel getData(int year, int month, int day);

  /// 构建每一个日期子类布局，其中用于显示日期，和点击效果？。
  @deprecated
  external Widget buildDayChild(int year, int month, int day);

  external Widget buildDayClip(DayClipModel dayClipModel);
}

/// 默认
mixin InnerCalendarMiXin on InnerCalendar {

  @override
  @deprecated
  Widget buildDayChild(int year, int month, int day) {
    // 只是日期的显示。
    return Text("$day");
  }

  Widget buildDayClip(DayClipModel dayClipModel) {
    return Text("${dayClipModel.day}");
  }
}