import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multios/HomeScreen.dart';
import 'package:multios/LoginScreen.dart';
import 'package:multios/WebSocekt.dart';
import 'package:multios/utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';

import 'goJuceDoNotDistrub.dart';
import 'goJuceScreenInsight.dart';

GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() {
    return new Timer(
        new Duration(seconds: 2),
        () => {
              SharedPreferences.getInstance().then((prefs) => {
                    if (prefs.getBool(Utils.PREF_ISLOGIN) != null &&
                        prefs.getBool(Utils.PREF_ISLOGIN))
                      {
                        Utils.navigateToSubPage(context, WebSocket(
                            title: "title",
                            channel:
                            IOWebSocketChannel.connect('ws://echo.websocket.org'))),
                      }
                    else
                      {
                        Utils.navigateToSubPage(context, WebSocket(
                            title: "title",
                            channel:
                            IOWebSocketChannel.connect('ws://echo.websocket.org'))),
                      }
                  })
            });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new Center(
        child: new FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
