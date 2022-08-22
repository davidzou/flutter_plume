import 'package:flutter/material.dart';
import 'package:plume/framework/container/drawer.dart';
import 'package:plume/styles/plume_theme.dart';
import 'package:plume/colors/gradient.dart';

const TextStyle _textStyle = TextStyle(fontSize: 20.0);
final ButtonStyle _buttonStyle = ButtonStyle(padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.all(15.0)));
const EdgeInsetsGeometry _padding = EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0);

///
/// used by [lib/framework/drawer.dart]
///
class FrameworkDrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FrameworkDrawerBody();
  }
}

class _FrameworkDrawerBody extends StatefulWidget {
  @override
  _FrameworkDrawerState createState() => _FrameworkDrawerState();
}

class _FrameworkDrawerState extends State<_FrameworkDrawerBody> with DrawerProperty {
  DrawerHeader? _drawerHeader;
  Widget? _drawerFooter;

  ValueNotifier<bool> isOpenHeader = ValueNotifier(false);
  ValueNotifier<bool> isOpenFooter = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    addItem(ListTile(title: Text("abc"), subtitle: Text("abcdefghijklmnopqrstuvwxyz"),));
  }

  @override
  void dispose() {
    isOpenHeader.dispose();
    isOpenFooter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Drawer",
          style: DefaultThemes().appBarTextStyle,
        ),
        backgroundColor: Colors.tealAccent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              return _createButton("添加菜单", onPressed: () {
                addItem(Text("菜单${itemLength() + 1}"));
                Scaffold.of(context).openDrawer();
              });
            },
          ),
          StatefulBuilder(builder: (context, setState) {
            return _createButton(
              _drawerHeader == null ? "开启Header区域" : "关闭Header区域",
              onPressed: () {
                if (_drawerHeader == null) {
                  _drawerHeader = _createDrawerHeader();
                } else {
                  _drawerHeader = null;
                }
                setState(() {});
              },
            );
          }),
          StatefulBuilder(builder: (context, setState) {
            return _createButton(
              _drawerFooter == null ? "开启Footer区域" : "关闭Footer区域",
              onPressed: () {
                if (_drawerFooter == null) {
                  _drawerFooter = SafeArea(child: Container(child: Text("footer")));
                } else {
                  _drawerFooter = null;
                }
                setState(() {});
              },
            );
          }),
          _createButton("title"),
        ],
      ),
      drawer: DrawerBuilder.drawer(
        context,
        // width: 300.0,
        // elevation: 2.0,
        delegate: DrawerChildListDelegate(
          children: drawerItems(),
          enable: true,
          header: ValueListenableBuilder(valueListenable: isOpenHeader, builder: (context, value, child) {
            print("open header $value");
            return _drawerHeader ?? Container();
          }),
          footer: ValueListenableBuilder(valueListenable: isOpenFooter, builder: (context, value, child) {
            print("open footer $value");
            return _drawerFooter ?? Container();
          }),
          // header: _drawerHeader,
          // footer: _drawerFooter,
        ),
      ),
    );
  }

  _createButton(String title, {VoidCallback? onPressed}) {
    return Container(
      key: ValueKey(title),
      padding: _padding,
      child: ElevatedButton(
        key: ValueKey(title),
        style: _buttonStyle,
        onPressed: onPressed,
        child: Text(
          title,
          style: _textStyle,
        ),
      ),
    );
  }

  ///
  /// 创建默认的DrawerHeader
  ///
  _createDrawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(gradient: LinearGradient(colors: Vanusa)),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text("header"),
      ),
    );
  }
}

mixin DrawerProperty {
  List<Widget> _drawerItems = [];

  addItem(Widget child) {
    _drawerItems.add(child);
  }

  bool removeItem(Widget child) {
    return _drawerItems.remove(child);
  }

  Widget removeItemAt(int index) {
    return _drawerItems.removeAt(index);
  }

  Widget getItem(int index) {
    return _drawerItems.elementAt(index);
  }

  int itemLength() {
    return _drawerItems.length;
  }

  List<Widget> drawerItems() {
    return _drawerItems;
  }
}
