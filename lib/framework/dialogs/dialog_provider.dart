import 'package:flutter/material.dart';
import 'package:plume/framework/container/ternary.dart';
import 'package:plume/framework/dialogs/dialog_result.dart';

/// 统一圆角值
const double _radiusValue = 18.0;
const BorderRadius _borderRadius = const BorderRadius.all(const Radius.circular(_radiusValue));

const double _formFieldRadiusValue = 8.0;
const BorderRadius _formFieldBorderRadius = const BorderRadius.all(const Radius.circular(_formFieldRadiusValue));

/// FormBuild OutLineBorder
const OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(_formFieldRadiusValue)));

const kDarkBarrierColor = const Color(0xaa000000);
const kLightBarrierColor = const Color(0x9effffff);
const kOutLineInputBorder = _outlineInputBorder;

/// horizontal padding with value 10.0
const kHorizontalPaddingTen = const EdgeInsets.symmetric(horizontal: 10.0);

/// vertical padding with value 10.0
const kVerticalPaddingTen = const EdgeInsets.symmetric(vertical: 10.0);

typedef DropMenuItemWidgetBuilder = Widget Function<T>(BuildContext context, T value);

/// 对话框类型
enum DialogType {
  ///
  /// 通知类型
  ///
  notice,

  ///
  /// 条件输入类型
  ///
  prompt,

  ///
  /// 状态类型
  ///
  status,

  ///
  /// form表单类型
  ///
  form,

  /// 单选项
  choice,

  /// 多选项
  selector,

  /// 标签，tag选择
  chips,
}

///
/// prompt, hint, notice, selector, multi_choice, form, status and more.
///
/// Theme 自定义，
/// ### Dialog 相关
///   1. barrierColor           dark and light
///   2. dialogBackground       dark and light
///   3. dialogBorderRadius     always
///   4. title textStyle
///   5. content textStyle
///   6. foot textStyle
///   7. hint textStyle
///
class DialogProviderPlus {
  /// Form Key
  static final GlobalKey<FormState> _formKey = GlobalKey();

