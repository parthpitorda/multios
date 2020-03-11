import 'dart:io';
import 'dart:ui';

import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static String PREF_NAME = "name";
  static String PREF_PASS = "pass";
  static String PREF_ISLOGIN = "is_login";

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1);
  }

  static navigateToSubPage(context, String pageName) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => nameOfScreen));
    Navigator.pushNamed(context, pageName);
  }

  static navigateToSubPageReplash(context, String pageName) async {
    Navigator.pushReplacementNamed(context, pageName);
  }

  static void saveDataToPrefString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    prefs.getString('name');
  }

  static void saveDataToPrefBoolen(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static void saveDataToPrefInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static Future<int> getDataToPrefInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  static Future<String> getDataToPrefString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static void ClearPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Widget getTextView(String hintText, TextEditingController controller,
      bool isOnlyNumber, bool isAutoFocus, bool action) {
    return TextField(
      controller: controller,
      keyboardType: isOnlyNumber ? TextInputType.number : TextInputType.text,
      autofocus: isAutoFocus,
      textInputAction: action ? TextInputAction.go : TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          labelText: hintText),
    );
  }

  static void simpleShowDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Text('Dialog Title'),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('user@example.com'),
            onTap: () => Navigator.pop(context, 'user@example.com'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('user2@gmail.com'),
            onTap: () => Navigator.pop(context, 'user2@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.add_circle),
            title: Text('Add account'),
            onTap: () => Navigator.pop(context, 'Add account'),
          ),
        ],
      ),
    );
  }

  static String timePickerDialog(BuildContext context, TimeOfDay initTime) {
    String tempTime;
    showTimePicker(
      context: context,
      initialTime: initTime,
    ).then<TimeOfDay>((TimeOfDay value) {
      tempTime = value.toString();
      return value;
    });
    return tempTime;
  }

  static String datePickerDialog(BuildContext context, DateTime firstDate) {
    String tempDate;
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: DateTime(2025),
    ).then<DateTime>((DateTime value) {
      tempDate = value.toString();
      return value;
    });
    return tempDate;
  }

  static Future showAleartDialog(
      BuildContext context, String title, String msg) {
    bool tempBool = false;

    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: new Text(title),
        content: new Text(
          msg,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => {tempBool = false},
          ),
          FlatButton(
            child: Text('OK'),
            onPressed: () => tempBool = true,
          ),
        ],
      ),
    );
  }

  static Future showExitDialog(BuildContext context) {
    showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: new Text("Exit"),
        content: new Text(
          "Are you sure want to log-out!..",
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => {Navigator.pop(context)},
          ),
          FlatButton(
            child: Text('OK'),
            onPressed: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
          ),
        ],
      ),
    );
  }

  static Future<bool> isNetWorkAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  static TextStyle textStyleNormal18() {
    return TextStyle(color: Colors.grey, fontSize: 18.0, height: 1.2);
  }

  static TextStyle textStyleNormal() {
    return TextStyle(color: Colors.grey, fontSize: 22.0);
  }

  static TextStyle linkStyleNoraml() {
    TextStyle(color: Colors.blue);
  }

  static TextStyle textStyleBig() {
    return TextStyle(color: Colors.green, fontSize: 40.0);
  }


  static changeTheme(context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if((prefs.getBool("isDark") ?? false)){
      DynamicTheme.of(context).setBrightness(Brightness.light);
    }else{
      DynamicTheme.of(context).setBrightness(Brightness.dark);
    }
  }

}
