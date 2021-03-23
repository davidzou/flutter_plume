import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// 创建Drawer
///
/// * 把Drawer分成3部分，Header，Body， Footer。
/// * header可以隐藏，Body使用列表形式表现，内容自行构建，Footer用于显示版本，公司名称用。
///
/// ```
/// Scaffold(
///      drawer: DrawerBuilder.drawer(
///         delegate: SimpleDrawBuilderDelegate(
///             childCount: 3,
///             builder: (context, index){
///               return Text("");
///             }),
///         ),
///      )
/// ```
///
class DrawerBuilder {
  DrawerBuilder._();

  ///
  /// 标准Drawer创建
  ///
  /// * 包含头部信息。
  /// * 包含标题， 关于，帮助。
  /// * 包含版本标注。
  /// * 包含footer
  /// * 包含背景
  ///
  static Drawer drawer(BuildContext context, { DrawBuilderDelegate delegate, }) {
    Widget _builderHeader() {
      if (delegate.enableHeader()) {
        if (delegate.buildHeader() != null) {
          // 默认自定义
          return Container(
            width: double.infinity,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.black12,
                        Colors.orangeAccent,
                      ]
                  )
              ),
              child: Text("header"),
            ),
          );
        } else {
          // 自定义
          return Container(
            width: double.infinity,
            child: DrawerHeader(),
          );
        }
      } else {
        return Container(
          width: double.infinity,
        );
      }
    }
    List<Widget> _buildList(BuildContext context) {
      return delegate.buildList(context);
    }
    Widget _buildFooter() {
      return delegate.buildFooter();
    }
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // header
          _builderHeader(),
          // list buttons
          Expanded(
            child: ListView(
              children: _buildList(context),
            ),
          ),
          // footer
          _buildFooter(),
        ],
      ),
    );
  }

  void endDrawer() {}
}

///
/// Drawer代理
///
abstract class DrawBuilderDelegate {

  const DrawBuilderDelegate();

  /// 是否显示头部定制区域
  bool enableHeader();

  ///
  /// 定制头部
  /// * 可定制背景
  /// * 可定义内容
  ///
  DrawerHeader buildHeader();

  /// 构建菜单列表
  List<Widget> buildList(BuildContext context);

  /// 底部控件
  Widget buildFooter();
}

///
mixin DrawBuilderDelegateMiXin on DrawBuilderDelegate {
}

///
/// 简单实现
///
class SimpleDrawBuilderDelegate extends DrawBuilderDelegate {
  const SimpleDrawBuilderDelegate(
      {this.enable = false, this.childCount = 0, this.builder, this.footer, this.header}) ;

  /// 是否开启头部
  final bool enable;

  /// 列表数量
  final int childCount;

  /// Item创建
  final IndexedWidgetBuilder builder;

  final Widget footer;

  final DrawerHeader header;

  factory SimpleDrawBuilderDelegate.custom() {
    return SimpleDrawBuilderDelegate(
      enable: false,
      childCount: 1,
      builder: (context, index) {return Text("$index");},
      footer: null,
      header: null,
    );
  }

  @override
  Widget buildFooter() {
    return footer ?? Container(
      padding: EdgeInsets.all(8.0),
      child: Text("上海若紊科技有限公司"),
    );
  }

  @override
  DrawerHeader buildHeader() => header ?? null;

  @override
  List<Widget> buildList(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < childCount; i ++) {
      children.add(builder(context, i));
    }
    return children ?? [];
  }

  @override
  bool enableHeader() {
    return enable;
  }

}
