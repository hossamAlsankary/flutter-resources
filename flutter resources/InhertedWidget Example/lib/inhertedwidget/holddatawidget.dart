import 'package:flutter/material.dart';

class HoldDataForMe extends InheritedWidget {
  int counter = 0;
  HoldDataForMe({child}) : super(child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static HoldDataForMe of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
