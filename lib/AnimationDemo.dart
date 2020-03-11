import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationState();
  }
}

class AnimationState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  int percent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              bottom: _animation.value,
              right: 0,
              child: FloatingActionButton(
                backgroundColor: Colors.amber,
                child: Icon(Icons.ac_unit),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  if (percent == 0) {
                    _controller.forward();
                    percent = 1;
                  } else {
                    _controller.reverse();
                    percent = 0;
                  }
                },
                backgroundColor: Colors.black,
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 60).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
