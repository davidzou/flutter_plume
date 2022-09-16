import 'package:flutter/material.dart';

///
/// 列表回调
/// @param t  单个列表数据模型
/// @param index 下标
///
typedef OnItemTaped<T extends ListItem> = void Function(T t, int index);

///
/// 列表内容类型接口
///
mixin ListItem {}

///
/// 加载更多
///
/// @param T 加载更多数据
///
mixin RefreshMore<T> {
  Future<T> onLoadMore();
}

///
/// 标准列表构建类<br>
/// 通过继承实现不同List的构造创建。
///
/// ### Example:
/// ```dart
///   class MessListItem implements ListItem{
///     MessListItem(this.name);
///     String name;
///   }
///
///   class MessListBuilder extends ListViewBuilder<MessListItem> {
///     MessListBuilder(List<MessListItem> list, OnItemTaped<MessListItem> onItemTap) : super(list, onItemTap);
///
///     @override
///     Widget itemBuild(BuildContext context, MessListItem item, int index) {
///       return Text(item.name);
///     }
///   }
/// ```
///
/// 默认空数据页返回空数据文字，如果需要自定义，重写buildBlank方法。
/// ```dart
///   class MessListBuilder extends ListViewBuilder<MessListItem> {
///     ...
///
///     @override
///     Widget buildBlank() {
///       return Text("Blank");
///     }
///   }
/// ```
///
/// 创建列表页
/// ```dart
///  @override
///  Widget build(BuildContext context) {
///    return Container(
///      child: MessListBuilder(
///          list: _list,
///          onItemTap: (item, index) {
///             print(_list[index]);
///            /// 显示详情
///            _showDetails(_list[index].mess);
///          }).build(),
///    );
///  }
///  ```
///
abstract class ListViewBuilder<T extends ListItem> {
  ListViewBuilder({
    List<T>? list,
    this.onItemTap,
    this.height,
    ScrollController? controller,
    this.blankTitle = "",
    this.onPullToRefreshed,
    this.onLoadingMore,
  })  : scrollController = controller ?? ScrollController(),
        _list = list ?? [];

  /// 数据列表
  List<T> _list;

  /// 单个控件点击事件
  final OnItemTaped<T>? onItemTap;

  /// 高度(一个控件的高度)
  final double? height;

  final ScrollController scrollController;

  /// list的长度为0时，显示的文字内容。
  final String blankTitle;

  /// 状态改变
  final VoidCallback? onPullToRefreshed;

  /// 加载更多
  final VoidCallback? onLoadingMore;

  ValueNotifier<bool> _isLoadingNotifier = ValueNotifier(false);

  /// 是否加载中
  // bool isLoading = false;

  List<T> get list => _list;
  set list(List<T> list) {
    _list.clear();
    _list.addAll(list);
  }
  void add(T t) {
    _list.add(t);
  }

  ///
  /// 单个List自定义控件
  ///
  /// @param item   Item布局对应的数据模型
  /// @param index  数据下标
  ///
  Widget itemBuild(BuildContext context, T item, int index);

  ///
  /// 构建下拉刷新区域内容
  ///
  Widget loadViewBuild() {
    return Visibility(
      child: Container(),
      visible: false,
    );
  }

  ///
  /// 初始化上拉刷新
  ///
  /// ```
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     print("object build");
  ///     _listBuilder = ListBuilder(
  ///       list: array,
  ///       scrollController: ScrollController(),
  ///       voidCallback: () {
  ///         print("voidCallback update list");
  ///         setState(() {
  ///           array = List.generate(20, (index) => MessItem(name: "name-new$index"));
  ///         });
  ///       }
  ///     )..init();  // 加载此功能
  ///     return _listBuilder.build();
  ///   }
  /// ```
  ///
  void init() {
    scrollController.addListener(() {
      print("pixels : ${scrollController.position.pixels} , max : ${scrollController.position.maxScrollExtent}");
      if (scrollController.position.pixels - scrollController.position.maxScrollExtent > 100) {
        // 最底部时加载数据。
        _onLoadMore();
        // isLoading = true;
        _isLoadingNotifier.value = true;
      }
    });
  }

  void dispose() {
    /// 释放资源
    scrollController.dispose();
    _list.clear();
    print("list build dispose");
  }

  ///
  /// 空数据状态下的界面显示内容
  ///
  Widget buildBlank() {
    return Center(child: Text("没有可用数据"));
  }

  Widget build() {
    if (_list.length == 0) {
      return RefreshIndicator(
        child: Scrollbar(
          controller: scrollController,
          child: Container(
            child: Stack(
              children: [
                ListView(),
                buildBlank(),
              ],
            ),
          ),
        ),
        onRefresh: _doRefresh,
      );
    }
    return RefreshIndicator(
      child: Scrollbar(
        controller: scrollController,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: scrollController,
                    // 这里是列表数量，如果不添加不会显示，还会报错哦！
                    itemCount: _list.length,
                    // 使用构建器显示列表内容
                    itemBuilder: (BuildContext context, int index) {
                      // print("list index $index - ${list.length}");
                      // if (index == list.length) {
                      //   // return
                      // } else {
                      return onItemTap == null
                          ? Container(
                              height: height,
                              child: itemBuild(context, _list[index], index),
                            )
                          : Container(
                              height: height,
                              child: InkWell(
                                onTap: () => onItemTap!(_list[index], index),
                                // 列表布局
                                child: itemBuild(context, _list[index], index),
                              ),
                            );
                      // }
                    }),
              ),
              // Divider(),
              // 加载中，及加载状态区域
              ValueListenableBuilder(
                  valueListenable: _isLoadingNotifier,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return Visibility(
                      visible: value,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RefreshProgressIndicator(
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Center(child: Text("加载中")),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
      onRefresh: _doRefresh,
    );
  }

  ///  下拉刷新事件
  Future _doRefresh() async {
    // return onLoadRefresh();
    await Future.delayed(Duration(seconds: 3));
    onPullToRefreshed?.call();
  }

  ///
  /// 加载更多
  /// 网络请求，数据刷新。
  ///
  _onLoadMore() {
    if (_isLoadingNotifier.value) {
      print("more has loading");
      return;
    }
    print("list build loding more");
    Future.delayed(Duration(seconds: 3), () {
      onLoadingMore?.call();
    }).whenComplete(() {
      // 加载完成。loadingMore 错误那么加载失败。
      _isLoadingNotifier.value = false;
      print("onLoadingMore completed  ${scrollController.positions}, ${scrollController.position.maxScrollExtent}");
      scrollController.animateTo(scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
    });
  }
}
