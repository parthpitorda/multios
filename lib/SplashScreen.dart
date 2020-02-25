import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multios/DashScreen.dart';
import 'package:multios/utils/Utils.dart';

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
          Utils.navigateToSubPage(context, DashScreen()),
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
