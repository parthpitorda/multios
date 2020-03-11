import 'package:flutter/cupertino.dart';

class VoIntroData{
  String title;
  Icon icon;

  VoIntroData(this.title, this.icon);

  String getTitle() {
    return title;
  }

  void setTitle(String title) {
    this.title = title;
  }

  Icon getIcon() {
    return icon;
  }

  void setIcon(Icon icon) {
    this.icon = icon;
  }

}