import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class goJuceHomeDisabled extends StatefulWidget {
  @override
  _goJuceHomeDisabledState createState() => _goJuceHomeDisabledState();
}

class _goJuceHomeDisabledState extends State<goJuceHomeDisabled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height / 1.5,
              child: Image(
                height: 100,
                width: 100,
                image: AssetImage('assets/ic_bluetooth.png'),
              ),
            ),
            PreferredSize(
              child: new Container(
                height: 212.0,
                color: Colors.transparent,
                child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0))),
                    child: new Center(
                      child: new Text(
                        "We need Bluetooth \nin order to work our magic "
                        "\nTurn on Bluetooth in the Control Center \nor go to Settings",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20, height: 1.2),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
