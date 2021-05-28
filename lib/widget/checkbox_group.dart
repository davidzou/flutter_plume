
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plume/framework/value_changed.dart';

///
///
///
typedef CheckBoxGroupCallback = Function(int index, bool? value);

///
/// 可折叠的多选列表
///
/// ### 未展开状态
/// ```
///   +---------------------------------+
///   | [-] MainTitle                V  |
///   +---------------------------------+
/// ```
/// ### 展开状态
/// ```
///   +---------------------------------+
///   | [-] MainTitle                V  |
///   +---------------------------------+
///   |       SubTitle           [X]    |
///   |       SubTitle           [X]    |
///   |       SubTitle           [ ]    |
///   |       SubTitle           [X]    |
///   +---------------------------------+
/// ```
///
/// ### 参数
/// * 主标题内容
/// * 主标题选择状态
/// * 次标题列表
/// * 次标题状态，包含次标题下标
///
///
class CheckBoxGroup extends StatefulWidget {
  const CheckBoxGroup(this.header, {required this.subTitle, this.subCheckable, this.callback});

  /// 标题
  final String header;

  /// 主标题显示，可以是多组
  final List<String> subTitle;

  /// 默认选择状态
  final List<bool>? subCheckable;

  final CheckBoxGroupCallback? callback;

  @override
  _CheckBoxGroupState createState() => _CheckBoxGroupState();
}

class _CheckBoxGroupState extends State<CheckBoxGroup> {
  /// 主选择项折叠状态监听
  late ValueNotifier<bool> _expandedNotified;

  /// 主选择项状态改变监听
  late ValueNotifier<bool?> _parentNotified;

  ///  子选择项状态改变监听
  late MultiValueNotifier<bool> _subChildNotified;

  @override
  void initState() {
    super.initState();
    _expandedNotified = ValueNotifier(false);
    _parentNotified = ValueNotifier(false);
    _subChildNotified = MultiValueNotifier(widget.subCheckable ?? widget.subTitle.map((e) => false).toList());
    _parentValueChanged();
  }

  ///
  /// 改变主选择状态，根据子控件如果默认初始化状态显示。
  ///
  void _parentValueChanged() {
    /// 用于检测是否全选状态
    bool checkAllTrue = true;

    /// 用于检测是否全不选状态
    bool checkAllFalse = true;
    _subChildNotified.value.forEach((element) {
      checkAllTrue = checkAllTrue & element;
      checkAllFalse = checkAllFalse & !element;
    });
    if (checkAllTrue) {
      // 子全选状态下，父全选
      _parentNotified.value = true;
    } else if (checkAllFalse) {
      // 子全不选状态下，父不选
      _parentNotified.value = false;
    } else {
      // 子部分选状态下，父部分
      _parentNotified.value = null;
    }
  }

  MaterialStateProperty<Color?> _getBorderColor(bool expanded) {
    return !expanded ? _unExpandedFillColor : _expandedFillColor;
  }

  static MaterialStateProperty<Color?> _unExpandedFillColor = MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.contains(MaterialState.disabled)) {
      return ThemeData.from(colorScheme: ColorScheme.light()).disabledColor;
    }
    if (states.contains(MaterialState.selected)) {
      return ThemeData().toggleableActiveColor;
    }
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return ThemeData().unselectedWidgetColor;
  });
  static MaterialStateProperty<Color?> _expandedFillColor = MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.contains(MaterialState.disabled)) {
      return ThemeData.from(colorScheme: ColorScheme.light()).disabledColor;
    }
    if (states.contains(MaterialState.selected)) {
      return ThemeData().toggleableActiveColor;
    }
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.blue;
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _expandedNotified,
      builder: (BuildContext context, bool expandValue, Widget? child) {
        return ExpansionTile(
          // 这里是选择框，三种状态，全选状态，如果详情中未全选中，则显示半选中状态，否则全部不选中。
          leading: ValueListenableBuilder(
            valueListenable: _parentNotified,
            builder: (BuildContext context, bool? value, Widget? child) {
              return Checkbox(
                value: _parentNotified.value,
                // 这里要判断子类的选择项
                tristate: true,
                fillColor: _getBorderColor(expandValue),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.standard,
                onChanged: (value) {
                  _parentNotified.value = (value ?? false);
                  _subChildNotified.value.forEach((element) {
                    int index = _subChildNotified.value.indexOf(element);
                    _subChildNotified[index] = _parentNotified.value ?? false;
                    widget.callback?.call(index, value);
                  });
                  // }
                },
              );
            },
          ),
          title: Text(widget.header),
          expandedAlignment: Alignment.centerRight,
          onExpansionChanged: (value) {
            // 折叠被展开
            _expandedNotified.value = value;
          },
          // 子列表
          children: widget.subTitle
              .map((e) => FractionallySizedBox(
            widthFactor: 0.8,
            child: ValueListenableBuilder(
              valueListenable: _subChildNotified,
              builder: (BuildContext context, List<bool> value, Widget? child) {
                int index = widget.subTitle.indexOf(e);
                return Row(children: [
                  Checkbox(
                      value: _subChildNotified.value[index],
                      onChanged: (value) {
                        // 子选择项改变状态
                        _subChildNotified[index] = value!;
                        _parentValueChanged();
                        widget.callback?.call(index, value);
                      }),
                  child!,
                ]);
              },
              child: Expanded(child: Text(e)),
            ),
          ))
              .toList(),
        );
      },
    );
  }
}