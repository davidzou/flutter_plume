import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/framework/drawer.dart';

///
/// used by [lib/framework/drawer.dart]
///
class FrameworkDrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      body: Container(),
      drawer: DrawerBuilder.drawer(context),
    );
  }
}
