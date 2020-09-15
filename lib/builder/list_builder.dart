import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// 列表回调
/// @param t  单个列表数据模型
/// @param index 下标
///
typedef OnItemTaped<T extends ListItem> = void Function(BuildContext context, T t, int index);

///
///
///
mixin ListItem {}

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
///     Widget itemBuild(MessListItem item, int index) {
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
  ListViewBuilder({this.list, this.onItemTap, this.height});

  /// 数据列表
  final List<T> list;

  /// 单个控件点击事件
  final OnItemTaped<T> onItemTap;

  /// 高度
  final int height;

  ///
  /// 单个List自定义控件
  ///
  /// @param item   Item布局对应的数据模型
  /// @param index  数据下标
  ///
  Widget itemBuild(BuildContext context, T item, int index);

  ///
  /// 空数据状态下的界面显示内容
  ///
  Widget buildBlank() {
    return Text("没有数据");
  }

  Widget build() {
    if (list == null || list?.length == 0) {
      return Container(
        child: buildBlank(),
      );
    }
    return Scrollbar(
      child: ListView.builder(

          // 这里是列表数量，如果不添加不会显示，还会报错哦！
          itemCount: list?.length,

          // 使用构建器显示列表内容
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: height ?? 80,
                child: InkWell(
                  onTap: () => onItemTap(context, list[index], index),

                  // 列表布局
                  child: itemBuild(context, list[index], index),
                ));
          }),
    );
  }
}
