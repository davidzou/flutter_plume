import 'package:flutter/material.dart';
import 'package:plume/framework/builder/list_builder.dart';

class ListBuilderPage extends StatefulWidget {
  const ListBuilderPage({Key? key}) : super(key: key);

  @override
  State<ListBuilderPage> createState() => _ListBuilderPageState();
}

class _ListBuilderPageState extends State<ListBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListBuilder"),),
      body: ListWidget(),
    );
  }
}


///
/// Step1: 定义数据模型，用于ListBuilder显示的单元数据
/// List Item 数据模型类。
///
class MessItem implements ListItem {
  MessItem({required this.name});

  String name;
}

///
/// Step2：构建展示逻辑，及对应的数据展示
///
class ListBuilder extends ListViewBuilder<MessItem> {
  ListBuilder({
    List<MessItem>? list,
    required ScrollController scrollController,
    VoidCallback? onPullToRefreshed,
    VoidCallback? onLoadingMore,
  }) : super(
    list: list,
    controller: scrollController,
    onPullToRefreshed: onPullToRefreshed,
    onLoadingMore: onLoadingMore,
  );

  @override
  Widget itemBuild(BuildContext context, MessItem item, int index) {
    return ListTile(
      title: Text("${item.name}-$index"),
    );
  }
}

///
/// STEP3 ListWidget
///
class ListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListWidgetState();
  }
}

class ListWidgetState extends State<ListWidget> {
  late ListBuilder _listBuilder;
  // List<MessItem> array = [];

  @override
  void initState() {
    // for (int i = 0; i < 20; i++) {
    //   array.add(MessItem(name: "name-default$i"));
    // }
    super.initState();
    _listBuilder = ListBuilder(
        // list: array,
        scrollController: ScrollController(),
        onPullToRefreshed: () {
          print("voidCallback update list");
          setState(() {
            _listBuilder.list =
                List.generate(20, (index) => MessItem(name: "name-new"));
          });
        },
        onLoadingMore: () {
          // await Future.delayed(Duration(seconds: 3));
          setState(() {
            for(int i = 0; i < 5; i ++) {
              _listBuilder.list.add(MessItem(name: "name-more"));
              // array.add(MessItem(name: "name-more"));
            }
          });
        })
      ..init();
  }

  @override
  void dispose() {
    _listBuilder.dispose();
    // array.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _listBuilder.build();
  }
}