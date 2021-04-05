import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // first thing we should put the inhertedwidget in the top of our app tree
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tap - ${_controller.index}"),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.local_fire_department_outlined),
            ),
            Tab(
              icon: Icon(Icons.mark_email_read),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Center(child: Text(" index 0")),
          Center(child: Text("index 1")),
          Center(child: Text(" index 2")),
          Center(child: Text("index 3")),
        ],
      ),
    );
  }
}
