import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/framework/drawer.dart';
import 'package:plume/styles/plume_theme.dart';

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

class _FrameworkDrawerState extends State<_FrameworkDrawerBody> {
  List<Widget> _children = [];
  DrawerHeader? _drawerHeader;
  Widget? _drawerFooter;

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
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _children.add(
                  Text("菜单${_children.length + 1}"),
                );
              },
              child: Text("添加菜单"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_drawerHeader == null) {
                  _drawerHeader = DrawerHeader(
                      child: Container(
                    child: Text("header"),
                  ));
                } else {
                  _drawerHeader = null;
                }
                setState(() {});
              },
              child: _drawerHeader == null ? Text("开启Header区域") : Text("关闭Header区域"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_drawerFooter == null) {
                  _drawerFooter = Container(
                    child: Text("footer"),
                  );
                } else {
                  _drawerFooter = null;
                }
                setState(() {

                });
              },
              child: _drawerFooter == null ? Text("开启Footer区域") : Text("关闭Footer区域"),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text("d"),
            )
          ],
        ),
      ),
      drawer: DrawerBuilder.drawer(context,
          delegate: DrawerChildListDelegate(
            children: _children,
            enable: true,
            header: _drawerHeader,
            footer: _drawerFooter,
          )),
    );
  }
}
