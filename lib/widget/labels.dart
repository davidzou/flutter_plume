import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:just_audio/just_audio.dart';

///
/// 所有的标签类控件。
///
///

///
/// 这是一个用于名词解释的标题，包含了一个声音的模块播放
///
/// 一般用户名称标题解释。或者用于词语查看之类。
///
///  ```
///  +----------+
///  | Label 🔊 |
///  +----------+
///  ```
///
/// ### Example:
///
///  ```
///   VoiceLabel(
///     "名词解释",
///     assetPath: "assets/audios/mcjs.mp3",
///   )
///  ```
///
class VoiceLabel extends StatefulWidget {
  VoiceLabel(
    this.label, {
    required this.assetPath,
    // this.icon,
    this.iconColor = Colors.amberAccent,
    this.style = const TextStyle(
        color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold),
  });

  /// 名词
  final String label;

  /// 声音文件路径
  final String assetPath;

  /// 名词样式
  final TextStyle style;

  /// 图标颜色
  final Color iconColor;

  // final Widget icon;

  @override
  State<StatefulWidget> createState() => _VoiceLabelState();
}

class _VoiceLabelState extends State<VoiceLabel> {
  /// 是否显示音频喇叭按钮图标，当有音频文件时为true且显示。否则相反。
  bool _visible = false;

  /// 声音播放插件
  late AudioPlayer _audioPlayer;

  /// 声音图标动态刷新，播放时。
  ValueNotifier<int> _valueNotifier = ValueNotifier(0);

  int _index = 0;
  var _volume = [Icons.volume_up, Icons.volume_down, Icons.volume_mute];
  late bool isDispose;

  @override
  void initState() {
    super.initState();
    _initAudio();
    isDispose = false;
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _valueNotifier.dispose();
    isDispose = true;
    super.dispose();
  }

  /// 初始化音频
  void _initAudio() async {
    _audioPlayer = AudioPlayer();
    try {
      var duration = await _audioPlayer.setAsset(widget.assetPath);
      setState(() {
        _visible = true;
      });
    } catch (e) {
      print("load error : $e");
      setState(() {
        _visible = true;
      });
    }

    _audioPlayer.processingStateStream.listen((event) {
      print("index - ${event.index}");
      if (event == ProcessingState.completed) {
        setState(() {
          _valueNotifier.value = _index = 0;
        });
      }
    });
  }

  void _playAudio() async {
    try {
      var duration = await _audioPlayer.load();
      // 播放音频
      _audioPlayer.play();
      // 根据播放的音频播放icon喇叭动画。
      int milliseconds = 0;
      for (; milliseconds < duration!.inMilliseconds;) {
        if (isDispose) {
          return;
        }
        print("$milliseconds  $_index");
        setState(() {
          _valueNotifier.value = _index = (_index + 1) % _volume.length;
        });
        await Future.delayed(Duration(milliseconds: 200));
        milliseconds += 200;
      }
      print("dispose");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            widget.label,
            style: widget.style,
            softWrap: true,
          ),
        ),
        Opacity(
          opacity: _visible ? 1.0 : 0.0,
          child: ValueListenableBuilder<int>(
            valueListenable: _valueNotifier,
            builder: (_, int value, child) {
              return IconButton(
                icon: Icon(
                  _volume[value],
                  color: widget.iconColor,
                ),
                onPressed: _playAudio,
              );
            },
          ),
        )
      ],
    );
  }
}

/// 数字选择器
class NumberSelector extends StatefulWidget {
  NumberSelector({
    this.leading = const Text(""),
    this.trailing,
    this.start,
    this.end,
    this.array,
    this.value,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.onChanged,
  }) : assert((start != null || end != null) || array != null);

  final Widget leading;
  final Widget? trailing;

  /// 数字选择器起始数字
  final int? start;

  /// 数字选择器终止数字
  final int? end;

  /// 默认值, 初始化值，当前那个值被选中。
  final int? value;

  /// 给定数组
  final List<int>? array;

  final Function(int? value)? onChanged;

  final MainAxisAlignment mainAxisAlignment;

  @override
  _NumberSelectorState createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  late List<int> _array;
  int? _value;

  @override
  void initState() {
    super.initState();
    if (widget.array != null) {
      _array = widget.array!;
    } else {
      _array = <int>[];
      for (int i = widget.start!; i < widget.end!; i++) {
        _array.add(i);
      }
    }
    _value = widget.value ?? _array[0];
    assert(_array.contains(_value));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 16.0),
            child: widget.leading,
          ),
          DropdownButton<int>(
            value: _value,
            items: _array
                .map((e) => DropdownMenuItem<int>(value: e, child: Text("$e")))
                .toList(),
            onChanged: (value) {
              _value = value;
              setState(() {});
              widget.onChanged?.call(_value);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 5.0),
            child: widget.trailing ?? Text(""),
          ),
        ],
      ),
    );
  }
}
