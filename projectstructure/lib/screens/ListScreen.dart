import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String text = " Intermediate";
Color textColor;

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();

  ListPage({Key key, this.title}) : super(key: key);

  final String title;
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: Container(
        height: 55.0,
        child: BottomAppBar(
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () {
                  setState(() {
                    textColor = Colors.yellow;
                    text = "home text";
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.blur_on, color: Colors.white),
                onPressed: () {
                  setState(() {
                    textColor = Colors.green;
                    text = "blur text";
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.hotel, color: Colors.white),
                onPressed: () {
                  setState(() {
                    textColor = Colors.blueAccent;
                    text = "hotel text";
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.account_box, color: Colors.white),
                onPressed: () {
                  setState(() {
                    textColor = Colors.yellow;
                    text = "Intermediate";
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  final makeBody = Container(
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white24))),
                child: Icon(
                  Icons.autorenew,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0),
              title: Text(
                "Introduction to Driving",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Icon(
                    Icons.linear_scale,
                    color: Colors.yellowAccent,
                  ),
                  Text(text, style: TextStyle(color: textColor))
                ],
              ),
            ),
          ),
        );
      },
    ),
  );

  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Text("title"),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {},
      )
    ],
  );
}
