import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/utils/Utils.dart';
import 'package:multios/utils/circulerProgressBar.dart';

class goJuceScreenInsight extends StatefulWidget {
  @override
  _goJuceScreenInsightState createState() => _goJuceScreenInsightState();
}

class _goJuceScreenInsightState extends State<goJuceScreenInsight> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[

            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Insights',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 44,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Utils.showToast('close');
                  },
                  child: Icon(
                    Icons.close,
                    color: Colors.green,
                    size: 44,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Total JUCE* time'),
                    SizedBox(
                      width: 80,
                      child: Text(
                        "0+",
                        style: TextStyle(color: Colors.green, fontSize: 28),
                      ),
                    ),

                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('This Week'),
                    Text(
                      "00:00",
                      style: TextStyle(color: Colors.green, fontSize: 28),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Today'),
                    Text(
                      "00:00",
                      style: TextStyle(color: Colors.green, fontSize: 28),
                    ),
                  ],
                ),
              ],
            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text('Total JUCE* time'),
//                Text('This Week'),
//                Text('Today'),
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(
//                  "0+",
//                  style: TextStyle(color: Colors.green, fontSize: 28),
//                ),
//                Text(
//                  "00:00",
//                  style: TextStyle(color: Colors.green, fontSize: 28),
//                ),
//                Text(
//                  "00:00",
//                  style: TextStyle(color: Colors.green, fontSize: 28),
//                ),
//              ],
//            ),
            Align(
              alignment: Alignment.bottomLeft,
              heightFactor: 2,
              child: Text(
                "Last meeting",
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ),
            Align(
              heightFactor: 1.4,
              alignment: Alignment.bottomLeft,
              child: Text(
                "N?A",
                style: TextStyle(color: Colors.blueGrey, fontSize: 22),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                    alignment: Alignment.bottomLeft,
                    child: CircleProgressBar(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.green,
                      value: 0.05,
                    )),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 136,
                      child: Text(
                        "00:00*",
                        style: TextStyle(color: Colors.green, fontSize: 26),
                      ),
                    ),
                    SizedBox(
                      width: 136,
                      child: Text(
                        "JUCE* time",
                        style: TextStyle(color: Colors.green, fontSize: 26),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              heightFactor: 2,
              child: Text(
                "Details",
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
