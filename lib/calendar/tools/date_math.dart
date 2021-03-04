///
/// 日期计算相关方法
///
class DateMath {
  ///
  /// 获得每个月的天数，闰月也就是2月通过年获取
  ///
  /// * year  要获取的那一年的，用于计算
  ///
  int getMonthDays(int month, {int year}) {
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
        return getLeapYearMothDays( year: year);
      default: throw Exception("Unknown Exception, Month: $month");
    }
  }

  ///
  /// 获取闰年月的天数
  ///
  int getLeapYearMothDays({int year}) {
    if (isLeapYear(year: year)) {
      return 29;
    }
    return 28;
  }

  ///
  /// 是否为闰年
  /// <p>
  ///
  /// ### 参数
  /// * year    传入年份，计算，否则计算当年。
  ///
  bool isLeapYear({int year}) {
    return ((year ?? DateTime.now().year) - 2000).abs() % 4 == 0;
  }

}