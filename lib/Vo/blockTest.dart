import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/HomeScreen.dart';
import 'package:multios/utils/Utils.dart';

class BlockTest extends StatefulWidget {
  @override
  _BlockTestState createState() => _BlockTestState();
}

class _BlockTestState extends State<BlockTest> {
  int data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("block test"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
//      Utils.getTextViewWithStream(bloc),
            RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () => {Utils.showAleartDialog(context, "title parth", "title msg")},
              child: new Text("Go to Home.."),
            ),
          ],
        ),
      ),
    );
  }
}
