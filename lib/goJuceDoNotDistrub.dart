import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:multios/utils/Utils.dart';

import 'goJuceAbout.dart';

class goJuceDoNotDistrub extends StatefulWidget {
  @override
  _goJuceDoNotDistrubState createState() => _goJuceDoNotDistrubState();
}

class _goJuceDoNotDistrubState extends State<goJuceDoNotDistrub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              Align(
                heightFactor: 2,
                child: Text("Automatic DoNotDisturb"),
              ),
              SizedBox(
                width: 800,
                child: Text(
                  "Troubleshooting",
                  style: Utils.textStyleBig(),
                ),
              ),
              Column(
                children: <Widget>[
                  Align(
                    heightFactor: 1.5,
                    child: Row(
                      children: <Widget>[
                        Text(
                          '1.',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text('Near by JUCE*', style: TextStyle(fontSize: 24))
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Make sure you ',
                          style: Utils.textStyleNormal(),
                          children: <TextSpan>[
                        TextSpan(text: 'can '),
                        TextSpan(
                            text: 'detect a nearby JUCE* device.',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Utils.navigateToSubPage(context, goJuceAbout()))
                      ])),
                  Align(
                    heightFactor: 1.5,
                    child: Row(
                      children: <Widget>[
                        Text(
                          '2.',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text('DND Permissions', style: TextStyle(fontSize: 24))
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Make sure JUCE* Meetings has permission to ',
                          style: Utils.textStyleNormal(),
                          children: <TextSpan>[
                        TextSpan(text: 'your '),
                        TextSpan(
                            text: 'DoNotDisturb Settings.',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Utils.navigateToSubPage(context, goJuceAbout()))
                      ])),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: SizedBox(
                      width: 800,
                      child: Text(
                        "Configure DND",
                        style: Utils.textStyleBig(),
                      ),
                    ),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      hintStyle: new TextStyle(color: Colors.grey[800]),
                      hintText: "DND Authorazation",
                      enabled: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Watch Video Tutorial",
                        enabled: false,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 800,
                    child: Text(
                      "Tips & Tricks",
                      style: Utils.textStyleBig(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('Personalize your DND Settings',
                        style: TextStyle(fontSize: 24), softWrap: true),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
