
import 'package:flutter/material.dart';


///
/// 对话框返回的数据。
///
class DialogResult<T> {
  DialogResult({required this.status, this.msg, required this.code, this.data});

  factory DialogResult.success({String? msg, T? data}) {
    return DialogResult<T>(status: true, code: 200, msg: msg, data: data);
  }

  factory DialogResult.cancel({String? msg, T? data}) {
    return DialogResult(status: false, code: 400, msg: msg, data: data);
  }

  final bool status;
  final String? msg;
  final int code;
  final T? data;
}

class testDialogResult {
  void testUsed() {
    DialogResult.success(data: "");
  }
}