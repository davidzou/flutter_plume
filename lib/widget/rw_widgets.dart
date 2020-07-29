import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plume/styles/flat.dart';

/// 日历回调
typedef CalenderCallback = void Function(DateTime dateTime);

///
/// 内容形
///
/// +-------------------------+
/// ｜ title                  ｜
/// ｜ content                ｜
/// +-------------------------+
///
class Content extends StatelessWidget {
  Content({Key key, this.title, this.content})
      : assert(title != null),
        assert(content != null),
        super(key: key);

  /// 标题，label
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 1.0,
            height: FlatStyles.lineSpace,
          ),
          Container(
            width: double.infinity,
            padding: FlatStyles.padding,
            decoration: FlatStyles.decoration,
            child: Text(
              content,
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          )
        ],
      ),
    );
  }
}

///
/// 日历选择
///
/// +-----------------------------------+
/// ｜ title                            ｜
/// ｜                                  ｜
/// ｜    0000 00-00      icon          ｜
/// +-----------------------------------+
///
class Calender extends StatefulWidget {
  Calender(this.title, {Key key, this.onDays, this.notifier, this.enable})
      : super(key: key);

  final String title;

  final DateTime onDays;

  ///
  /// 是否开启设置
  ///
  final bool enable;

  ///
  /// 当数据改变时的回调
  ///
  final CalenderCallback notifier;

  @override
  CalenderState createState() => CalenderState(onDays: onDays, enable: enable);
}

class CalenderState extends State<Calender> {
  CalenderState({this.onDays, this.enable});

  DateTime onDays;
  bool enable;

  @override
  void initState() {
    super.initState();
    if (onDays == null) {
      setState(() {
        onDays = DateTime.now();
      });
    }
  }

  _handleDateTime({time}) {
    assert(time != null);
    setState(() {
      onDays = time;
    });
    widget.notifier.call(time);
  }

  _handleOnPressed(BuildContext context) {
    return () {
      if (!widget.enable) {
        return;
      }
      showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().subtract(new Duration(days: 365 * 3)),
        lastDate: new DateTime.now().add(new Duration(days: 365 * 3)),
      ).then((DateTime val) {
        print(val); // 2018-07-12 00:00:00.000
        _handleDateTime(time: val);
      }).catchError((err) {
        print(err);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        // 左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 1.0,
            height: FlatStyles.lineSpace,
          ),
          ImageButton(
            title: "${onDays?.year} ${onDays?.month}-${onDays?.day}",
            right: Icon(
              Icons.calendar_today,
              color: Colors.teal,
            ),
            onPressed: _handleOnPressed(context),
          ),
        ],
      ),
    );
  }
}

/// and used by plume ^0.0.3+
/// 图标文字控件，类似Android的Image。
///
/// +-------------------------------+
/// |           topIcon             |
/// |                               |
/// | leftIcon    title   rightIcon |
/// |                               |
/// |          bottomIcon           |
/// +-------------------------------+
///
class ImageButton extends StatelessWidget {
  const ImageButton(
      {Key key,

      /// 文字和图片间的间距
      this.spaceSize = 16.0,
      this.title,
      this.textStyle,
      this.color,
      this.constraints,
      this.padding,
      this.decoration,
      this.left,
      this.right,
      this.top,
      this.bottom,
      this.onPressed})
      : assert(title != null),
        assert(
            color == null || decoration == null,
            'Cannot provide both a color and a decoration\n'
            'To provide both, use "decoration: BoxDecoration(color: color)".'),
        super(key: key);

  /// 文字
  final String title;
  final TextStyle textStyle;
  final Color color;
  final EdgeInsetsGeometry padding;
  final BoxConstraints constraints;
  final Decoration decoration;
  final Icon left;
  final Icon right;
  final Icon top;
  final Icon bottom;
  final VoidCallback onPressed;

  /// 文字和logo中间的间隔
  final double spaceSize;

  final Color edge = const Color(0xffcccccc);

  /// 边框宽度
  final double edgeWidth = 1.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: textStyle ?? TextStyle(fontSize: 14.0, color: Colors.grey),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          color: color,
          padding: padding ?? FlatStyles.padding,
          decoration: decoration ?? FlatStyles.decoration,
          constraints: constraints,
          child: _selectWidget(title, left, right, top, bottom),
        ),
      ),
    );
  }

  _selectWidget(String title, Icon left, Icon right, Icon top, Icon bottom) {
    if (left != null) {
      // 左右结构，左图右文字
      return Row(
        children: <Widget>[
          left,
          SizedBox(
            width: spaceSize,
            height: 1.0,
          ),
          Text(title),
        ],
      );
    }
    // 左右结构，左文字右图
    if (right != null) {
      return Row(
        children: <Widget>[
          Text(title),
          SizedBox(
            width: spaceSize,
            height: 1.0,
          ),
          right,
        ],
      );
    }
    // 上下结构, 上图下文字
    if (top != null) {
      return Column(
        children: <Widget>[
          top,
          SizedBox(
            width: 1.0,
            height: spaceSize,
          ),
          Text(title),
        ],
      );
    }
    // 上下结构，上文字下图
    if (bottom != null) {
      return Column(
        children: <Widget>[
          Text(title),
          SizedBox(
            width: 1.0,
            height: spaceSize,
          ),
          bottom,
        ],
      );
    }
    return Text(title);
  }
}
