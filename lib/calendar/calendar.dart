import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:plume/calendar/constant/constant.dart';
import 'package:plume/calendar/tools/date_math.dart';

/// 当被点击事件触发
typedef  OnClickedDayClip = Function(List<int> multi, DayClipModel dayClipModel);

///
/// 日历相关计算工具。
///
/// ### 获取日历中的每一个日碎片
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
  /// 按月排版显示
  ///
  /// * data                    已有数据，日历相关联的数据模型。
  /// * dayClipDelegate         日历中的日期模块构建代理
  /// * weekDayClipDelegate     日历中的周标题模块构建代理
  /// * year                    所要构建的日历的年份
  /// * month                   所要构建的日历的月份
  /// * tuning                  排序方式
  ///                           0  -- 日  一  二  三  四  五  六     周日为第一位
  ///                           1  -- 一  二  三  四  五  六  日     周一为第一位
  ///
  ///
  List<CalendarClip> getPage({List<DayClipModel> data = const [], DayClipDelegate dayClipDelegate, WeekDayClipDelegate weekDayClipDelegate, int year, int month, int tuning = 0}) {
    /// 要显示哪年？
    int _year = year ?? DateTime.now().year;
    /// 要显示哪个月？
    int _month = month ?? DateTime.now().month;
    /// 根据年月获取一个月的天数。
    int _days = DateMath().getDaysOfMonth(_month, year: _year);
    /// 计算当月的第一天是周几。即在列表中的偏移位置。
    int offset = DateTime(_year, _month, 1).weekday;
    print("year:$_year   month:$_month");
    return _getScope(dayClipDelegate, weekDayClipDelegate, data, _year, _month, _days, offset, tuning);
  }

  ///
  /// 计算区域
  ///
  /// * days    每个月的天数
  /// * offset   偏移量
  ///
  List<CalendarClip> _getScope(DayClipDelegate dayClipDelegate, WeekDayClipDelegate weekDayClipDelegate, List<DayClipModel> data, int year, int month, int days, int offset, int tuning) {
    print("days:$days  offset:$offset");

    //
    // 排序方式
    // * 0  -- 日  一  二  三  四  五  六
    // * 1  -- 一  二  三  四  五  六  日
    //
    int _tuning = tuning;
    assert(_tuning == 0 || _tuning == 1);

    List<int> _tuningTitle;
    if (_tuning == 0) {
      _tuningTitle = BIBLE_WEEK_TITLE;
    } else {
      _tuningTitle = CHINA_WEEK_TITLE;
    }
    assert(_tuningTitle.length == 7);

    // 每个DayClip的数据
    List<CalendarClip> dayClips = <CalendarClip>[];
    // 如果开头就是7天的偏移，那么就不需要补充。
    bool spec = (offset - _tuning) % 7 != 0;
    // 总量（包含了前面的补空，后面不算）
    int _num = days + (spec ? (offset - _tuning) : 0);
    for (int i = 0; i < _num; i++) {
      if (i < (offset - _tuning) && spec) {
        /// FIXME 前要保留上个月的结束，后要保留下个月的开始
        // 填空位
        dayClips.add(DayClip(DayClipModel(year, month, -1), delegate: dayClipDelegate));
      } else {
        // 每天
        if (!spec) {
          // 寻找给定的数据列表中是否有匹配的数据模型，有则返回，无则返回一个日期数据模型，数据内容为空。
          DayClipModel _dayClipModel = data?.firstWhere((element) => (element.year == year && element.month == month && element.day == i + 1), orElse: () => DayClipModel(year, month, i + 1));
          // print("spc $_dayClipModel");
          dayClips.add(DayClip(_dayClipModel, delegate: dayClipDelegate));
        } else {
          int _day = (i + 1) - (offset - _tuning);
          DayClipModel _dayClipModel = data?.firstWhere((element) => (element.year == year && element.month == month && element.day == _day), orElse: () => DayClipModel(year, month, _day));

          // print("ddd $_dayClipModel");
          dayClips.add(DayClip(_dayClipModel, delegate: dayClipDelegate));
        }
      }
    }
    // 头部标题，标记星期几，具体展现方式见实现
    dayClips.insertAll(0, _tuningTitle.map((e) => WeekDayClip(e, delegate: weekDayClipDelegate)));
    return dayClips;
  }

}

///
/// 周表
///
class WeekDayClip extends CalendarClip {
  WeekDayClip(this.dayOfWeek, {this.delegate});

  final int dayOfWeek;
  final WeekDayClipDelegate delegate;

  getData() => dayOfWeek;

