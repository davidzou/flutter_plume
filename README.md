# plume

A tools for flutter [StatelessWidget], for widgets that always build the same way given a particular configuration and ambient state.

## Getting Started


[![plume flutter pub package](https://img.shields.io/static/v1?label=pub&message=v0.1.4-dev.5&color=informational)](https://github.com/davidzou/flutter_plume)


[MORE GUIDE](doc/getting_started.md)

[More Example](https://github.com/davidzou/flutter_challenge)


### Framework

> Builder

ListViewBuilder

### Custom Widgets

> Block Container

    A custom rectangular block with no state. Common experimental test code.
    You can find it in [flutter_challenge](https://github.com/davidzou/flutter_challenge)

> HeaderTitle

    A custom headline.

> YearsWidget

    A display part with year at the top of calendar, button can operate year increment and decrement.

    ```
    YearsWidget(
        onChanged: (int year) {
            print("$year");
        }
    )
    ```

### Tools

> RWSharedPreferences

    A simple encapsulation of the third-party library of sharepreferences makes it more convenient to use.