import 'package:flutter/material.dart';
import 'package:plume/styles/plume_theme.dart';
import 'package:plumedemo/pages/page_dialogs.dart';
import 'package:plumedemo/pages/page_flipable.dart';
import 'package:plumedemo/pages/page_framework_drawer.dart';
import 'package:plumedemo/pages/page_main_list.dart';
import 'package:plumedemo/pages/page_perspective.dart';



void main() {
  runApp(
    MaterialApp(
      // theme: ThemeData(
      //   primaryColor: MAIN_COLOR,
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      //   // unselectedWidgetColor: Colors.blue,
      // ),
      theme: DefaultThemes.base(),
      home: MainListPage(),
      routes: {
        // drawer
        FRAMEWORK_DRAWER_PAGE: (BuildContext context) => FrameworkDrawerPage(),
        // perspective
        PERSPECTIVE_PAGE: (BuildContext context) => PerspectivePage(),
        // custom dialog
        DIALOGS_PAGE: (BuildContext context) => DialogsPage(),
        // flip card
        FLIP_PAGE: (BuildContext context) => FlipPage(),
      },

      // *******  调试类参数
      // 显示Performance调试信息，顶部状态ui开销等
      // showPerformanceOverlay: true,
      // 显示网格
      // debugShowMaterialGrid: true,
      // 显示右上角的DEBUG标签
      // debugShowCheckedModeBanner: false,
      // // 使用了saveLayer的图形会显示为棋盘格式并随着页面刷新而闪烁
      // checkerboardOffscreenLayers: true,
      // // 做了缓存的静态图片在刷新页面时不会改变棋盘格的颜色；如果棋盘格颜色变了说明被重新缓存了，这是我们要避免的
      // checkerboardRasterCacheImages: true,
    ),
  );
}

const String FRAMEWORK_DRAWER_PAGE = "/FrameworkDrawerPage";

const String PERSPECTIVE_PAGE = "/PerspectivePage";

const String DIALOGS_PAGE = "/dialogs";

const String FLIP_PAGE = "/flipable";