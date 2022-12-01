# plume

一个用于flutter[自定义小部件]的工具框架，用于在给定特定配置和环境状态下总是以相同方式构建的小部件。

## 快速上手


[![plume flutter pub package](https://img.shields.io/static/v1?label=pub&message=v0.1.5-dev.11&color=informational)](https://github.com/davidzou/flutter_plume)


[更多帮助](doc/getting_started.md)

[更多示例](https://github.com/davidzou/flutter_challenge)

### 核心框架

> Builder

ListViewBuilder

> Container

TernaryContainer   三元容器，将容器内分割为3个部分。

> Dialog

DialogProvider     创建标准化对话框。

### 自定义部件

> Block Container（块）

    一个自定义的矩形块，没有状态。常用的实验测试代码
    这里的代码中有被用到 [flutter_challenge](https://github.com/davidzou/flutter_challenge)

> HeaderTitle

    一个自定义标题。

> VoiceLabel

    一个带声音播放按钮的标签类。常用于名词解释的标题。

> YearsWidget

    一个用于日历顶端带有年份的显示部分，按钮可以操作年份的递增和递减

    YearsWidget(onChanged: (int year) { print("$year"); })

### 工具类

> RWSharedPreferences

    一个简易封装SharePreferences第三方库，使其使用更便捷。