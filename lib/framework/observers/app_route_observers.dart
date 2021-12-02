import 'package:flutter/material.dart';

///
///
/// ```
///   class ObserverPage extend State<> with RouteAware {
///
///     @override
///     void didChangeDependencies() {
///       super.didChangeDependencies();
///       // 注册监听
///       AppRouteObserver().routeObserver.subscribe(this, ModalRoute.of(context));
///     }
///
///     void dispose() {
///       // 注销监听
///       AppRouteObserver().routeObserver.unsubscribe(this);
///       super.dispose();
///     }
///
///     @override
///     void didPop() {
///     }
///   }
///
///
///   ### main.dart
///
///   navigatorObservers: [
///       AppRouteObserver().routeObserver,
///   ],
/// ```
///
class AppRouteObserver {
  //路由监听器
  static final RouteObserver<ModalRoute<void>> _routeObserver =
      RouteObserver<ModalRoute<void>>();

  static final AppRouteObserver _appRouteObserver =
      AppRouteObserver._internal();

  AppRouteObserver._internal() {}
  //通过单例的get方法轻松获取路由监听器
  RouteObserver<ModalRoute<void>> get routeObserver {
    return _routeObserver;
  }

  factory AppRouteObserver() {
    return _appRouteObserver;
  }
}
