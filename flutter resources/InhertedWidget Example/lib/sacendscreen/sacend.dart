import 'package:desktop/inhertedwidget/holddatawidget.dart';
import 'package:flutter/material.dart';

class SacendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("here data come from inhertedwidget "),
            SizedBox(
              height: 40,
            ),
            Text(
              HoldDataForMe.of(context).counter.toString(),
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
