import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    required this.list,
    this.onItemTap,
    this.height = 80,
    this.scrollController,
    this.blankTitle = "",
    this.onPullToRefreshed,
    this.onLoadingMore,
  });

  /// 数据列表
  final List<T> list;

  /// 单个控件点击事件
  final OnItemTaped<T>? onItemTap;

  /// 高度(一个控件的高度)
  final double height;

  final ScrollController? scrollController;

  /// list的长度为0时，显示的文字内容。
  final String blankTitle;

  /// 状态改变
  final VoidCallback? onPullToRefreshed;

  /// 加载更多
  final VoidCallback? onLoadingMore;

  /// 是否加载中
  bool isLoading = false;

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
    // if (scrollController != null) {
      scrollController?.addListener(() {
        if (scrollController?.position.pixels ==
            scrollController?.position.maxScrollExtent) {
          // 最底部时加载数据。
          _onLoadMore();
          isLoading = true;
        }
      });
    // }
  }

  void dispose() {
    /// 释放资源
    scrollController?.dispose();
    print("list build dispose");
  }

  ///
  /// 加载更多
  /// 网络请求，数据刷新。
  ///
  Future _onLoadMore() async {
    if (isLoading) {
      print("more has loading");
      return;
    }
    print("list build loding more");
    await Future.delayed(Duration(seconds: 3), () {
      onLoadingMore?.call();
    }).whenComplete(() =>
        // 加载完成。loadingMore 错误那么加载失败。
        isLoading = false);
  }

  ///
  /// 空数据状态下的界面显示内容
  ///
  Widget buildBlank() {
    return Center(child: Text("没有可用数据"));
  }

  Widget build() {
    if (list.length == 0) {
      return Container(
        child: buildBlank(),
      );
    }
    return RefreshIndicator(
      child: Scrollbar(
        child: ListView.builder(
            controller: scrollController,

            // 这里是列表数量，如果不添加不会显示，还会报错哦！
            itemCount: list.length + 1,

            // 使用构建器显示列表内容
            itemBuilder: (BuildContext context, int index) {
              print("list index $index - ${list.length}");
              if (index == list.length) {
                return Visibility(
                  visible: isLoading,
                  child: SizedBox(
                    child: Text("加载中"),
                  ),
                );
              } else {
                return
                  onItemTap == null ?
                  Container(
                    child: itemBuild(context, list[index], index),
                  )
                      : Container(
                    height: height,
                    child: InkWell(
                      onTap: () => onItemTap!(list[index], index),
                      // 列表布局
                      child: itemBuild(context, list[index], index),
                    ),
                  );
              }
            }),
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
}