  DialogProviderPlus(
    this.context, {
    bool? dark,
    this.title,
    this.titleAlignment,
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
  final BuildContext context;
  final String? title;
  final AlignmentGeometry? titleAlignment;
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

  ///
  /// 固定格式用户名密码弹出框
  ///
  /// ```
  /// DialogProviderPlus.login(context).show().then((value) => print(${value.data['username']}, ${value.data['password']}););
  /// ```
  ///
  factory DialogProviderPlus.login(
    BuildContext context, {
    String title = "Login",
    String okButtonName = "Login",
    String cancelButtonName = "Cancel",
    DecorationImage? backgroundImage,
  }) {
    return DialogProviderPlus(context, title: title, okButton: okButtonName, cancelButton: cancelButtonName)
      ..addTextFormField(key: "username", labelText: "Username", hintText: "Please input a username.", inputType: TextInputType.name)
      ..addTextFormField(key: "password", labelText: "Password", hintText: "Please input a password.", inputType: TextInputType.visiblePassword, obscureText: true)
      ..setBackgroundImage(backgroundImage);
  }

  /// A choice Dialog
  factory DialogProviderPlus.choice(
    BuildContext context, {
    String? key,
    String? labelText,
    DecorationImage? backgroundImage,
    required List<dynamic> values,
    dynamic defaultValue,
    DropMenuItemWidgetBuilder? builder,
  }) {
    return DialogProviderPlus(
      context,
      title: "Choice",
    )..addDropDownButton(
        key: key,
        labelText: labelText,
        values: values,
        defaultValue: defaultValue,
        builder: builder,
      );
  }

  ///
  /// 添加一个输入框表单项。
  ///
  addTextFormField({
    String? key,
    String? labelText,
    String? hintText,
    InputDecoration? inputDecoration,
    TextInputType? inputType,
    bool? obscureText,
  }) {
    final InputDecorationTheme inputTheme = Theme.of(context).inputDecorationTheme;

    final TextStyle _style = TextStyle(color: _textColor);
    // final OutlineInputBorder _focusedBorder = _outlineInputBorder.copyWith(borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2.0));
    // final OutlineInputBorder _enabledBorder = _outlineInputBorder.copyWith(borderSide: BorderSide(color: _borderEnableColor));
    // InputDecoration _defaultInputDecoration = InputDecoration(
    //   labelText: labelText ?? "Label",
    //   // 如果没有Label，errorBorder就不是roundborder
    //   labelStyle: _style,
    //   hintStyle: _style.copyWith(color: _hintColor),
    //   helperStyle: _style,
    //   border: kOutLineInputBorder,
    //   focusedBorder: _focusedBorder,
    //   enabledBorder: _enabledBorder,
    // );
    // if (inputDecoration != null) {
    //   // 设置默认配色
    //   _defaultInputDecoration = inputDecoration.copyWith(
    //     labelStyle: _style,
    //     hintStyle: _style.copyWith(color: _hintColor),
    //     helperStyle: _style,
    //     border: kOutLineInputBorder,
    //     focusedBorder: _focusedBorder,
    //     enabledBorder: _enabledBorder,
    //   );
    // }
    Widget _widget = Padding(
      padding: kVerticalPaddingTen,
      child: TextFormField(
        keyboardType: inputType,
        style: _style,
        obscureText: obscureText ?? inputType == TextInputType.visiblePassword ? true : false,
        autofocus: true,
        decoration: inputDecoration ??
            InputDecoration(
              border: inputTheme.border ?? const UnderlineInputBorder(),
              filled: inputTheme.filled,
              hintText: hintText,
              labelText: labelText,
            ),
        validator: (value) {
          // 验证
          if (value == null || value.isEmpty) {
            return "Please input it.";
          }
          return null;
        },
        onSaved: (value) {
          maps[key ?? 'field${maps.length}'] = value;
          // print("onSaved");
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
  addDropDownButton<T>({
    String? key,
    required List<T> values,
    T? defaultValue,
    DropMenuItemWidgetBuilder? builder,
    String? labelText,
    String? hintText,
  }) {
    if (values.isEmpty) return;
    T? _currentValue = defaultValue;
    final InputDecorationTheme inputTheme = Theme.of(context).inputDecorationTheme;
    final dropDownButton = StatefulBuilder(builder: (context, StateSetter setState) {
      return Padding(
        padding: kVerticalPaddingTen,
        child: DropdownButtonFormField<T>(
          value: _currentValue,
          decoration: InputDecoration(
            border: inputTheme.border ?? const UnderlineInputBorder(),
            filled: inputTheme.filled,
            hintText: hintText,
            labelText: labelText,
          ),
          hint: Padding(
            padding: kHorizontalPaddingTen,
            child: Text(hintText ?? "请选择"),
          ),
          items: values
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  child: builder == null
                      ? Padding(
                          padding: kHorizontalPaddingTen,
                          child: Text("$e",
                              style: TextStyle(
                                color: _textColor,
                              )))
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
        ),
      );
    });

    // Add to list
    _children.add(dropDownButton);
  }

  ///
  /// 分割线
  ///
  addDivider({
    double? indent,
    double? endIndent,
    double vertical = 10.0, // TODO It can that to set for all in one
    Color? color,
  }) {
    final divider = Padding(
      padding: EdgeInsets.symmetric(vertical: vertical),
      child: Divider(
        color: color,
        height: 1.0,
        thickness: 1.0,
        indent: indent,
        endIndent: endIndent,
      ),
    );
    // Add to list.
    _children.add(divider);
  }

  ///
  /// 日期选择器
  ///
  addDatePicker({
    String? key,
    String? labelText,
    String? hintText,
    DateTime? start,
    DateTime? end,
    SelectableDayPredicate? selectableDayPredicate,
  }) {
    var inputDate = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: InputDatePickerFormField(
        // initialDate: DateTime.now(),
        firstDate: start ?? DateTime.parse("1970-01-01"),
        lastDate: end ?? DateTime.now(),
        onDateSubmitted: (v) {
          print(v);
        },
        onDateSaved: (value) {
          maps[key ?? "field${maps.length}"] = value;
        },
        fieldLabelText: labelText,
        fieldHintText: hintText,
        selectableDayPredicate: selectableDayPredicate,
      ),
    );

    // Add to list.
    _children.add(inputDate);
  }

  ///
  /// 双数字选择，时间和分的选择，返回的数据是由分隔符'：'分割的。
  ///
  void addHourMinutesSelector({String? key, Widget? title}) {
    var _currentValue;
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
      // Duration _duration = Duration(hours: 0, minutes: 0);
      return StatefulBuilder(builder: (context, StateSetter setState) {
        return DropdownButtonFormField<int>(
          value: _currentValue,
          hint: _hint,
          isExpanded: true,
          items: values.map((e) => _createDropdownMenuItem(e)).toList(),
          decoration: _decoration.copyWith(labelText: isHour ? "小时" : "分钟"),
          borderRadius: BorderRadius.circular(10.0),
          dropdownColor: _backgroundColor,
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
        // Padding(
        //   padding: EdgeInsets.symmetric(vertical: 10.0),
        //   child: title ??
        //       Text(
        //         "计划耗费",
        //         style: TextStyle(color: _textColor, fontSize: 16.0, fontWeight: FontWeight.w400),
        //       ),
        // ),
        Row(
          children: [
            Expanded(child: Padding(padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 2.5), child: _hours)),
            Expanded(child: Padding(padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 2.5), child: _minutes)),
          ],
        ),
      ],
    );
    _children.add(_widget);
  }

  /// 添加文本
  void addText(Text text, {AlignmentGeometry? alignment}) {
    _children.add(Container(alignment: alignment, child: text));
  }

  ///
  ///
  ///
  void addCheckBox({String? key, Text? label}) {
    _children.add(
      Theme(
        data: ThemeData(unselectedWidgetColor: _dark ? Colors.white : Colors.grey),
        child: CheckFormFiled(
          label: label ??
              Text(
                "checked",
                // style: TextStyle(color: _textColor),
              ),
          onSaved: (value) {
            print("saved:$value");
            maps[key ?? "field${maps.length}"] = value;
          },
        ),
      ),
    );
  }

  ///
  /// 设置图片背景
  ///
  void setBackgroundImage(DecorationImage? image, {double? opacity, BoxFit? fit}) {
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

  ///
  /// 设置渐变背景
  ///
  void setBackGroundGradient(Gradient gradient) {
    _gradient = gradient;
  }

  ///
  /// 返回结构数据
  /// map key is 'field[0..n]' to get data. if not set it in add method
  ///
  Future<DialogResult<Map<String, Object?>?>?> show() {
    return Navigator.of(context, rootNavigator: true).push<DialogResult<Map<String, Object?>?>?>(
      _dialogBuilder<DialogResult<Map<String, Object?>?>?>(context, null),
    );
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
        return Theme(
          data: ThemeData(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith(
                  (states) => TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            dialogTheme: DialogTheme(
              backgroundColor: _backgroundColor,
              // 这个是Dialog的背景色，优先级高于Theme.backgroundColor, 低于Dilaog.backgroundColor
              shape: const RoundedRectangleBorder(borderRadius: _borderRadius),
              // 这个是Dialog的外边框
              elevation: 12.0,
              // alignment: Alignment.bottomCenter
              titleTextStyle: TextStyle(color: _textColor, fontWeight: FontWeight.bold, fontSize: 20, shadows: kElevationToShadow[4]),
              contentTextStyle: TextStyle(
                color: _textColor,
              ),
            ),
          ),
          child: Builder(
            builder: (context) {
              return AlertDialog(
                // shape: const RoundedRectangleBorder(borderRadius: _borderRadius),
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
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                      alignment: titleAlignment ?? Alignment.centerLeft,
                      child: Text(
                        title ?? "Dialog",
                        style: Theme.of(context).dialogTheme.titleTextStyle,
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
                  // Action 没有 Cupertino和materialdesign的区分，会自动区分
                  TextButton(
                    child: Text(
                      okButton ?? "Ok",
                      style: Theme.of(context).textButtonTheme.style?.textStyle?.resolve(<MaterialState>{MaterialState.selected}),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pop(context, DialogResult<Map<String, Object?>?>(status: true, code: 200, msg: "back", data: maps));
                      }
                    },
                  ),
                  TextButton(
                    child: Text(
                      cancelButton ?? "Cancel",
                      style: Theme.of(context).textButtonTheme.style?.textStyle?.resolve({MaterialState.selected})?.copyWith(color: _hintColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context, const DialogResult<Map<String, Object?>?>(status: false, code: 400, msg: ""));
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

///
/// 选择接口，适用表单项。
///
class CheckFormFiled extends FormField<bool> {
  CheckFormFiled({
    Key? key,

    /// Typically an [Text] for label
    Widget? label,
    FormFieldSetter<bool>? onSaved,
    bool? enabled,
    MaterialStateProperty<Color?>? fillColor,
    Color? checkColor,
  }) : super(
          key: key,
          onSaved: onSaved,
          initialValue: false,
          enabled: enabled ?? true,
          builder: (FormFieldState<bool> field) {
            _CheckFormFieldState state = field as _CheckFormFieldState;
            return Focus(
              canRequestFocus: true,
              focusNode: state._focusNode,
              child: GestureDetector(
                // borderRadius: _formFieldBorderRadius, // 这里长按的阴影部分和显示部分倒角一致
                onTap: () {
                  if (state._focusNode.hasFocus) {
                    state._focusNode.unfocus();
                  } else {
                    state._focusNode.requestFocus(); // 获得焦点
                  }
                },
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: _formFieldBorderRadius,
                    border: Border.all(color: state._focused ? Theme.of(state.context).primaryColor : Colors.grey, width: state._focused ? 2.0 : 1.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        label ??
                            Text(
                              "",
                              style: Theme.of(state.context).dialogTheme.contentTextStyle,
                            ),
                        Checkbox(
                          value: state.checkable,
                          splashRadius: 5.0,
                          onChanged: (value) {
                            field.checkable = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );

  @override
  _CheckFormFieldState createState() => _CheckFormFieldState();
}

class _CheckFormFieldState extends FormFieldState<bool> {
  final FocusNode _focusNode = FocusNode();

  bool _checkable = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocus);
  }

  _handleFocus() {
    if (_focusNode.hasFocus != _focused) {
      print("has focus ${_focusNode.hasFocus}  $_focused");
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocus);
    _focusNode.dispose();
    super.dispose();
  }

  set checkable(bool checkable) {
    setState(() {
      _checkable = checkable;
    });
    setValue(_checkable);
    _focusNode.requestFocus();
  }

  @protected
  bool get checkable => _checkable;
}

///
class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField({
    Key? key,
  }) : super(
            key: key,
            initialValue: DateTime.now(),
            onSaved: (v) {},
            builder: (FormFieldState<DateTime> field) {
              final _DatePickerFormFieldState<DateTime> state = field as _DatePickerFormFieldState<DateTime>;
              return Focus(
                canRequestFocus: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Label"),
                    // OutlinedButton(
                    //   onPressed: () {
                    //     showDatePicker(
                    //       context: state.context,
                    //       initialDate: DateTime.now(),
                    //       firstDate: DateTime.parse("1970-01-01"),
                    //       lastDate: DateTime.now(),
                    //     ).then((value) => state.didChange(value));
                    //   },
                    //   child: Text("${state.value ?? "--"}"),
                    // )
                  ],
                ),
              );
            });

  @override
  FormFieldState<DateTime> createState() => _DatePickerFormFieldState<DateTime>();
}

class _DatePickerFormFieldState<DateTime> extends FormFieldState<DateTime> {
  @override
  void didChange(DateTime? value) {
    super.didChange(value);
    // final DatePickerFormField datePickerFormField = widget as DatePickerFormField;
    // assert(datePickerFormField.onChanged != null);
    // datePickerFormField.onChanged!(value);
  }

  @override
  void didUpdateWidget(covariant FormField<DateTime> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }
}
