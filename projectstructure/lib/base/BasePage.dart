import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectstructure/utils/Utils.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page> {
  String screenTitle();

  Color screenBgColor();

  Icon leadingIcon();

  int leadingIconClick();

  bool isActionVisible();
}

mixin BaseScreen<Page extends BasePage> on BaseState<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isActionVisible()
          ? AppBar(
              title: Text(screenTitle()),
              backgroundColor: screenBgColor(),
              leading: IconButton(
                icon: leadingIcon(),
                onPressed: () => setState(() {
                  click(leadingIconClick());
                }),
              ),
            )
          : null,
      body: Container(
        child: Column(
          children: <Widget>[body()],
        ),
      ),
    );
  }

  Widget body();

  click(int leadingIconClick) {
    switch (leadingIconClick) {
      case 0:
        Utils.showToast("0");
        break;
      case 1:
        Utils.showToast("1");
        break;
    }
  }
}