  @override
  Widget build(BuildContext context, {OnClickedDayClip onClickedDayClip}) {
    if(delegate != null) {
      return delegate.buildWeekDay(context, dayOfWeek);
    }
    return SimpleWeekDayClipDelegate().buildWeekDay(context, dayOfWeek);
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
  ///
  /// * dayClipModel      数据模型
  /// * delegate          代理
  ///
  DayClip(this.dayClipModel, {this.delegate});

  final DayClipModel dayClipModel;
  final DayClipDelegate delegate;

  // getData() {
  //   return innerCalendar != null ? innerCalendar.getData(
  //       dayClipModel.year, dayClipModel.month, dayClipModel.day) : dayClipModel.data;
  // }

  @override
  Widget build(BuildContext context, {OnClickedDayClip onClickedDayClip}) {
    return dayClipModel?.day == -1 ? Text("") : (delegate != null
        ? delegate.buildDayClip(context, dayClipModel, onClickedDayClip)
        : SimpleDayClipDelegate().buildDayClip(context, dayClipModel, onClickedDayClip));
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
  // getData();

  Widget build(BuildContext context, {OnClickedDayClip onClickedDayClip});
}

/// 日期数据模型
class DayClipModel {

  factory DayClipModel.now({DayClipData data}) {
    DateTime _now = DateTime.now();
    return DayClipModel(_now.year, _now.month, _now.day, data: data);
  }

  DayClipModel(this.year, this.month, this.day, {this.data});
  /// 每日数据
  final DayClipData data;

  final int year;
  final int month;
  final int day;

  @override
  String toString() {
    return 'DayClipModel{year: $year, month: $month, day: $day}';
  }
}

///
/// 数据模块
/// * 可以是每日的任务扩展
/// * 可以是打卡数据
/// * 可以是自定义的数据
///
abstract class DayClipData {
  /// 是否是节日(无论东方，西方，国际国内，法定或者纪念日等）
  external bool isFestival();
  /// 是否打卡
  external bool isPunch();
}

///  String数据类型，一般用于数据测试，简单数据。
class DayClipStringData extends DayClipData {
  DayClipStringData(this.data);
  final String data;

  bool isPunch() {
    return true;
  }

  @override
  String toString() {
    return 'DayClipStringData{data: $data}';
  }
}

/// 可扩展日历设置。
///
/// ```
/// // 创建自定义日历页
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
/// // 自定义扩展
/// class ExCalendar implements DayClipDelegateMiXin {
///   @override
///   Widget buildDayClip(DayClipModel dayClipModel) {
///     return InkWell(
///       child: Text("${dayClipModel.day}"),
///       onTap: () {
///         print(day);
///       },
///     );
///   }
/// }
/// ```
abstract class DayClipDelegate {
  /// 构建每一个日期子类布局，其中用于显示日期，和点击效果？。
  external Widget buildDayClip(BuildContext context, DayClipModel dayClipModel, OnClickedDayClip onSelectedDayClip);
}

/// 默认
mixin DayClipDelegateMiXin on DayClipDelegate {
  @override
  Widget buildDayClip(BuildContext context, DayClipModel dayClipModel, OnClickedDayClip onSelectedDayClip);
}

///
/// 简单实现
/// 今天被单独标出
///
class SimpleDayClipDelegate implements DayClipDelegateMiXin {
  Widget buildDayClip(BuildContext context, DayClipModel dayClipModel, OnClickedDayClip onSelectedDayClip)  {
    // 判断是否为今天
    bool _isToday = dayClipModel?.day == DateTime.now().day && dayClipModel?.month == DateTime.now().month && dayClipModel?.year == DateTime.now().year;
    /// 默认显示
    return InkWell(
      onTap: () {
        onSelectedDayClip?.call([dayClipModel?.day], dayClipModel);
      },
      child: Container(
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: _isToday ? Colors.orangeAccent : Colors.transparent,
              ),
              _isToday ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${dayClipModel?.day}", style: TextStyle(color: Colors.white),),
                  Text("今天", style: TextStyle(color: Colors.greenAccent, fontSize: 8.0),),
                ],
              ) : Text("${dayClipModel?.day}"),
            ],
          ),
      ),
    );
  }
}

abstract class WeekDayClipDelegate {
  ///
  /// 构建日期Title
  /// * dayOfWeek   周几，一周的第几天
  ///
  external Widget buildWeekDay(BuildContext context, int dayOfWeek);
}

mixin WeekDayClipDelegateMiXin on WeekDayClipDelegate {
  @override
  Widget buildWeekDay(BuildContext context, int dayOfWeek);
}

/// 一般简单实现，中文标题
class SimpleWeekDayClipDelegate implements WeekDayClipDelegateMiXin {
  @override
  Widget buildWeekDay(BuildContext context, int dayOfWeek){
    String _name = "";
    TextStyle _style = TextStyle(color: Colors.black);
    /// 构建每个返回显示的
     switch (dayOfWeek) {
      case DateTime.monday:     _name = "一"; break;
      case DateTime.tuesday:    _name = "二"; break;
      case DateTime.wednesday:  _name = "三"; break;
      case DateTime.thursday:   _name = "四"; break;
      case DateTime.friday:     _name = "五"; break;
      case DateTime.saturday:   _name = "六"; break;
      case DateTime.sunday:     _name = "日"; _style = TextStyle(color: Colors.orangeAccent); break;
    }
    return Text(_name, style: _style,);
  }
}

///
/// 星期一 Mon.（全称Monday）
/// 星期二 Tues.（全称Tuesday)
/// 星期三 Wed.（全称Wednesday）
/// 星期四 Thur.（全称Thursday）
/// 星期五 Fri.（全称Friday）
/// 星期六 Sat.（全程Saturday）
/// 星期日 Sun.（全称Sunday）
///
class EnglishWeekDayClipDelegate implements WeekDayClipDelegateMiXin {
  @override
  Widget buildWeekDay(BuildContext context, int dayOfWeek){
    String _name = "";
    TextStyle _style = TextStyle(color: Colors.black);
    /// 构建每个返回显示的
    switch (dayOfWeek) {
      case DateTime.monday:     _name = "Mon"; break;
      case DateTime.tuesday:    _name = "Tues"; break;
      case DateTime.wednesday:  _name = "Wed"; break;
      case DateTime.thursday:   _name = "Thur"; break;
      case DateTime.friday:     _name = "Fri"; break;
      case DateTime.saturday:   _name = "Sat"; break;
      case DateTime.sunday:     _name = "Sun"; _style = TextStyle(color: Colors.orangeAccent); break;
    }
    return Text(_name, style: _style,);
  }
}