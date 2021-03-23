Getting Started
=====

1. Widgets

![](doc/images/widgets_content.png)
```
Content(
  title: "标题",
  content: "这里是显示内容",
)
```

![](doc/images/widgets_calendar.png)

```
Calender(
  "选择日期",
  onDays: DateTime.now(),
  notifier: (time) {
    // time日期选择回调数据
  },
  enable: true,
),
```

![](doc/images/widgets_header.png)

2. Builder

<em>ListViewBuilder</em>

```
  ///  You would create a module class for list item data.
  class MessListItem implements ListItem{
    MessListItem(this.name);
    String name;
  }

  class MessListBuilder extends ListViewBuilder<MessListItem> {
    MessListBuilder(List<MessListItem> list, OnItemTaped<MessListItem> onItemTap) : super(list, onItemTap);

    @override
    Widget itemBuild(MessListItem item, int index) {
      return Text(item.name);
    }
  }

默认空数据页返回空数据文字，如果需要自定义，重写buildBlank方法。
  class MessListBuilder extends ListViewBuilder<MessListItem> {
    ...

    @override
    Widget buildBlank() {
      return Text("Blank");
    }
  }
```

### 目录结构

* /calendar     日历相关的控件，方法
* /colors       颜色相关的控件，方法