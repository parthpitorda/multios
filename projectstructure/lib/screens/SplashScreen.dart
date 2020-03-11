import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectstructure/base/BasePage.dart';
import 'package:projectstructure/utils/Utils.dart';

class SplashScreen extends BasePage {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> with BaseScreen {
  Color color = Colors.amber;
  Icon menuDrawable = Icon(Icons.menu);
  int callFu = 0;
  bool isActionbarVisible = true;

  @override
  Widget body() {
    return Column(
      children: <Widget>[
        Text('Splash Screen'),
        RaisedButton(
          child: Text("Click me to Change theme"),
          onPressed: () => setState((){
            callFu = callFu == 0 ? callFu = 1 : callFu = 0;
            Utils.changeTheme(context);
            menuDrawable = Icon(Icons.menu);
            isActionbarVisible ? isActionbarVisible = false : isActionbarVisible = true;

          }),
        )
      ],
    );
  }

  @override
  Icon leadingIcon() {
    return menuDrawable;
  }

  @override
  int leadingIconClick() {
    return callFu;
  }

  @override
  Color screenBgColor() {
    return color;
  }

  @override
  String screenTitle() {
    return "SpalshScreen";
  }

  @override
  bool isActionVisible() {
    return isActionbarVisible;
  }
}
