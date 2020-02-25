import 'package:flutter/material.dart';
import 'package:multios/DashScreen.dart';
import 'package:multios/SplashScreen.dart';
import 'package:multios/utils/Utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Utils.getDataToPrefString(Utils.PREF_NAME).toString(),
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: SplashScreen(),
    );
  }
}
