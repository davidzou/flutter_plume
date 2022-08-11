
///
/// 对话框返回的数据。
///
/// @param status   状态，即确认取消状态。true为成功状态，即确定按钮的关闭等。
/// @param code     状态码，不同操作返回的状态码定义。
/// @param msg      返回的信息，一般日志等。
/// @param data     返回的数据。
///
class DialogResult<T> {
  const DialogResult({required this.status, this.msg, required this.code, this.data});

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

  @override
  String toString() {
    return 'DialogResult{status: $status, msg: $msg, code: $code, data: $data}';
  }
}