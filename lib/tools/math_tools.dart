import 'dart:math';

class MathTools {

  ///
  /// 求斐波那契数列
  ///
  static int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  ///
  /// 随机数给定数值范围
  ///
  /// ### 参数
  /// * from        起始数值
  /// * to          结束数值
  /// * contains    是否包含结束值
  /// * increase    递增值
  ///
  static int randomNextInt(int to, {int from = 0, bool contains = false, int increase = 1}) {
    List<int> list = [];
    for(int i = from; i < (contains ? (to + 1) : to); i += increase) {
      list.add(i);
    }
    var ran = Random();
    return list.elementAt(ran.nextInt(list.length + 1));
  }

  ///
  /// 随机数 从给定的范围中获取。
  ///
  /// ### 参数
  /// * list      给定数
  ///
  ///
  static int randomNextIntFromList(List<int> list) {
    var ran = Random();
    return list.elementAt(ran.nextInt(list.length));
  }
}