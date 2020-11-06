import 'dart:collection';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/builder/list_builder.dart';
import 'package:plume/builder/list_builder.dart';
import 'package:plume/widget/counter.dart';
import 'package:plume/widget/head.dart';
import 'package:plume/taste/taste.dart';
import 'package:plume/widget/rw_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Retrieve Text Input', home: ListWidgetApp());
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
                maxLengthEnforced: false,
                enabled: false,
                decoration: null,
                controller: myController,
              ),
            ),
            SpinnerWidget(),
            Calender(
              "时间设置",
              onDays: DateTime.now(),
            )
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

///
/// Step1: 定义数据模型
/// List Item 数据模型类。
///
class MessItem implements ListItem {
  MessItem({this.name});

  String name;
}

///
/// Step2：构建展示逻辑
///
class ListBuilder extends ListViewBuilder<MessItem> {

  ListBuilder({
    List<MessItem> list,
    ScrollController scrollController,
    VoidCallback onPullToRefreshed,
    VoidCallback onLoadingMore,
  }) : super(
          list: list,
          scrollController: scrollController,
          onPullToRefreshed: onPullToRefreshed,
          onLoadingMore: onLoadingMore,
        );

  // @override
  // onLoadMore() {
  //   /// 业务逻辑
  //   return super.onLoadMore();
  // }

  @override
  Widget itemBuild(BuildContext context, MessItem item, int index) {
    return Container(
      child: Text(item.name),
    );
  }
}

class ListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListWidgetState();
  }
}

class ListWidgetState extends State<ListWidget> {
  ListBuilder _listBuilder;
  List<MessItem> array;

  @override
  void initState() {
    array = new List();
    for (int i = 0; i < 20; i++) {
      array.add(MessItem(name: "name-$i"));
    }
    super.initState();
  }

  @override
  void dispose() {
    _listBuilder.dispose();
    array.clear();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    print("object build");
    _listBuilder = ListBuilder(
      list: array,
      scrollController: ScrollController(),
      onPullToRefreshed: () {
        print("voidCallback update list");
        setState(() {
          array = List.generate(20, (index) => MessItem(name: "name-new$index"));
        });
      },
      onLoadingMore: () async {
        await Future.delayed(Duration(seconds: 3));
        setState(() {
          array.add(MessItem(name: "name-more"));
        });
      }
    )..init();
    return _listBuilder.build();
  }
}

class ListWidgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: ListWidget(),
    );
  }
}
