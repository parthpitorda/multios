import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/utils/Utils.dart';

class goJuceAbout extends StatefulWidget {
  @override
  _goJuceAboutState createState() => _goJuceAboutState();
}

class _goJuceAboutState extends State<goJuceAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Text(
                  "About",
                  style: TextStyle(color: Colors.white, fontSize: 60),

                ),
                Image(
                  image: AssetImage('assets/bg_curve.png'),
                ),
                Image(
                  width: 350,
                  image: AssetImage('assets/ic_about_with_text.png'),
                ),

              ],
            ),
            RichText(
                text: TextSpan(
                    text: "How to detect JUCE*",
                    style: Utils.textStyleNormal())),
            Expanded(child: Divider()),
            RichText(
                text: TextSpan(
                    text: "Automatic DoNotDisturb",
                    style: Utils.textStyleNormal())),
            Expanded(child: Divider()),
            RichText(
                text: TextSpan(
                    text: "Privacy Policy", style: Utils.textStyleNormal())),
            Expanded(child: Divider()),
            RichText(
                text: TextSpan(
                    text: "Visit our website", style: Utils.textStyleNormal())),
            Expanded(child: Divider()),
            RichText(
                text: TextSpan(
                    text: "Discover our Lifestyle app",
                    style: Utils.textStyleNormal())),
            Expanded(child: Divider()),
            RichText(
                text: TextSpan(
                    text: "How to detect JUCE*",
                    style: Utils.textStyleNormal())),
            Expanded(child: Divider()),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Vesrion",
                    style: Utils.textStyleNormal(),
                  ),
                  Text(
                    "1.0",
                    style: Utils.textStyleNormal(),
                  ),
                ],
              ),
            ),
            Text(
              "Juce*",
              style: TextStyle(fontSize: 48, color: Colors.grey[400]),
            )
          ],
        ),
      ),
    );
  }
}
