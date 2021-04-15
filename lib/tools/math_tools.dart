class MathTools {

  ///
  /// 求斐波那契数列
  ///
  static int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}