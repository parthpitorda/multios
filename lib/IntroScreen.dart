import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/utils/Utils.dart';

import 'Vo/VoIntroData.dart';

class IntroScreen extends StatelessWidget {
  static const kIcons = <Widget>[
    Icon(Icons.event),
    Icon(Icons.event),
    Icon(Icons.event),
    Icon(Icons.event),
    Icon(Icons.event),
    Icon(Icons.event),
  ];

  var lst = new List<VoIntroData>();

  @override
  Widget build(BuildContext context) {
    lst.add(new VoIntroData('title', Icon(Icons.add)));

    return Scaffold(
      appBar: AppBar(title: Text('tab bar'),),
      body: DefaultTabController(
        length: kIcons.length,
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TabPageSelector(),
                Expanded(
                  child: IconTheme(
                    data: IconThemeData(
                        size: 128.0, color: Theme.of(context).accentColor),
                    child: TabBarView(children: kIcons),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                String temp =  Utils.datePickerDialog(context,DateTime(1990));
                Utils.showToast(temp);

                    if (!DefaultTabController.of(context).indexIsChanging) {
                      DefaultTabController.of(context)
                          .animateTo(kIcons.length - 1);
                    }
                  },
                  color: Theme.of(context).buttonColor,
                  child: Text("SKIP"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
