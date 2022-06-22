import 'package:flutter/foundation.dart';

///
/// 多个相同值监听。
///
/// 如像监听同一控件的2级或者多级状态变更时使用次控件。
///
/// ### 关于更新其中一个值的时候。
/// * 使用方法更新
///
/// ```
///  MultiValueNotifier.indexValue(index, value);
/// ```
///
/// * 使用运算符
///
/// ```
///  MultiValueNotifier[index] = value;
/// ```
///
/// !!! 注意 !!!
///
/// *切勿使用value的GET方法获取更新*
///
class MultiValueNotifier<T> extends ChangeNotifier
    implements ValueListenable<List<T>> {
  ///
  MultiValueNotifier(this._value);

  @override
  List<T> get value => _value;
  List<T> _value;

  set value(List<T> newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  T operator [](int index) {
    return _value[index];
  }

  void operator []=(int index, T newValue) {
    if (_value[index] == newValue) return;
    _value[index] = newValue;
    notifyListeners();
  }

  ///
  void indexValue(T newValue, int index) {
    if (_value[index] == newValue) return;
    _value[index] = newValue;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}
