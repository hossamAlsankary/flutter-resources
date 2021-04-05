import 'package:desktop/home/homescreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    return MaterialApp(
      theme: ThemeData.dark(),
      title: appTitle,
      home: HomeScreen(),

    );
  }
}
