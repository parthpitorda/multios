import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/utils/Utils.dart';

class goJuceNotificaiton extends StatefulWidget {
  @override
  _goJuceNotificaitonState createState() => _goJuceNotificaitonState();
}

class _goJuceNotificaitonState extends State<goJuceNotificaiton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20),
        margin: EdgeInsets.all(14),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Notifications',
              style: Utils.textStyleNormal(),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 800,
              child: Text(
                "Notificaitons",
                style: Utils.textStyleBig(),
              ),
            ),
            Container(
              margin: EdgeInsets.all(14),
              child: Column(
                children: <Widget>[
                  Align(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Allow Notificaitons',
                            style: TextStyle(fontSize: 24)),
                        Switch(
                          value: false,
                          activeColor: Colors.green,
                          onChanged: (value) => {},
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                        text:
                            'We’ll let you know if Automatic \nDND is not working anymore \nbecause Shortcuts is suspended.',
                        style: Utils.textStyleNormal18(),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
