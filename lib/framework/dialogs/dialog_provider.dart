import 'package:flutter/material.dart';
import 'package:plume/framework/container/ternary.dart';
import 'package:plume/framework/dialog.dart';

/// 统一圆角值
const double _radiusValue = 18.0;
const BorderRadius _borderRadius = const BorderRadius.all(const Radius.circular(_radiusValue));

/// FormBuild OutLineBorder
const OutlineInputBorder _outlineInputBorder = const OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(8.0)));

const kDarkBarrierColor = const Color(0xaa000000);
const kLightBarrierColor = const Color(0x9effffff);
const kOutLineInputBorder = _outlineInputBorder;

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
    _backgroundColor = _dark ? Colors.black45 : Colors.white70;
    _textColor = _dark ? Colors.white : Colors.black87;
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
    _children.add(Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: obscureText ?? inputType == TextInputType.visiblePassword ? true : false,
        autofocus: true,
        decoration: inputDecoration ??
            const InputDecoration(
              label: const Text("label"),
              border: _outlineInputBorder,
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
          print("onSaved");
        },
      ),
    ));
  }

  void addDropDownButton<T>({String? key, List<T>? values, DropMenuItemWidgetBuilder? builder}) {
    if (values == null || values.isEmpty) return;
    T currentValue = values.first;
    _children.add(
      StatefulBuilder(builder: (context, StateSetter setState) {
        return DropdownButtonFormField<T>(
          value: values.first,
          // icon: Icon(Icons.safety_check),
          items: values
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  child: builder == null ? Padding(padding: EdgeInsets.symmetric(horizontal: 10.0), child: Text("$e")) : builder.call(context, e),
                  onTap: () {},
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              currentValue = value!;
            });
          },
          onSaved: (value) {
            maps[key ?? "field${maps.length}"] = value;
          },
          validator: (value) {
            print(value);
            return null;
          },
        );
      }),
    );
  }

  addFo() {
    // _children.add(
    //   InputDatePickerFormField(
    //     firstDate: DateTime.now().subtract(Duration(days: 30)),
    //     lastDate: DateTime.now().add(Duration(days: 30)),
    //     onDateSaved: (time) {
    //       maps["time${maps.length}"] = time.toString();
    //     },
    //   ),
    // );
  }

  addChoiceFormField() {
    print("choiceForm");
    _children.add(ChoiceChip(
      label: Text("label"),
      selected: false,
      onSelected: (v) {},
    ));
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
                  style: TextStyle(color: _textColor, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              content: Container(
                // height: _children.length > 2 ? 200 : null,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: _children,
                    ),
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
                  style: TextStyle(fontSize: 20, color: Colors.grey),
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
