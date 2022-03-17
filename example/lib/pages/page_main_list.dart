import 'package:flutter/material.dart';
import 'package:plumedemo/main.dart';

///
/// 主页列表项
///
class MainListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(5.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(5.0),
                minVerticalPadding: 5.0,
                horizontalTitleGap: 5.0,
                shape: RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(5.0))),
                title: Text("模块[$index]: ${LIST[index].values.first}"),
                onTap: () {
                  var name = LIST[index].keys.first;
                  Navigator.of(context).pushNamed(name);
                },
              ),
            );
          },
          itemCount: LIST.length,
        ),
      ),
    );
  }
}


