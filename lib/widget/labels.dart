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
        this.assetPath,
        // this.icon,
        this.iconColor = Colors.amberAccent,
        this.style = const TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold),
      })  : assert(label != null),
        assert(assetPath != null);

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
  AudioPlayer _audioPlayer;
  /// 声音图标动态刷新，播放时。
  ValueNotifier _valueNotifier = ValueNotifier(0);

  int _index = 0;
  var _volume = [Icons.volume_up, Icons.volume_down, Icons.volume_mute];

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  @override
  void dispose() {
    _audioPlayer?.dispose();
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
      print(e);
      setState(() {
        _visible = false;
      });
    }

    _audioPlayer.processingStateStream.listen((event) {
      print("index - ${event.index}");
      if(event == ProcessingState.completed) {
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
      for (; milliseconds < duration.inMilliseconds;) {
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
      children: [
        Text(
          widget.label,
          style: widget.style,
        ),
        Visibility(
          visible: _visible,
          child: ValueListenableBuilder(
            valueListenable: _valueNotifier,
            builder: (_, value, child) {
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
