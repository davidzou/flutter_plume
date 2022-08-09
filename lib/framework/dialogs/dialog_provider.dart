import 'package:flutter/material.dart';
import 'package:plume/framework/container/ternary.dart';
import 'package:plume/framework/dialogs/dialog_result.dart';

/// 统一圆角值
const double _radiusValue = 18.0;
const BorderRadius _borderRadius = const BorderRadius.all(const Radius.circular(_radiusValue));

/// FormBuild OutLineBorder
const OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(8.0)));

const kDarkBarrierColor = const Color(0xaa000000);
const kLightBarrierColor = const Color(0x9effffff);
const kOutLineInputBorder = _outlineInputBorder;

/// horizontal padding with value 10.0
const kHorizontalPaddingTen = const EdgeInsets.symmetric(horizontal: 10.0);

typedef DropMenuItemWidgetBuilder = Widget Function<T>(BuildContext context, T value);

/// prompt, hint, notice, selector, multi_choice, form, status and more.
class DialogProviderPlus {
  /// Form Key
  static final GlobalKey<FormState> _formKey = GlobalKey();

  DialogProviderPlus(
    this.context, {
    this.dark,
    this.title,
    this.okButton,
    this.cancelButton,
  }) {
    // 这里初始化些什么
    _dark = dark ?? (Theme.of(context).brightness == Brightness.dark);
    _barrierColor = _dark ? kDarkBarrierColor : kLightBarrierColor;
    _backgroundColor = _dark ? Colors.black54 : Colors.white70;
    _textColor = _dark ? Colors.white : Colors.black87;
    _borderEnableColor = _dark ? Colors.white54 : Colors.black54;
    _hintColor = _dark ? Colors.white54 : Colors.black54;
  }

  /// 是否强制设置黑夜和白天模式
  final bool? dark;
  final BuildContext context;
  final String? title;
  final String? okButton;
  final String? cancelButton;

  /// 初始化设置
  bool _dark = false;
  Color _barrierColor = kLightBarrierColor;
  Color _backgroundColor = Colors.black45;
  Color _textColor = Colors.white;
  Color _borderEnableColor = Colors.black45;
  Color _hintColor = Colors.black45;
  Gradient? _gradient;
  DecorationImage? _image;

  /// 返回的数据
  Map<String, Object?> maps = <String, Object?>{};

  /// 显示的内容
  List<Widget> _children = <Widget>[];

  /// 固定格式用户名密码弹出框
  factory DialogProviderPlus.login(BuildContext context, {DecorationImage? backgroundImage}) {
    return DialogProviderPlus(context, title: "Login", okButton: "Login", cancelButton: "Cancel")
      ..addTextFormField(
        inputDecoration: InputDecoration(
          label: const Text("Username"),
          hintText: "Please input a username.",
          border: _outlineInputBorder,
        ),
        inputType: TextInputType.name,
      )
      ..addTextFormField(
        inputDecoration: InputDecoration(
          label: const Text("Password"),
          hintText: "Please input a password.",
          border: _outlineInputBorder,
        ),
        inputType: TextInputType.visiblePassword,
        obscureText: true,
      )
      ..setBackgroundImage(backgroundImage);
  }

