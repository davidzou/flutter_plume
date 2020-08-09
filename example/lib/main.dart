import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/widget/head.dart';

void main() {
  runApp(MaterialApp(
    title: "",
    home: ExampleApp(),
  ));
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeadTitle.h1("我是标题H1"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeadTitle.h2("我是标题H2"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeadTitle.h3("我是标题H3"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeadTitle.h4("我是标题H4"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeadTitle.h5("我是标题H5"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeadTitle.h6("我是标题H6"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeadTitle("我是标题Normal"),
              ),
            ],
          )
        ),
      ),
    );
  }
}
