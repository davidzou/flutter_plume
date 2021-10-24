import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/widget/flipable.dart';
import 'package:plume/widget/labels.dart';

class FlipPage extends StatelessWidget {
  final FlipController _flipController = FlipController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: Border.all(
            color: Colors.red,
            width: 8.0,
          ) + Border.all(
            color: Colors.green,
            width: 8.0,
          ) + Border.all(
            color: Colors.blue,
            width: 10.0,
          ),
        ),
        child: Flip(
          controller: _flipController,
          front: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide()),
            child: Container(
              decoration: BoxDecoration(color: Colors.lightBlueAccent, borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "我是前面"
                    ),
                    TextButton.icon(onPressed: (){
                      _flipController.flip();
                    }, icon: Icon(Icons.font_download), label: Text("点我看后面")),
                  ],
                ),
              ),
            ),
          ),
          back: Card(
            child: Container(
              color: Colors.tealAccent,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "我是后页"
                    ),
                    TextButton.icon(onPressed: (){
                      _flipController.flip();
                    }, icon: Icon(Icons.backpack_outlined), label: Text("点我看前面")),
                    VoiceLabel("就几个字符", assetPath: "assets/audios/additive_name_1.mp3"),
                    VoiceLabel("这个是字符超多的，你觉得会不会超出界面呢？", assetPath: "assets/audios/additive_name_1.mp3"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}