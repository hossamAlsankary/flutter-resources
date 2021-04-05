import 'package:desktop/inhertedwidget/holddatawidget.dart';
import 'package:desktop/sacendscreen/sacend.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // first thing we should put the inhertedwidget in the top of our app tree
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';
    // like that now hold data widget in the to of our app so we can call it from any screen

    return HoldDataForMe(
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: appTitle,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.w900);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            HoldDataForMe.of(context).counter.toString(),
            style: TextStyle(color: Colors.green, fontSize: 30),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "+",
                    style: textStyle,
                  ),
                ),
                onTap: () {
                  setState(() {
                    HoldDataForMe.of(context).counter++;
                  });
                },
              ),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "-",
                    style: textStyle.copyWith(fontSize: 33),
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (HoldDataForMe.of(context).counter != 0) {
                      HoldDataForMe.of(context).counter--;
                    }
                  });
                },
              ),
            ],
          ),
          IconButton(
              icon: Icon(Icons.input_rounded),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SacendScreen()));
              }),
        ],
      ),
    );
  }
}
