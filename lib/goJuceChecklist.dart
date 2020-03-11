import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:multios/utils/Utils.dart';

class goJuceChecklist extends StatefulWidget {
  @override
  _goJuceChecklistState createState() => _goJuceChecklistState();
}

class _goJuceChecklistState extends State<goJuceChecklist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(14),
        child: Column(
          children: <Widget>[
            Text(
              'Detect Devices',
              style: Utils.textStyleNormal(),
            ),
            SizedBox(
              width: 800,
              child: Text(
                "Checklist",
                style: Utils.textStyleBig(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Align(
                    heightFactor: 1.5,
                    child: Row(
                      children: <Widget>[
                        Text(
                          '1.',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text('Bluetooth on', style: TextStyle(fontSize: 24))
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                    text: 'Make sure Bluetooth enabled.',
                    style: Utils.textStyleNormal(),
                  )),
                  Align(
                    heightFactor: 1.5,
                    child: Row(
                      children: <Widget>[
                        Text(
                          '2.',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text('Location Access', style: TextStyle(fontSize: 24))
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Please ',
                          style: Utils.textStyleNormal(),
                          children: <TextSpan>[
                        TextSpan(text: 'allow '),
                        TextSpan(
                            text: 'Location \n Permision.',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Utils.showToast("click")),
                        TextSpan(
                            text: 'to detect devices \n without opening the app. '),
                      ])),
                  Align(
                    heightFactor: 2,
                    child: Row(
                      children: <Widget>[
                        Text(
                          '2.',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text('Proximity', style: TextStyle(fontSize: 24))
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                    text: 'Make sure you are within 2 meters of a JUCE* device.',
                    style: Utils.textStyleNormal(),
                  )),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
