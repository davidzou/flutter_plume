import 'package:flutter/widgets.dart';

// 过场效果
//

///
///渐变效果
///
/// ### Example:
/// ```
///  Navigator.push(context, RouteGradualChange(ObjectPage()));
/// ```
///
class RouteGradualChange extends PageRouteBuilder {
  ///
  final Widget page;

  RouteGradualChange(
    this.page, {
    Duration duration = const Duration(seconds: 1),
  }) : super(
            transitionDuration: duration,
            pageBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return page;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
                    parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

///
/// 缩放效果
///
/// ### Example:
/// ```
/// Navigator.push(context, RouteZoom(ObjectPage()));
/// ```
///
class RouteZoom extends PageRouteBuilder {
  ///
  final Widget widget;

  RouteZoom(
    this.widget, {
    Duration duration = const Duration(seconds: 1),
  }) : super(
            transitionDuration: duration,
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child);
            });
}

///
/// 旋转+缩放效果
///
/// ### Example:
/// ```
/// Navigator.push(context, RouteRotateZoom(ObjectPage()));
/// ```
class RouteRotateZoom extends PageRouteBuilder {
  final Widget widget;

  RouteRotateZoom(
    this.widget, {
    Duration duration = const Duration(seconds: 1),
  }) : super(
            transitionDuration: duration,
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animation1, curve: Curves.fastOutSlowIn)),
                    child: child,
                  ));
            });
}

///
/// 滑动效果
///
/// ### Example:
/// ```
/// Navigator.push(context, RouteSlide(ObjectPage()));
/// ```
///
class RouteSlide extends PageRouteBuilder {
  final Widget widget;

  RouteSlide(
    this.widget, {
    Duration duration = const Duration(seconds: 1),
  }) : super(
            transitionDuration: duration,
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
