import 'package:flutter/services.dart';

class SystemTools {

  /// 直接退出程序
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }
}