import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// 计数器<br>
///
/// 应用场景： 点赞数、喜欢数、回复数、转发数等，一般展示在个人首页或者整个Items布局的情形下。
///
/// +--------+
/// |  Like  |
/// |   10   |
/// +--------+
///
@deprecated
class Counter extends StatelessWidget {
  const Counter({Key? key, this.count = 0, this.title, this.padding})
      : super(key: key);

  final int count;
  final String? title;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(8.0),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: Duration(seconds: 3),
        onEnd: () {},
        child: Column(
          children: [
            Text(title!),
            Text("$count"),
          ],
        ),
      ),
    );
  }
}

@deprecated
class CounterController extends ValueNotifier {
  CounterController(value) : super(value);
}

class CounterRefresher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterRefreshState(
      title: "",
      onRefreshed: () {},
    );
  }
}

@deprecated
class CounterRefreshState extends StatefulWidget {
  const CounterRefreshState({Key? key, this.title, this.onRefreshed})
      : super(key: key);

  final String? title;
  final VoidCallback? onRefreshed;

  @override
  State<StatefulWidget> createState() {
    return CounterState();
  }
}

@deprecated
class CounterState extends State<CounterRefreshState> {
  late String _title;

  @override
  void initState() {
    super.initState();
    _title = widget.title ?? "";
  }

  refresh(String title) {
    setState(() {
      _title = title;
    });
    widget.onRefreshed!.call();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_title);
  }
}

//class CounterDisplay extends StatelessWidget {
//  CounterDisplay({this.count});
//
//  final int count;
//
//  @override
//  Widget build(BuildContext context) {
//    return Text('Count: $count');
//  }
//}
//
//class CounterIncrementor extends StatelessWidget {
//  CounterIncrementor({this.onPressed});
//
//  final VoidCallback onPressed;
//
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton(
//      onPressed: onPressed,
//      child: Text('Increment'),
//    );
//  }
//}
//
//class Counter extends StatefulWidget {
//  @override
//  _CounterState createState() => _CounterState();
//}
//
//class _CounterState extends State<Counter> {
//  int _counter = 0;
//
//  void _increment() {
//    setState(() {
//      ++_counter;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Row(children: <Widget>[
//      CounterIncrementor(onPressed: _increment),
//      CounterDisplay(count: _counter),
//    ]);
//  }
//}
