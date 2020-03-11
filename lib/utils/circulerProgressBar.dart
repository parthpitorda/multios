import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circulerRing.dart';

class CircleProgressBar extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final double value;
  final String meetingTime;

  const CircleProgressBar({
    Key key,
    this.backgroundColor,
    @required this.meetingTime,
    @required this.foregroundColor,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.backgroundColor;
    final foregroundColor = this.foregroundColor;
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          width: 170,
          margin: EdgeInsets.only(top: 20),
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(
              willChange: true,
              foregroundPainter: CircleProgressBarPainter(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                percentage: this.value,
              ),
            ),
          ),
        ),
        new Positioned(
          left: 42.0,
          top: 100.0,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Text(
                  "00:00",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 22),
                ),
              ),

              Text(
                "meeting time",
                style: TextStyle(color: Colors.blueGrey, fontSize: 22),
              ),
            ],
          ),
        )
      ],
    );
  }
}
