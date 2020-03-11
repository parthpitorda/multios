import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:multios/goJuceAbout.dart';
import 'package:multios/goJuceOnBoardingScreen1.dart';
import 'package:multios/utils/Utils.dart';

class goJuceHomeScreen extends StatefulWidget {
  @override
  _goJuceHomeScreenState createState() => _goJuceHomeScreenState();
}

class _goJuceHomeScreenState extends State<goJuceHomeScreen> {
  bool isActiveJuce = false;

  bool isPermission = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            getAppBar(),
            getMeddleContent(),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: RaisedButton(
                  child: Text("\nConfigure Automatic DoNotDisturb\n"),
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onPressed: () {
                    setState(() {
                      isActiveJuce ? isActiveJuce = false : isActiveJuce = true;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Available from iOS 13.2 via Shortcuts',
              style: TextStyle(color: Colors.grey, fontSize: 18.0, height: 1.2),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              child: Image(
                height: 40,
                width: 40,
                image: AssetImage('assets/ic_hamburgur.png'),
              ),
              onTap: () => {Utils.navigateToSubPage(context, goJuceAbout())}),
          Text("JUCE* ID",style: TextStyle(
              color: Colors.grey[800], fontSize: 22.0, height: 1.4),),
          GestureDetector(
              child: Image(
                height: 40,
                width: 40,
                image: AssetImage('assets/icon_insight.png'),
              ),
              onTap: () => {Utils.navigateToSubPage(context, goJuceOnBoardingScreen1())})
        ],
      ),
    );
  }

  Widget getMeddleContent() {
    if (isPermission) {
      return Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/home_green_waves.png'),
          ),
          Positioned(
            bottom: 50.0,
            right: 0.0,
            left: 0.0,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Please set ',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 20.0, height: 1.4),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Location Permissions ',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Utils.showToast("Locaiton perission")),
                      TextSpan(text: 'to \n“Always” to detect JUCE⁺ devices'),
                    ])),
          )
        ],
      );
    } else if (isActiveJuce) {
      return Image(
        image: AssetImage('assets/ic_active_juce.png'),
      );
    } else {
      return Stack(
        children: <Widget>[
          Image(
            image: AssetImage('assets/home_green_waves.png'),
          ),
          Positioned(
              bottom: 50.0,
              right: 0.0,
              left: 0.0,
              child: Text(
                "Oops, no nearby\nJUCE⁺ device detected",
                style:
                    TextStyle(color: Colors.grey, fontSize: 20.0, height: 1.2),
                textAlign: TextAlign.center,
              ))
        ],
      );
    }
  }
}
