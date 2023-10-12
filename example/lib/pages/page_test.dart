import 'package:flutter/material.dart';
import 'package:plume/framework/dialog.dart';
import 'package:plume/widget/head.dart';

class TestPage extends StatelessWidget {


  svg() {

  }

  @override
  Widget build(BuildContext context) {
    // 求一个背景色，是主题色的相对色的一半？
    Color _color = Theme.of(context).primaryColor;
    _color = Colors.black;
    _color = _color.withRed((255 - _color.red) ~/ 2).withGreen((255 - _color.green) ~/ 2).withBlue((255 - _color.blue) ~/ 2).withOpacity(0.4);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      // body: Stack(
      //   children: [
      //     Container(
      //       // Step1    主题色，大多素色彩，占比60%
      //       color: _color,
      //     ),
      //     Positioned(
      //       top: 100,
      //       right: 0,
      //       left: 0,
      //       child: CustomButton(
      //         text: "0.12034875",
      //         color: Colors.black,
      //       ),
      //     ),
      //     Positioned(
      //       top: 200,
      //       right: 0,
      //       left: 0,
      //       child: CustomButton(
      //         text: "0.12034875",
      //       ),
      //     ),
      //     Positioned(
      //       top: 300,
      //       left: 0,
      //       right: 0,
      //       child: Center(
      //         child: CustomButton(
      //           width: 150,
      //           height: 150,
      //           text: "0.12034875",
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Stack(
        children: [
          // 内容和按键
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                // Container(height: 28, color: Colors.transparent,),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: ListView.custom(
                    shrinkWrap: true,
                    // padding: EdgeInsets.only(top: 100),
                    // itemExtent: 199,
                    // prototypeItem: Container(
                    //   height: 100,
                    //   color: Colors.lightBlueAccent,
                    // ),
                    childrenDelegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.pinkAccent[400],
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.star,
                              size: 44,
                              color: Colors.lightGreenAccent,
                            ),
                            title: Text("index$index, High light"),
                            subtitle: Text("we are list tile, and this is subtitle."),
                          ),
                        ),
                      );
                    }, childCount: 4),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
                    color: Colors.orangeAccent.withOpacity(0.8),
                    boxShadow: kElevationToShadow[8],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: Text('Cancel')),
                      TextButton(
                          onPressed: () {
                            DialogProvider.dilemmaX(context, delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return Container(
                                  child: ListTile(
                                    title: Text("index$index"),
                                  ),
                                );
                              },
                            ));
                          },
                          child: Text('OK')),
                    ],
                  ),
                )
              ],
            ),
          ),
          // 图标
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(
              child: Icon(
                Icons.batch_prediction,
                size: 128,
                color: Colors.greenAccent,
              ),
            ),
          ),

          Positioned(
            top: 400,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSmall(title: "我是标题Small"),
                HeaderMedium(title: "我是标题Medium"),
                HeaderLarge(title: "我是标题Large"),
                Padding(padding: EdgeInsets.all(20.0), child: Text("content")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///
/// 自定义按钮，SoftUI设计效果。
///
class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  /// 按钮文字
  final String text;

  /// 按钮颜色
  final Color? color;

  /// 设定宽
  final double? width;

  /// 设定高
  final double? height;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color _color;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _color = widget.color ?? Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Ink(
        // color: _color.withOpacity(0.4),
        child: InkWell(
          autofocus: true,
          onTap: () {
            print("onTap....");
          },
          // splashColor: Colors.white,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: widget.width,
            height: widget.height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                // Light shinning, 亮光处
                BoxShadow(color: Colors.white, offset: Offset(-1, -1), blurStyle: BlurStyle.outer, blurRadius: 5.0),
                BoxShadow(color: Colors.white, offset: Offset(-1.5, -1), blurStyle: BlurStyle.outer, blurRadius: 5.0),
                BoxShadow(color: Colors.white, offset: Offset(-1.5, -1.5), blurStyle: BlurStyle.outer, blurRadius: 5.0),
                BoxShadow(color: Colors.white, offset: Offset(-2, -1.5), blurStyle: BlurStyle.outer, blurRadius: 5.0),
                BoxShadow(color: Colors.white, offset: Offset(-2, -2), blurStyle: BlurStyle.inner, blurRadius: 20.0),
                BoxShadow(color: Colors.white, offset: Offset(-2.5, -2), blurStyle: BlurStyle.inner, blurRadius: 20.0),
                BoxShadow(color: Colors.white, offset: Offset(-2.5, -2.5), blurStyle: BlurStyle.inner, blurRadius: 20.0),
                BoxShadow(color: Colors.white, offset: Offset(-3, -3), blurStyle: BlurStyle.inner, blurRadius: 20.0),
                // Shadows, 阴影
                BoxShadow(color: _color, offset: Offset(1, 1), blurStyle: BlurStyle.outer, blurRadius: 5.0),
                BoxShadow(color: _color, offset: Offset(1.5, 1), blurStyle: BlurStyle.outer, blurRadius: 5.0),
                BoxShadow(color: _color, offset: Offset(1.5, 1.5), blurStyle: BlurStyle.outer, blurRadius: 5.0),
                BoxShadow(color: _color, offset: Offset(2, 1.5), blurStyle: BlurStyle.outer, blurRadius: 5.0),
                BoxShadow(color: _color, offset: Offset(2, 2), blurStyle: BlurStyle.inner, blurRadius: 5.0),
                BoxShadow(color: _color, offset: Offset(2.5, 2), blurStyle: BlurStyle.inner, blurRadius: 5.0),
                BoxShadow(color: _color, offset: Offset(2.5, 2.5), blurStyle: BlurStyle.inner, blurRadius: 5.0),
                BoxShadow(color: _color, offset: Offset(3, 3), blurStyle: BlurStyle.outer, blurRadius: 5.0),
              ],
              border: Border.all(width: 10.0, color: Colors.white70, style: BorderStyle.none),
              backgroundBlendMode: BlendMode.color,
              borderRadius: BorderRadius.circular(20),
              // Step2 大部分色彩，30%
              color: _color,
              // gradient: LinearGradient(
              //   colors: [
              //     _color.withRed((255 - _color.red) ~/ 2).withGreen((255 - _color.green) ~/ 2).withBlue((255 - _color.blue) ~/ 2).withOpacity(0.8),
              //     // _color.withRed((255 - _color.red) ~/ 2).withGreen((255 - _color.green) ~/ 2).withBlue((255 - _color.blue) ~/ 2).withOpacity(0.6),
              //     _color.withRed((255 - _color.red) ~/ 2).withGreen((255 - _color.green) ~/ 2).withBlue((255 - _color.blue) ~/ 2).withOpacity(0.4),
              //   ]
              // )
            ),
            padding: EdgeInsets.all(20.0),
            child: Text(
              widget.text,
              style: TextStyle(
                // Step3 少部分色彩，10%
                color: _color.withRed(255 - _color.red).withBlue(255 - _color.blue).withGreen(255 - _color.green),
                shadows: kElevationToShadow[24],
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//渐变效果
class CustomRouteJianBian extends PageRouteBuilder {
  final Widget widget;

  CustomRouteJianBian(this.widget)
      : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
