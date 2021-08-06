import 'dart:math';

///
///
///
class MathTools {
  ///
  /// 求斐波那契数列
  ///
  static int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  ///
  /// 随机数,给定数值范围
  ///
  /// ### 参数
  /// * from        起始数值
  /// * to          结束数值
  /// * contains    是否包含结束值
  /// * increase    递增值
  ///
  static int randomNextInt(int to,
      {int from = 0, bool contains = false, int increase = 1}) {
    List<int> list = [];
    for (int i = from; i < (contains ? (to + 1) : to); i += increase) {
      list.add(i);
    }
    var ran = Random();
    return list.elementAt(ran.nextInt(list.length));
  }

  ///
  /// 随机数,从给定的范围中获取。
  ///
  /// ### 参数
  /// * list      给定数
  ///
  ///
  static int randomNextIntFromList(List<int> list) {
    var ran = Random();
    return list.elementAt(ran.nextInt(list.length));
  }

  ///
  /// 随机一个不为零的整数
  ///
  /// ### 参数
  /// * max           随机数范围，最大值。即[1-max]中随机
  /// * condition     其他满足条件
  ///
  static int randomNextIntNotZero(int max, [bool condition = true]) {
    var ran = Random();
    int _remain = ran.nextInt(max);
    bool stop = (_remain == 0);
    while (stop) {
      _remain = ran.nextInt(max);
      stop = !(_remain != 0 && condition);
    }
    return _remain;
  }
}
