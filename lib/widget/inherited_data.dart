import 'package:flutter/widgets.dart';

///
/// 登录数据共享。
///
/// ### Example:
///
///     class LoginPageInherited extends InheritedDataWidget<String> {
///       static LoginPageInherited of(BuildContext context) {
///         return context.dependOnInheritedWidgetOfExactType<LoginPageInherited>();
///       }
///     }
///
abstract class InheritedDataWidget<T> extends InheritedWidget {
  InheritedDataWidget({Key key, this.data, this.child})
      : super(key: key, child: child);
  final Widget child;
  final T data;

  @override
  bool updateShouldNotify(InheritedDataWidget oldWidget) {
    return oldWidget.data != this.data;
  }
}
