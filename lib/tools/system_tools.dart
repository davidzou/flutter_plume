import 'package:flutter/services.dart';

class SystemTools {

  ///
  /// 直接退出程序
  ///
  /// <a href="https://api.flutter.dev/flutter/services/SystemNavigator/pop.html">参考文档</a>
  ///
  static Future<void> exit({bool? animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }
}