  /// 添加一个输入框表单项。
  void addTextFormField({String? key, InputDecoration? inputDecoration, TextInputType? inputType, bool? obscureText}) {
    final TextStyle _style = TextStyle(color: _textColor);
    final OutlineInputBorder _focusedBorder = _outlineInputBorder.copyWith(borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0));
    final OutlineInputBorder _enabledBorder = _outlineInputBorder.copyWith(borderSide: BorderSide(color: _borderEnableColor));
    InputDecoration _defaultInputDecoration = InputDecoration(
      labelText: "Label",
      // 如果没有Lable，errorBorder就不是roundborder
      labelStyle: _style,
      hintStyle: _style.copyWith(color: _hintColor),
      helperStyle: _style,
      border: kOutLineInputBorder,
      focusedBorder: _focusedBorder,
      enabledBorder: _enabledBorder,
    );
    if (inputDecoration != null) {
      // 设置默认配色
      _defaultInputDecoration = inputDecoration.copyWith(
        labelStyle: _style,
        hintStyle: _style.copyWith(color: _hintColor),
        helperStyle: _style,
        focusedBorder: _focusedBorder,
        enabledBorder: _enabledBorder,
      );
    }
    Widget _widget = Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: TextFormField(
        keyboardType: inputType,
        style: _style,
        obscureText: obscureText ?? inputType == TextInputType.visiblePassword ? true : false,
        autofocus: true,
        decoration: _defaultInputDecoration,
        validator: (value) {
          // 验证
          if (value == null || value.isEmpty) {
            return "Please input it.";
          }
          return null;
        },
        onSaved: (value) {
          maps[key ?? 'field${maps.length}'] = value;
          print("onSaved");
        },
      ),
    );

    _children.add(_widget);
  }

  ///
  /// ### 参数
  /// * key       返回值[DialogResult].data的自定义键值，默认返回的是FormField所在列表中的下标（如：'field1'）。
  /// * values    DropList的值，即被选择的值。String和int较为适用。
  /// * builder   自定义构建，如MenuItem不满足需求时。
  ///
  void addDropDownButton<T>({
    String? key,
    List<T>? values,
    T? defaultValue,
    DropMenuItemWidgetBuilder? builder,
  }) {
    if (values == null || values.isEmpty) return;
    T? _currentValue = defaultValue;
    _children.add(
      StatefulBuilder(builder: (context, StateSetter setState) {
        return DropdownButtonFormField<T>(
          value: _currentValue,
          decoration: InputDecoration(
            labelText: "label",
            border: _outlineInputBorder,
          ),
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: const Text("请选择"),
          ),
          items: values
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  child: builder == null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "$e",
                            style: TextStyle(color: _textColor),
                          ))
                      : builder.call(context, e),
                  onTap: () {},
                ),
              )
              .toList(),
          borderRadius: BorderRadius.circular(10.0),
          dropdownColor: _backgroundColor,
          onChanged: (value) {
            setState(() {
              _currentValue = value!;
            });
          },
          onSaved: (value) {
            maps[key ?? "field${maps.length}"] = value;
          },
          validator: (value) {
            if (value == null) {
              return "Select it value.";
            }
            return null;
          },
        );
      }),
    );
  }

  ///
  /// 分割线
  ///
  addDivider({double? indent, double? endIndent, double vertical = 10.0}) {
    _children.add(
      Padding(
        padding: EdgeInsets.symmetric(vertical: vertical),
        child: Divider(
          color: _textColor,
          height: 1.0,
          thickness: 1.0,
          indent: indent,
          endIndent: endIndent,
        ),
      ),
    );
  }

  ///
  /// 双数字选择，时间和分的选择，返回的数据是由分隔符'：'分割的。
  ///
  addHourMinutesSelector({String? key, Widget? title}) {
    var _currentValue = 0;
    // 下拉数字列表
    List<int> _createNumList({int from = 0, int end = 100}) {
      List<int> _list = <int>[];
      for (int i = from; i <= end; i++) {
        _list.add(i);
      }
      return _list;
    }

    final List<int> _hourValues = _createNumList(from: 0, end: 24);
    final List<int> _minuteValues = _createNumList(end: 60);
    // menu item
    DropdownMenuItem<int> _createDropdownMenuItem(int value) {
      return DropdownMenuItem<int>(
        value: value,
        alignment: Alignment.centerRight,
        child: Padding(padding: kHorizontalPaddingTen, child: Text("$value", style: TextStyle(color: _textColor))),
      );
    }

    final Widget _hint = Padding(
      padding: kHorizontalPaddingTen,
      child: const Text(
        "请选择",
        style: TextStyle(fontSize: 13.0),
      ),
    );

    final InputDecoration _decoration = InputDecoration(
      border: _outlineInputBorder,
      // suffixText: "dd",
      // alignLabelWithHint: true,
    );

    Widget _createDropdownButtonFormField(List<int> values, bool isHour) {
      Duration _duration = Duration(hours: 0, minutes: 0);
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return DropdownButtonFormField<int>(
          value: _currentValue,
          hint: _hint,
          isExpanded: true,
          items: values.map((e) => _createDropdownMenuItem(e)).toList(),
          decoration: _decoration.copyWith(labelText: isHour ? "小时" : "分钟"),
          borderRadius: BorderRadius.circular(10.0),
          dropdownColor: _backgroundColor,
          onTap: () {
            print("value");
          },
          onChanged: (value) {
            setState(() {
              _currentValue = value!;
            });
          },
          onSaved: (value) {
            print("onSave $isHour, $value");
            String? tmp = (maps[key ?? "field${maps.length}"] ?? "") as String;
            if (tmp.isNotEmpty) {
              tmp = "$tmp:";
            }
            maps[key ?? "field${maps.length}"] = "$tmp$value";
          },
          validator: (value) {
            if (value == null) {
              return "Select it value.";
            }
            return null;
          },
        );
      });
    }

    // 时
    final Widget _hours = _createDropdownButtonFormField(_hourValues, true);
    // 分
    final Widget _minutes = _createDropdownButtonFormField(_minuteValues, false);

    final Widget _widget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: title ??
                Text(
                  "计划耗费",
                  style: TextStyle(color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w400),
                )),
        Row(
          children: [
            Expanded(child: Padding(padding: EdgeInsets.all(5.0), child: _hours)),
            Expanded(child: Padding(padding: EdgeInsets.all(5.0), child: _minutes)),
          ],
        ),
      ],
    );
    _children.add(_widget);
  }

  /// 添加文本
  addText(Text text, {AlignmentGeometry? alignment}) {
    _children.add(Container(alignment: alignment, child: text));
  }

  /// 设置图片背景
  setBackgroundImage(DecorationImage? image, {double? opacity, BoxFit? fit}) {
    if (image == null) return;
    _image = DecorationImage(
      image: image.image,
      opacity: opacity ?? 0.3,
      fit: fit ?? BoxFit.fill,
      onError: image.onError,
      colorFilter: image.colorFilter,
      alignment: image.alignment,
      centerSlice: image.centerSlice,
      repeat: image.repeat,
      matchTextDirection: image.matchTextDirection,
      scale: image.scale,
      filterQuality: image.filterQuality,
      invertColors: image.invertColors,
      isAntiAlias: image.isAntiAlias,
    );
  }

  /// 设置渐变背景
  setBackGroundGradient(Gradient gradient) {
    _gradient = gradient;
  }

  ///
  /// 返回结构数据
  /// map key is 'field[0..n]' to get data.
  ///
  Future<DialogResult<Map<String, Object?>?>?> show(BuildContext context) {
    print("show");
    return Navigator.of(context, rootNavigator: true)
        .push<DialogResult<Map<String, Object?>?>?>(
          _dialogBuilder<DialogResult<Map<String, Object?>?>?>(context, null),
        )
        .onError((error, stackTrace) => throw Exception(error));
  }

  /// 一般标题，居中， 居左或者居右显示。
  Widget _headerBuilder() {
    return Container();
  }

  /// 一般按钮控件。MaterialDesign or Cupertino
  Widget _footBuilder() {
    return Container();
  }

  _dialogMaterialDesignBuilder() {
    // MaterialDesign风格
  }

  _dialogCupertinoBuilder() {
    // iOS风格
  }

  /// 显示
  /// Navigator.of(context).restorablePush(_dialogBuilder);
  ///
  DialogRoute<T?> _dialogBuilder<T>(BuildContext context, Object? arguments) {
    return DialogRoute<T>(
      context: context,
      barrierColor: _barrierColor,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: _borderRadius),
          backgroundColor: _backgroundColor,
          contentPadding: EdgeInsets.zero,
          content: Ink(
            padding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
            decoration: BoxDecoration(
              image: _image,
              borderRadius: BorderRadius.only(topLeft: _borderRadius.topLeft, topRight: _borderRadius.topRight),
              gradient: _gradient,
            ),
            child: TernaryContainer(
              header: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  title ?? "Dialog",
                  style: TextStyle(color: _textColor, fontWeight: FontWeight.bold, fontSize: 20, shadows: kElevationToShadow[4]),
                ),
              ),
              content: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: _children,
                  ),
                ),
              ),
              footer: Container(),
            ),
          ),
          actions: [
            TextButton(
                child: Text(
                  okButton ?? "Ok",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, DialogResult<Map<String, Object?>?>(status: true, code: 200, msg: "back", data: maps));
                  }
                }),
            TextButton(
                child: Text(
                  cancelButton ?? "Cancel",
                  style: TextStyle(fontSize: 20, color: _hintColor),
                ),
                onPressed: () {
                  Navigator.pop(
                      context,
                      DialogResult<Map<String, Object?>?>(
                        status: false,
                        code: 400,
                        msg: "",
                      ));
                }),
          ],
        );
      },
    );
  }
}

class CustomFormFiled extends FormField<String> {
  CustomFormFiled()
      : super(
          builder: (field) {
            return Container(
              child: Text("d"),
            );
          },
        );

  @override
  FormFieldSetter<String>? get onSaved => super.onSaved;

  @override
  FormFieldValidator<String>? get validator => super.validator;
}
