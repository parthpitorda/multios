import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class goJuceOnBoardingScreen1 extends StatefulWidget {
  @override
  _goJuceOnBoardingScreen1State createState() =>
      _goJuceOnBoardingScreen1State();
}

class _goJuceOnBoardingScreen1State extends State<goJuceOnBoardingScreen1> {
  bool isNextClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getWidget(),
    );
  }

  Widget getWidget() {
    if (isNextClick) {
      return Container(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/ic_boarding_with_bg.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Let’s meet \n\nConnect with each other \nCatch up with your phone later',
              style: TextStyle(color: Colors.grey, fontSize: 18.0, height: 1.2),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Text("Next",
                  style: TextStyle(color: Colors.green, fontSize: 18)),
              onTap: () => {
                setState(() {
                  isNextClick ? isNextClick = false : isNextClick = true;
                })
              },
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/ic_boarding_with_bg_two.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  left: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        height: 80,
                        width: 80,
                        image: AssetImage('assets/ic_bettry.png'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Image(
                        height: 80,
                        width: 80,
                        image: AssetImage('assets/ic_moon.png'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Phones charge wirelessly and\n automatically switch to DoNotDisturb '
              '\nonce docked in a JUCE⁺ device.\nPlease take a moment to get set',
              style: TextStyle(color: Colors.grey, fontSize: 18.0, height: 1.2),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("\n    Start Setup    \n"),
              color: Colors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              onPressed: () {
                setState(() {
                  isNextClick ? isNextClick = false : isNextClick = true;
                });
              },
            )
          ],
        ),
      );
    }
  }
}
