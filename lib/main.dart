import 'package:flutter/material.dart';
import 'package:multios/SplashScreen.dart';
import 'package:multios/utils/Utils.dart';

import 'HomeScreen.dart';
import 'goJuceAbout.dart';
import 'goJuceAutoMaticDoNotDistrub.dart';
import 'goJuceChecklist.dart';
import 'goJuceHomeDisabled.dart';
import 'goJuceHomeScreen.dart';
import 'goJuceLocationPermission.dart';
import 'goJuceNotifications.dart';
import 'goJuceOnBoardingScreen1.dart';
import 'goJuceScreenInsight.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Utils.getDataToPrefString(Utils.PREF_NAME).toString(),
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: HomeScreen(),
    );
  }
}
