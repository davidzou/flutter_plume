///
/// 日期计算相关方法
///
class DateMath {
  ///
  /// 获得每个月的天数，闰月也就是2月通过年获取
  ///
  /// * year  要获取的那一年的，用于计算
  ///
  int getDaysOfMonth(int month, {int? year}) {
    assert(month <= 12 && month > 0);
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
        return _getDaysOfFebruary( year: year);
      default: throw Exception("Unknown Exception, Month: $month");
    }
  }

  ///
  /// 获取闰年月的天数
  ///
  int _getDaysOfFebruary({int? year}) {
    if (isLeapYear(year: year)) {
      return 29;
    }
    return 28;
  }

  ///
  /// 是否为闰年
  /// <p>
  /// 关于公历闰年是这样规定的：地球绕太阳公转一周叫做一回归年，一回归年长365日5时48分46秒。
  /// 因此，公历规定有平年和闰年，平年一年有365日，比回归年短0.2422日，四年共短0.9688日，故每四年增加一日，这一年有366日，就是闰年。
  /// 但四年增加一日比四个回归年又多0.0312日,400年后将多3.12日,故在400年中少设3个闰年,也就是在400年中只设97个闰年，这样公历年的平均长度与回归年就相近似了。
  ///
  /// 由此规定：年份是整百数的必须是400的倍数才是闰年，例如1900年、2100年就不是闰年。
  ///
  ///
  /// > 四年一闰，百年不闰，四百年再闰。
  ///
  /// <p>
  /// ### 参数
  /// * year    传入年份，计算，否则计算当年。
  ///
  bool isLeapYear({int? year}) {
    int _year = year ?? DateTime.now().year;
    if(_year == 3200) {
      return false;
    }
    return ((_year % 4 == 0 && _year % 100 != 0) || _year % 400 == 0) ;
  }

}