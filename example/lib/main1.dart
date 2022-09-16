import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plume/framework/builder/list_builder.dart';
import 'package:plume/widget/counter.dart';
import 'package:plume/widget/head.dart';
import 'package:plume/taste/taste.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Retrieve Text Input', home: CardWidgetApp());
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                print("First text field: $text");
                myController.text = text;
              },
            ),
            Container(
              color: Colors.blueAccent,
              width: 80,
              child: TextField(
                maxLengthEnforcement: MaxLengthEnforcement.none,
                enabled: false,
                decoration: null,
                controller: myController,
              ),
            ),
            SpinnerWidget(),
            // Calender(
            //   "时间设置",
            //   onDays: DateTime.now(),
            // )
          ],
        ),
      ),
    );
  }
}

///
///
///
class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeadTitle.h1("我是标题H1"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeadTitle.h2("我是标题H2"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeadTitle.h3("我是标题H3"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeadTitle.h4("我是标题H4"),
            ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: HeadTitle.h5("我是标题H5"),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: HeadTitle.h6("我是标题H6"),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: HeadTitle("我是标题Normal"),
//              ),
            Counter(
              count: 0,
              title: "👍",
            )
          ],
        )),
      ),
    );
  }
}

class CounterState extends State {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Text("$_count");
  }
}



class CardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> with SingleTickerProviderStateMixin {
  var angle = [1, 2, 3, 4];
  double _angle = math.pi / 4;
  int index = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    Future.doWhile(() {
      setState(() {
        _angle = math.pi / angle[index % 4];
        index++;
      });
      print(" _angle: $_angle");
      sleep(Duration(milliseconds: 1000));
      return Future.value(index != 100);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      child: Container(
        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 100.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Text("c"),
      ),
    );
  }
}

class CardWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardView"),
        centerTitle: true,
      ),
      body: CardWidget(),
    );
  }
}
