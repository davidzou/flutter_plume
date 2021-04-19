import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SpinModel extends InheritedNotifier<AnimationController> {
  SpinModel({
    Key? key,
    AnimationController? notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static double of(BuildContext context) {
    double value = context.dependOnInheritedWidgetOfExactType<SpinModel>()!.notifier!.value;
    return value;
  }
}

class Spinner extends StatelessWidget {
  const Spinner();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: SpinModel.of(context) * 2.0 * math.pi,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
    );
  }
}

class SpinnerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SpinnerState();
  }
}

class SpinnerState extends State with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build object");
    return SpinModel(
      notifier: _controller,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Spinner(),
          Spinner(),
          Spinner(),
        ],
      ),
    );
  }
}
