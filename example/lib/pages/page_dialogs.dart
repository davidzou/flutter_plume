import 'package:flutter/material.dart';
import 'package:plume/framework/dialog.dart';
import 'package:plume/framework/dialogs/dialog_provider.dart';

///
/// 自定义对话框
///
class DialogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.wb_incandescent_outlined),
            onTap: () {
              DialogProvider.show(context, title: "信息", message: "        \"一鼓作气，再而衰，三而竭\"。");
            },
            title: Text("简单提示显示信息，一个按钮"),
            subtitle: Text(
              "描述",
              style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
            ),
          ),

          /// Notice白天
          _createNoticeLightMode(context),

          /// Notice黑夜
          _createNoticeDarkMode(context),

          _createNoticeX(context),

          /// Dilemma Cupertino白天
          _createDilemmaCupertinoLightMode(context),

          /// Dilemma Cupertino黑夜
          _createDilemmaCupertinoDarkMode(context),

          /// Dilemma MaterialDesign 白天样式
          _createDilemmaMaterialDesignLightMode(context),

          ///  Dilemma MaterialDesign 黑夜样式
          _createDilemmaMaterialDesignDarkMode(context),

          /// Status 状态弹窗
          _createStatusMode(context),

          /// Prompt 输入条件弹窗白天模式（单个条件）
          _createPromptLightDialog(context),

          /// Prompt 输入条件弹窗黑夜模式（单个条件）
          _createPromptDarkDialog(context),

          ListTile(
            leading: Icon(Icons.wb_incandescent_outlined),
            onTap: () {
              // DialogProvider.dilemmaX(
              //   context,
              //   delegate: SliverChildBuilderDelegate((context, index) {
              //     return Container();
              //   }),
              //   centerContent: false,
              //   onTapedRight: () {
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("右边的按钮被按到了")));
              //     Navigator.of(context).pop();
              //   },
              //   onTapedLeft: () {
              //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("左边的按钮被按到了")));
              //     Navigator.of(context).pop();
              //   },
              // );

              // DialogProviderPlus.login(context, backgroundImage: DecorationImage(image: AssetImage("assets/bg/login_bg7.jpeg"))).show(context).then((value) => print("value: $value"));
              DialogProviderPlus(context, dark: false)
                ..addTextFormField(key: "key1")
                // ..addText(Text("我是分割的"))
                // ..addTextFormField(inputDecoration: InputDecoration(label: Text("用户名"), hintText: "输入用户名：", border: kOutLineInputBorder))
                // ..addText(Text("标题党"))
                // ..addTextFormField()
                ..addDropDownButton(key: "dropdown", values: ["String", "Double", "Integer", "Short"])
                ..addDivider()
                ..addDropDownButton(key: "dropdown", values: [1, 3, 4, 5, 7, 9], labelText: "选择序列")
                // 设置图片背景
                // ..setBackGroundGradient(LinearGradient(colors: [Colors.white70, Colors.redAccent, Colors.pinkAccent]))
                // ..setBackgroundImage(DecorationImage(image: AssetImage("assets/bg/login_bg7.jpeg")))
                ..addDivider()
                ..addCheckBox(key:  "custom")
                // ..addHourMinutesSelector(key: "date",)
                ..show(context).then((value){
                  if (value == null || !value.status) return;
                  print(value);
                  print(value.data!['key1']); // 获取数据
                });
            },
            title: Text(
              "Dilemma 弹窗白天模式(两难选择,Cupertino风格)",
              maxLines: 1,
            ),
            subtitle: Text(
              "需要用户选择，同意不同意，执行不执行的方式弹窗，交由用户的A/B选择",
              maxLines: 2,
              style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
            ),
          ),

          /// 选择信息弹窗
          ListTile(
            leading: Icon(Icons.wb_incandescent_outlined),
            onTap: () {
              DialogProvider.dilemmaChoiceChips(context, dialogBackgroundColor: Colors.lightBlue.withOpacity(0.7), children: [
                Text("data1"),
                Text("data2"),
                Text("data3"),
                Text("data4"),
                Text("data5"),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Clicked"),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(0.7))),
                ),
              ]);
            },
            title: Text(
              "Selector 弹窗模式(状态展示)",
              maxLines: 1,
            ),
            subtitle: Text(
              "操作成功后的弹窗，表示状态信息的。",
              maxLines: 2,
              style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
            ),
          ),

          /// 渐变按钮
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      DialogProvider.showDialogNormal(context);
                    },
                    child: const Text('Gradient'),
                  ),
                ),
                // Positioned(child: Text("icon"), top: 0, right: 0, left: 0,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 已完成的对话框

  ListTile _createNoticeLightMode(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.lightBlue,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_notice_bright.png"),
      ),
      onTap: () {
        DialogProvider.notice(
          context,
          title: "信息",
          content: "中国国家統計局が18日発表した2021年7～9月期の国内総生産（GDP）は、物価変動の影響を除いた実質で前年同期比4・9％増となった。6四半期連続のプラス成長だが、4～6月期（7・9％増）から大きく減速した。前期比でも0・2％増（4～6月期は1・2％増）と低調だった。",
          indent: 28,
          dark: false,
        ).then((value) => print("notice: $value"));
      },
      title: Text(
        "Notice 弹窗白天模式",
        maxLines: 1,
      ),
      subtitle: Text(
        "(通知或者告知类的信息), 标题加内容，以及一个知道了按钮事件。有白天和黑夜两种模式。知道了按钮可以关闭弹窗，也可以点击空白区域关闭弹窗。",
        // maxLines: 2,
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createNoticeDarkMode(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.cyanAccent,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_notice_dark.png"),
      ),
      onTap: () {
        DialogProvider.notice(
          context,
          title: "信息",
          content: "中国国家統計局が18日発表した2021年7～9月期の国内総生産（GDP）は、物価変動の影響を除いた実質で前年同期比4・9％増となった。6四半期連続のプラス成長だが、4～6月期（7・9％増）から大きく減速した。前期比でも0・2％増（4～6月期は1・2％増）と低調だった。",
          indent: 28,
          dark: true, // 强制为黑暗模式
        ).then((value) => print("notice: $value"));
      },
      title: Text(
        "Notice 弹窗黑夜模式",
        maxLines: 1,
      ),
      subtitle: Text(
        "(通知或者告知类的信息), 标题加内容，以及一个知道了按钮事件。有白天和黑夜两种模式。知道了按钮可以关闭弹窗，也可以点击空白区域关闭弹窗。",
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createNoticeX(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.cyanAccent,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        child: Image.asset("assets/images/dialog_notice_dark.png"),
      ),
      onTap: () {
        DialogProvider.noticeX(
          context,
          title: Text("信息"),
          content: Text("中国国家統計局が18日発表した2021年7～9月期の国内総生産（GDP）は、物価変動の影響を除いた実質で前年同期比4・9％増となった。6四半期連続のプラス成長だが、4～6月期（7・9％増）から大きく減速した。前期比でも0・2％増（4～6月期は1・2％増）と低調だった。"),
          button: ElevatedButton(onPressed: () {}, child: Text("了解")),
          indent: 28,
          dark: false, // 强制为黑暗模式
        ).then((value) => print("notice: $value"));
      },
      title: Text(
        "Notice 自定义模式",
        maxLines: 1,
      ),
      subtitle: Text(
        "(通知或者告知类的信息), 标题加内容，以及一个知道了按钮事件。有白天和黑夜两种模式。",
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createDilemmaCupertinoLightMode(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.lightBlueAccent,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_dilemma_cupertino_bright.png"),
      ),
      onTap: () {
        DialogProvider.dilemma(
          context,
          title: "title",
          content: "内容部分，你想展示些什么，或者你能选择什么，来拿出来！",
          centerContent: true,
          onTapedRight: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("右边的按钮被按到了")));
            Navigator.of(context).pop();
          },
          // onTapedLeft: () {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("左边的按钮被按到了")));
          //   Navigator.of(context).pop();
          // },
        ).then((value) {
          if (value != null && !(value.status)) {
            print(value);
          }
        });
      },
      title: Text(
        "Dilemma 弹窗白天模式",
        maxLines: 1,
      ),
      subtitle: Text(
        "(两难选择,Cupertino风格)，需要用户选择，同意不同意，执行不执行的方式弹窗，交由用户的A/B选择",
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createDilemmaCupertinoDarkMode(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.cyanAccent,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_dilemma_cupertino_dark.png"),
      ),
      onTap: () {
        DialogProvider.dilemma(context, title: "title", content: "内容部分，你想展示些什么，或者你能选择什么，来拿出来！", dark: true,
            // centerContent: true,
            onTapedRight: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("右边的按钮被按到了")));
        }, onTapedLeft: () {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("左边的按钮被按到了")));
        });
      },
      title: Text(
        "Dilemma 弹窗黑夜模式",
        maxLines: 1,
      ),
      subtitle: Text(
        "(两难选择,Cupertino风格)，需要用户选择，同意不同意，执行不执行的方式弹窗，交由用户的A/B选择",
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createDilemmaMaterialDesignLightMode(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.lightBlueAccent,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_dilemma_matrial_bright.png"),
      ),
      onTap: () {
        DialogProvider.dilemmaMaterial(
          context, title: "title",
          content: "内容部分，你想展示些什么，或者你能选择什么，来拿出来！",
          dark: false,
          // centerContent: true,
          onTapedRight: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("右边的按钮被按到了")));
          },
          onTapedLeft: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("左边的按钮被按到了")));
          },
        );
      },
      title: Text(
        "Dilemma 弹窗白天模式",
        maxLines: 1,
      ),
      subtitle: Text(
        "(两难选择,Material Design样式，标准Android风格)，需要用户选择，同意不同意，执行不执行的方式弹窗，交由用户的A/B选择",
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createDilemmaMaterialDesignDarkMode(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.cyanAccent,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_dilemma_matrial_dark.png"),
      ),
      onTap: () {
        DialogProvider.dilemmaMaterial(
          context, title: "title",
          content: "内容部分，你想展示些什么，或者你能选择什么，来拿出来！",
          dark: true,
          // centerContent: true,
          onTapedRight: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("右边的按钮被按到了")));
          },
          onTapedLeft: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("左边的按钮被按到了")));
          },
        );
      },
      title: Text(
        "Dilemma 弹窗黑夜模式",
        maxLines: 1,
      ),
      subtitle: Text(
        "(两难选择,Material Design样式，标准Android风格)，需要用户选择，同意不同意，执行不执行的方式弹窗，交由用户的A/B选择",
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createStatusMode(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.blue,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_status_bright.png"),
      ),
      onTap: () {
        // 状态信息没有数据返回
        DialogProvider.status(
          context,
          status: "SUCCESS",
          statusIcon: Icon(
            Icons.where_to_vote_outlined,
            color: Colors.white,
            size: 48.0,
          ),
          description: "成功了，你想给点什么奖励，提示些什么，升级了的状态。写这里吧。",
        );
      },
      title: Text(
        "Status 弹窗模式(状态展示)",
        maxLines: 1,
      ),
      subtitle: Text(
        "操作成功后的弹窗，表示状态信息的。",
        maxLines: 2,
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createPromptLightDialog(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.blue,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_prompt_bright.png"),
      ),
      onTap: () {
        DialogProvider.prompt(
          context,
          title: "输入条件",
          label: "请输入",
          dark: false,
        ).then((value) {
          print("value: $value");
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("输入的内容为：${value!.data}")));
        }).whenComplete(() => print("complete!"));
      },
      title: Text(
        "Prompt 弹窗白天模式(条件输入)",
        maxLines: 1,
      ),
      subtitle: Text(
        "操作成功后的弹窗，返回条件。",
        maxLines: 2,
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }

  ListTile _createPromptDarkDialog(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.wb_incandescent_outlined,
        color: Colors.lightBlueAccent,
      ),
      // 放截屏的缩略图
      trailing: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 128, maxHeight: 128),
        // child: Placeholder(
        //   color: Colors.grey,
        //   fallbackWidth: 64,
        //   fallbackHeight: 64,
        // ),
        child: Image.asset("assets/images/dialog_prompt_dark.png"),
      ),
      onTap: () {
        DialogProvider.prompt(
          context,
          title: "输入条件",
          label: "请输入",
          dark: true,
        ).then((value) {
          print("value: $value");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("输入的内容为：${value!.data}")));
        }).whenComplete(() => print("complete!"));
      },
      title: Text(
        "Prompt 弹窗黑夜模式(条件输入)",
        maxLines: 1,
      ),
      subtitle: Text(
        "操作成功后的弹窗，返回条件。",
        maxLines: 2,
        style: TextStyle(color: Colors.blueGrey, fontSize: 11.0),
      ),
    );
  }
}
