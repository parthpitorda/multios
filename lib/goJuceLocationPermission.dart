import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/utils/Utils.dart';

class goJuceLocationPermission extends StatefulWidget {
  @override
  _goJuceLocationPermission createState() => _goJuceLocationPermission();
}

class _goJuceLocationPermission extends State<goJuceLocationPermission> {
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
                "Location \npermission",
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
                            'Allow location access to automatically \ndetect nearby JUCE⁺ devices, without '
                            '\nhaving to open the app or unlock \nyour phone.',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18.0, height: 1.2),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/location_permission_white.png'),
                  ),
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 10.0,
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          child: Text("\nAllow Location Services\n"),
                          color: Colors.white,
                          textColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: () {
                            setState(() {});
                          },
                        ),
                        Text(
                          "I'll do it later",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18.0, height: 1.2),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
