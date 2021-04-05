import 'package:desktop/pinter_circel.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  // ---------------------------------------
  AnimationController _controller;
  var iconColor = Colors.red;
  IconData runIcon = Icons.run_circle;
  bool run = false;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(seconds: 3),
        lowerBound: 0,
        upperBound: 1,
        vsync: this)
      ..forward()
      ..addListener(() {
        setState(() {});
        print(_controller.value);
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomPaint(
                child: Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 100),
                    child: IconButton(
                      splashColor: iconColor,
                      iconSize: 50,
                      icon: Icon(
                        runIcon,
                        color: iconColor,
                      ),
                      onPressed: () {
                        if (run) {
                          setState(
                            () {
                              _controller.stop();
                              run = !run;
                              iconColor = Colors.red;
                            },
                          );
                        } else {
                          print(run);
                          setState(
                            () {
                              _controller.repeat();
                              run = !run;
                              iconColor = Colors.green;
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
                foregroundPainter: RadialPainter(
                    bgColor: Colors.grey,
                    lineColor: Colors.green,
                    width: 1,
                    percent: _controller.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
