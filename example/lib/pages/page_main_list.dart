import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plumedemo/main.dart';

///
///
///
class MainListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title"),),
      body: Container(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Component[$index]: ${LIST[index].values.first}"),
            onTap: () {
              var name = LIST[index].keys.first;
              Navigator.of(context).pushNamed(name);
            },
          );
        }, itemCount: LIST.length,),
      ),
    );
  }
}

const LIST = [
  // 框架Drawer
  {FRAMEWORK_DRAWER_PAGE: "framework/DrawerBuilder"},
  {PERSPECTIVE_PAGE: "perspective"},
];