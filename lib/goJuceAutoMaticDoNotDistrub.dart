import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/utils/Utils.dart';

class goJuceAutoMaticDoNotDistrub extends StatefulWidget {
  @override
  _goJuceAutoMaticDoNotDistrubState createState() =>
      _goJuceAutoMaticDoNotDistrubState();
}

class _goJuceAutoMaticDoNotDistrubState
    extends State<goJuceAutoMaticDoNotDistrub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 800,
              child: Text(
                "Automatic \nDoNotDistrub",
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            Align(
              heightFactor: 1.6,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                        text:
                            'This app uses "Shortcuts" to \nto automatically activate DoNotDistrub\nonce docked in a JUCE* device.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                        text:
                            'Please take a moment to configure this \nfeature.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Image(
              height: 150,
              width: 150,
              image: AssetImage('assets/dnd_icn.png'),
            ),
            Text(
              "Start Configuration",
              style: TextStyle(
                  color: Colors.deepPurple,
                  backgroundColor: Colors.white,
                  fontSize: 18),
            ),
            Text("I'll do it later",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
