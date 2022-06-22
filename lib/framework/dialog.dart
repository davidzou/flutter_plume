import 'package:flutter/material.dart';
import 'package:plume/framework/container/ternary.dart';

/// 统一圆角值
///
const double _radiusValue = 18.0;
const BorderRadius _borderRadius = const BorderRadius.all(const Radius.circular(_radiusValue));

///
///
///
///
class DialogProvider {
  ///
  /// 显示一个对话框，只有一个按钮，取消则按空白区域即可。减少选择的困惑。
  ///
  /// <p>
  /// ### 参数
  ///
  /// > title
  ///   标题， 信息，提示，错误。
  ///
  /// > message
  ///   内容，消息。
  ///
  @deprecated
  static Future<bool?> show(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onPressed,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.yellowAccent,
                ),
              ],
            ),
            content: Text(
              message,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  onPressed?.call();
                  Navigator.pop(context, true);
                },
                child: Text("知道了"),
              ),
            ],
          );
        });
  }

  ///
  /// 通知，公告。
  ///
  /// ### 用途
  /// * 提示信息
  /// * 展示内容
  /// * 展示说明
  ///
  /// ### 参数    |参数名|描述|是否必须|
  ///
  /// * context                 上下文<Must>
  /// * title                   信息标题<Must>
  /// * content                 信息内容<Must>
  /// * buttonName              按钮文字。
  /// * onPressed               按钮点击事件响应。
  /// * indent                  排版，左边缩进的距离。
  /// * barrierDismissible      对话框空白区域点击关闭是否支持，默认支持点击空白区域可以关闭对话框。
  /// * dark                    是否强制指定夜间模式或者白天模式，不设置使用系统默认。
  ///
  static Future<DialogResult?> notice(
    BuildContext context, {
    required String title,
    required String content,
    String buttonName = "Got it",
    VoidCallback? onPressed, // 自定义回调按钮监听。
    double indent = 28,
    bool barrierDismissible = true,
    bool? dark,
  }) {
    // 取宽，屏幕的72%用于对话框。
    double _width = MediaQuery.of(context).size.width * 0.72;
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    return showDialog<DialogResult>(
      context: context,
      // Color(0x9eB2EbF2) 忧郁蓝
      barrierColor: _dark ? Color(0xaa000000) : Color(0x9effffff),
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: _dark ? Colors.black45 : Colors.white60,
          // 对话框区域背景色
          elevation: 12.0,
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Container(
                width: _width,
                padding: EdgeInsets.fromLTRB(indent, 28.0, 8.0, 8.0),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: _dark ? Colors.white : Colors.black87),
                ),
              ),
              SizedBox(
                width: _width,
                child: Divider(
                  height: 18,
                  thickness: 1.8,
                  indent: indent,
                  color: _dark ? Colors.white : Colors.black87,
                ),
              ),
              // content
              Container(
                width: _width,
                padding: EdgeInsets.fromLTRB((indent + 8.0), 8.0, 8.0, 8.0),
                child: Text(
                  content,
                  style: TextStyle(color: _dark ? Colors.white : Colors.black87),
                ),
              ),
              // button
              Container(
                width: _width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 8.0),
                child: TextButton(
                  child: Text(
                    buttonName,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: onPressed ??
                      () {
                        Navigator.of(context).pop(DialogResult(status: true, code: 200));
                      },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  ///
  ///
  ///
  /// Do not use it.
  /// TODO 扩展出内容，仅有布局框架。
  Future<T?> noticeX<T>(
    BuildContext context, {
    required Widget title,
    required Widget content,
    // Widget button = const ElevatedButton(
    //   child: Text("Got it"),
    //   onPressed: null,
    // ),
    Widget? button,
    VoidCallback? onPressed,
    double indent = 28,
    bool? dark,
  }) {
    // 取宽，屏幕的60%用于对话框。
    double _width = MediaQuery.of(context).size.width * 0.72;
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    return showDialog(
      context: context,
      barrierColor: _dark ? Color(0xaa000000) : Color(0x9effffff),
      builder: (context) {
        return Dialog(
          backgroundColor: _dark ? Colors.black45 : Colors.white24,
          // 对话框区域背景色
          elevation: 12.0,
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _width,
                padding: EdgeInsets.fromLTRB(indent, 28.0, 8.0, 8.0),
                child: title,
              ),
              SizedBox(
                width: _width,
                child: Divider(
                  height: 18,
                  thickness: 0.8,
                  indent: indent,
                  color: _dark ? Colors.white : Colors.black87,
                ),
              ),
              Container(
                width: _width,
                padding: EdgeInsets.fromLTRB((indent + 8.0), 8.0, 8.0, 8.0),
                child: content,
              ),
              Container(
                width: _width,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 8.0),
                child: button,
              )
            ],
          ),
        );
      },
    );
  }

  ///
  /// 选择项，确定或者取消。
  ///
  /// ### 用途
  /// * 参数选择
  /// * 内容判断
  /// * 条款确认
  ///
  /// ### 参数    |参数名|描述|是否必须|
  ///
  /// * context             上下文<Must>
  /// * title               信息标题<Must>
  /// * centerContent       是否居中显示，默认不居中。
  /// * onTapedRight        按钮点击事件响应。
  /// * onTapedLeft         排版，左边缩进的距离。
  /// * dark                是否强制指定夜间模式或者白天模式，不设置使用系统默认。
  /// * barrierDismissible  对话框空白区域点击关闭是否支持，默认支持点击空白区域可以关闭对话框。
  ///
  static Future<DialogResult?> dilemma(
    BuildContext context, {
    required String title,
    required String content,
    String rightButton = "OK",
    String leftButton = "CANCEL",
    bool centerContent = false,
    bool barrierDismissible = true,
    bool? dark,
    VoidCallback? onTapedRight,
    VoidCallback? onTapedLeft,
  }) {
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    Color _barrierColor = _dark ? Color(0xaa000000) : Color(0x9effffff);
    Color _backgroundColor = _dark ? Colors.black45 : Colors.white60;
    Color _fontColor = _dark ? Colors.white : Colors.black;
    return showDialog<DialogResult>(
      context: context,
      barrierColor: _barrierColor,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return Dialog(
          backgroundColor: _backgroundColor,
          // 对话框区域背景色
          elevation: 12.0,
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          // insetAnimationCurve: Curves.easeInOutQuad,
          // insetAnimationDuration: Duration(milliseconds: 5000),
          child: TernaryContainer(
            inDialog: true,
            header: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
              child: Text(
                title,
                style: TextStyle(color: _fontColor, fontSize: 20.0, shadows: kElevationToShadow[4]),
              ),
            ),
            content: Container(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, left: 20.0, right: 10.0),
              child: Text(
                content,
                textAlign: centerContent ? TextAlign.center : TextAlign.left,
                style: TextStyle(
                  color: _fontColor,
                ),
              ),
            ),
            footer: Column(
              children: [
                Divider(
                  color: Colors.grey,
                  height: 2,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: onTapedLeft ??
                                () {
                                  Navigator.of(context).pop(DialogResult(status: false, code: 200));
                                },
                            child: Text(
                              leftButton,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.0, color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        child: const VerticalDivider(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: onTapedRight ??
                                () {
                                  Navigator.of(context).pop(DialogResult(status: true, code: 200));
                                },
                            child: Text(
                              rightButton,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.0, color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///
  /// 两难选择模式，Android Material Design样式。
  ///
  /// ### 用途
  /// * 提示内容，两难选择
  ///
  static Future<DialogResult?> dilemmaMaterial(
    BuildContext context, {
    required String title,
    required String content,
    String rightButton = "ACCEPT",
    String leftButton = "CANCEL",
    bool centerContent = false,
    bool? dark,
    VoidCallback? onTapedRight,
    VoidCallback? onTapedLeft,
  }) {
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    Color _barrierColor = _dark ? Color(0xaa000000) : Color(0x9effffff);
    Color _backgroundColor = _dark ? Colors.black45 : Colors.white60;
    Color _fontColor = _dark ? Colors.white : Colors.black;
    TextStyle getTextStyle(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return TextStyle(color: Color(0xFF6200EE));
      }
      return TextStyle(color: _fontColor);
    }

    return showDialog<DialogResult>(
      context: context,
      barrierColor: _barrierColor,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: _backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radiusValue)),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: _fontColor),
          ),
          content: Text(
            content,
            style: TextStyle(color: _fontColor),
          ),
          actions: [
            TextButton(
              onPressed: onTapedLeft ??
                  () {
                    Navigator.of(context).pop(DialogResult(status: false, code: 200));
                  },
              child: Text(
                leftButton,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            TextButton(
              onPressed: onTapedRight ??
                  () {
                    Navigator.of(context).pop(DialogResult(status: true, code: 200));
                  },
              child: Text(
                rightButton,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        );
      },
    );
  }

  ///
  /// 选择弹出框
  ///
  static Future<T?> dilemmaChoiceChips<T>(
    BuildContext context, {
    required List<Widget> children,
    Widget? title, // 标题Title
    Color titleBackgroundColor = Colors.lightBlueAccent, // Title 背景色
    Color? barrierColor, // 背景蒙版色
    Color? dialogBackgroundColor,
    bool barrierDismissible = true, // 点击空白区域用作取消
  }) {
    const _radius = const Radius.circular(18.0);
    return showDialog(
      context: context,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: dialogBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: _radius,
              topRight: Radius.circular(18.0),
              bottomLeft: Radius.circular(18.0),
              bottomRight: Radius.circular(18.0),
            ),
          ),
          title: Container(
            padding: EdgeInsets.all(18.0),
            child: title,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0),
              ),
              color: titleBackgroundColor,
              boxShadow: kElevationToShadow[4],
            ),
          ),
          titlePadding: EdgeInsets.zero,
          children: children
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                    left: 18.0,
                    right: 18.0,
                    top: 12.0,
                    bottom: 12.0,
                  ),
                  child: e,
                ),
              )
              .toList(),
        );
      },
    );
  }

  ///
  /// 可扩展内容的对话框选择。
  ///
  static Future<T?> dilemmaX<T>(
    BuildContext context, {

    /// 列表内容
    required SliverChildDelegate delegate,

    /// 按钮名称
    String rightButton = "OK",
    String leftButton = "CANCEL",
    bool centerContent = false,
    bool? dark,
    VoidCallback? onTapedRight,
    VoidCallback? onTapedLeft,
  }) {
    double _width = MediaQuery.of(context).size.width * 72 / 100;
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    Color _barrierColor = _dark ? Color(0xaa000000) : Color(0x9effffff);
    Color _backgroundColor = _dark ? Colors.black45 : Colors.white60;
    return showDialog<T>(
      context: context,
      barrierColor: _barrierColor,
      builder: (context) {
        return Dialog(
          backgroundColor: _backgroundColor,
          // 对话框区域背景色
          elevation: 12.0,
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: _borderRadius,
          ),
          child: Container(
            width: _width,
            constraints: BoxConstraints(maxHeight: 348),
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                // backgroundBlendMode: BlendMode.modulate,
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.lightBlueAccent,
                  Colors.transparent,
                ], stops: [
                  0.0,
                  0.4,
                  0.9,
                  1.0,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 内容和按键
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Column(
                    children: [
                      // Container(height: 28, color: Colors.transparent,),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200, maxWidth: _width),
                        child: ListView.custom(
                          shrinkWrap: true,
                          childrenDelegate: SliverChildBuilderDelegate((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: _borderRadius,
                                  color: Colors.pinkAccent[400],
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.star,
                                    size: 44,
                                    color: Colors.lightGreenAccent,
                                  ),
                                  title: Text("index$index, High light"),
                                  subtitle: Text("we are list tile, and this is subtitle."),
                                ),
                              ),
                            );
                          }, childCount: 4),
                        ),
                      ),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(_radiusValue), bottomRight: Radius.circular(_radiusValue)),
                          color: Colors.orangeAccent.withOpacity(0.8),
                          boxShadow: kElevationToShadow[8],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // 图标
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Icon(
                      Icons.batch_prediction,
                      size: 128,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///
  /// 状态栏，表示成功，失败，奖励等状态的提示
  ///
  /// ### 用途
  /// * 成功/失败事件的显示，说明
  /// * 获取道具事件的说明
  /// * 仅表示一种状态的事件。
  ///
  /// ### 参数    |参数名|描述|是否必须|
  ///
  /// * context               上下文<Must>
  /// * status                表示状态的文字
  /// * statusIcon            表示状态相对于的图标
  /// * closeIcon             右上角关闭按钮的图标
  /// * description           描述文字，用于表示状态获取后的描述。
  /// * colors                渐变背景色
  /// * begin                 渐变色起始位置
  /// * end                   渐变色结束位置
  /// * barrierDismissible    对话框空白区域点击关闭是否支持，默认支持点击空白区域可以关闭对话框。
  ///
  static Future<T?> status<T>(
    BuildContext context, {
    required String status,
    required Widget statusIcon,
    IconData? closeIcon,
    String? description,
    List<Color> colors = const [
      Color(0x9a03A9F4),
      Color(0xFF651FFF),
      Color(0x9a7C4DFF),
    ],
    Alignment begin = Alignment.topLeft,
    Alignment end = Alignment.bottomRight,
    bool barrierDismissible = false,
    VoidCallback? onTapClosed,
    bool? dark,
  }) {
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    Color _barrierColor = _dark ? Color(0xaa000000) : Color(0x9effffff);
    Color _backgroundColor = _dark ? Colors.black45 : Colors.white60;
    return showDialog<T>(
      context: context,
      barrierColor: _barrierColor,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 12.0, left: 12.0, bottom: 12.0, right: 10.0),
                margin: EdgeInsets.only(right: 18.0, top: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: colors,
                    begin: begin,
                    end: end,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
                      child: statusIcon,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        status,
                        style: TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Text(
                        description ?? "",
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 24,
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: InkWell(
                    onTap: onTapClosed ??
                        () {
                          Navigator.of(context).pop();
                        },
                    child: Icon(
                      closeIcon ?? Icons.close_rounded,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///
  /// 输入条件的回调对话框
  ///
  /// * title                 对话框标题
  /// * label                 输入框Label
  /// * textField             自定义输入框
  /// * leftButton            左边按钮名称
  /// * rightButton           右边按钮名称
  /// * onTapedLeft           左边按钮点击事件，自定义处理。需注意返回的类型[DialogResult]
  /// * onTapedRight          右边按钮点击事件，自定义处理。需注意返回的类型[DialogResult]
  /// * barrierDismissible    对话框空白区域点击关闭是否支持，默认支持点击空白区域可以关闭对话框。
  /// * dark                  是否强制使用黑夜模式。
  ///
  static Future<DialogResult?> prompt(
    BuildContext context, {
    required String title,
    String? label = "输入需要的答案，确认并返回",
    TextField? textField,
    String leftButton = "Cancel",
    String rightButton = "OK",
    VoidCallback? onTapedLeft,
    VoidCallback? onTapedRight,
    bool barrierDismissible = false,
    bool? dark,
  }) {
    bool _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    Color _barrierColor = _dark ? Color(0xaa000000) : Color(0x9effffff);
    Color _backgroundColor = _dark ? Colors.black45 : Colors.white60;
    Color _fontColor = _dark ? Colors.white : Colors.black;
    return showDialog<DialogResult>(
      context: context,
      barrierColor: _barrierColor,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        TextEditingController editingController = TextEditingController();
        return Dialog(
          backgroundColor: _backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: TernaryContainer(
            header: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 25.0, bottom: 10.0, left: 20.0, right: 20.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  shadows: kElevationToShadow[4],
                  color: _fontColor,
                ),
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: CustomTextInput(
                label: label,
                style: TextStyle(
                  color: _fontColor,
                ),
                labelStyle: TextStyle(
                  color: _fontColor,
                ),
                editingController: editingController,
              ),
            ),
            footer: Column(
              children: [
                Divider(
                  color: Colors.grey,
                  height: 2,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: onTapedLeft ??
                                () {
                                  Navigator.of(context).pop(DialogResult(status: false, code: 200));
                                },
                            child: Text(
                              leftButton,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.0, color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 48,
                          child: const VerticalDivider(
                            color: Colors.grey,
                            width: 2,
                          )),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: onTapedRight ??
                                () {
                                  if (editingController.text.isEmpty) {
                                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("右边的按钮被按到了")));
                                    return;
                                  }
                                  Navigator.of(context).pop(DialogResult(status: true, code: 200, msg: "返回输入内容", data: editingController.text));
                                },
                            child: Text(
                              rightButton,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16.0, color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 10.0,),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<int> showDialogNormal(
    BuildContext context, {
    // required String status,
    // required Widget statusIcon,
    IconData? closeIcon,
    String? description,
  }) async {
    // 这是对话框内部就解决的选择性问题，有内部返回值处理，最终返回到事件。
    switch (await showDialog<int>(
        context: context,
        builder: (context) {
          ValueNotifier<int> _valueNotifier = ValueNotifier(1);
          return SimpleDialog(
            title: Text("title"),
            backgroundColor: Colors.white.withOpacity(0.8),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              // 选择列表
              ValueListenableBuilder<int>(
                builder: (context, value, child) => Center(
                  child: DropdownButton<int>(
                    alignment: AlignmentDirectional.centerEnd,
                    items: [
                      DropdownMenuItem(
                        alignment: Alignment.centerRight,
                        child: Text("1"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("2"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("3"),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text("4"),
                        value: 4,
                      ),
                      DropdownMenuItem(
                        child: Text("5"),
                        value: 5,
                      ),
                    ],
                    onChanged: (value) {
                      _valueNotifier.value = value!;
                    },
                    value: value,
                  ),
                ),
                valueListenable: _valueNotifier,
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, _valueNotifier.value);
                },
                child: const Text('Treasury department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('State department'),
              ),
            ],
          );
        })) {
      case 1:
        print("return 1");
        return 1;
      case 2:
        print("return 2");
        return 2;
      case 3:
        print("return 3");
        return 3;
    }
    return 0;
  }
}

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({Key? key, this.label, this.style, this.labelStyle, required this.editingController}) : super(key: key);

  final String? label;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextEditingController editingController;

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  String? _errorText;

  @override
  void initState() {
    super.initState();
  }

  _getErrorText() {
    return _errorText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: true,
        controller: widget.editingController,
        style: widget.style,
        onSubmitted: (String s) {
          // 监听回车键
          setState(() {
            if (s.isEmpty) {
              _errorText = "不能为空";
              print("isEmpty ");
            } else {
              print("isNotEmpty");
              _errorText = null;
            }
          });
        },
        onChanged: (String s) {
          if (s.isNotEmpty && _errorText != null) {
            // 第一次输入做以此检测，onSubmit
            setState(() {
              _errorText = null;
            });
          }
        },
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: widget.labelStyle,
          errorText: _getErrorText(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF409EFF), width: 2.0),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }
}

///
/// 对话框返回结果对象定义。
///
/// @param status   状态，即确认取消状态。true为成功状态，即确定按钮的关闭等。
/// @param code     状态码，不同操作返回的状态码定义。
/// @param msg      返回的信息，一般日志等。
/// @param data     返回的数据。
///
class DialogResult {
  DialogResult({this.status = false, this.code, this.msg, this.data});

  final bool status;
  final int? code;
  final String? msg;
  final Object? data;

  @override
  String toString() {
    return 'DialogResult{status: $status, code: $code, msg: $msg, data: $data}';
  }
}

class CustomDialog {
  ///
  show<T>(BuildContext context, WidgetBuilder builder) {
    return showDialog<T>(context: context, builder: builder);
  }
}

///
///
/// TODO 用于传递参数，待设计
class DialogStyle {
  /// 对话框背景色
  Color? background;

  /// 对话框内文字颜色
  Color? textColor;

  /// 对话框内按钮颜色
  Color? buttonColor;
}
