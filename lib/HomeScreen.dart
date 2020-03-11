import 'dart:io' as prefix0;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' as prefix1;
import 'package:location/location.dart';
import 'package:multios/LoginScreen.dart';
import 'package:multios/MapScreen.dart';
import 'package:multios/Vo/VoRecordUser.dart';
import 'package:multios/WebSocekt.dart';
import 'package:multios/database/DatabaseHelper.dart';
import 'package:multios/utils/TagValues.dart';
import 'package:multios/utils/Utils.dart';
import 'package:multios/utils/WebView.dart';
import 'package:web_socket_channel/io.dart';

TextEditingController name;
TextEditingController votes;
List<Widget> widgets = [];
Location location;
Firestore firestore;
bool isSwitched = true, isSearch = false, isServiceRunning = false;
DatabaseHelper databaseHelper;

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          child: new Builder(
              builder: (context) => IconButton(
                    icon: new Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  )),
          onTap: () {},
        ),
        title: Text("Location Tracer"),
        actions: <Widget>[
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                isSwitched
                    ? Utils.showToast("Location Update Start")
                    : Utils.showToast("Location Update Stop");
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
          new IconButton(
            icon: new Icon(Icons.monetization_on),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _initDrawer(context),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: GestureDetector(
              child: new Icon(Icons.home),
              onTap: () {},
            ),
            title: new Text("Home"),
            backgroundColor: Colors.blueGrey,
          ),
          new BottomNavigationBarItem(
            icon: GestureDetector(
              child: new Icon(Icons.search),
              onTap: () => {},
            ),
            title: new Text("Search"),
            backgroundColor: Colors.blueGrey,
          ),
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() => _index = index);
          switch (index) {
            case 0:
              setState(() {
                isSearch = false;
              });
              break;
            case 1:
              setState(() {
                isSearch = true;
              });
              Utils.navigateToSubPage(
                  context,
                  WebSocket(
                    title: "title",
                    channel:
                        IOWebSocketChannel.connect('ws://echo.websocket.org'),
                  ));
              break;
          }
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          startForegroundService();
//          _addNewRecord(context);
        },
        child: new Icon(Icons.add),
      ),
      body: _buildBody(context),
    );
  }

  Widget _initDrawer(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: FlutterLogo(),
            decoration: new BoxDecoration(
              color: Colors.blue,
            ),
          ),
          GestureDetector(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: new Text(
                  "About",
                  style: TextStyle(fontSize: 18.0),
                )),
            onTap: () => {
              Navigator.pop(context),
              Utils.navigateToSubPage(
                  context,
                  WebViewScreen(
                    url: "https://www.oneclickitsolution.com/about-us/",
                    name: "About",
                  ))
            },
          ),
          GestureDetector(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: new Text(
                  "Contact Us.",
                  style: TextStyle(fontSize: 18.0),
                )),
            onTap: () => {
              Navigator.pop(context),
              Utils.navigateToSubPage(
                  context,
                  WebViewScreen(
                    url: "https://www.oneclickitsolution.com/contact-us/",
                    name: "Contact Us",
                  )),
            },
          ),
          GestureDetector(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: new Text(
                  "Terms of service",
                  style: TextStyle(fontSize: 18.0),
                )),
            onTap: () => {
              Navigator.pop(context),
              Utils.navigateToSubPage(
                  context,
                  WebViewScreen(
                    url: "https://www.oneclickitsolution.com/contact-us/",
                    name: "Terms of Service",
                  )),
            },
          ),
          GestureDetector(
            child: Padding(
                padding: EdgeInsets.all(1.0),
                child: new Text(
                  "",
                  style: TextStyle(fontSize: 10.0),
                )),
          ),
          GestureDetector(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: new Text(
                  "LogOut",
                  style: TextStyle(fontSize: 18.0),
                )),
            onTap: () => {
              Utils.ClearPref(),
              Utils.showToast("logout succesfully"),
              Utils.navigateToSubPage(context, LoginScreen())
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (isSearch) {
      return LinearProgressIndicator();
    } else {
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('baby').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();

          RecordUser recordUser =
              new RecordUser.fromSnapshot(snapshot.data.documents[0]);
          databaseHelper.createCustomer(recordUser);

          return _buildList(context, snapshot.data.documents);
        },
      );
    }
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = RecordUser.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.votes.toString()),
          onTap: () => record.reference.updateData({'votes': record.votes + 1}),
          onLongPress: () => {
            Utils.navigateToSubPage(context, MapScreen(usrName: record.name))
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    firestore = Firestore.instance;
    firestore.settings(persistenceEnabled: true,host: "",sslEnabled: true,timestampsInSnapshotsEnabled: false);

    name = new TextEditingController();
    votes = new TextEditingController();

    location = new Location();

    databaseHelper = new DatabaseHelper();
    databaseHelper.createDatabase();

    // location.changeSettings(
    //     accuracy: LocationAccuracy.HIGH, interval: 100, distanceFilter: 10);
    location.onLocationChanged().listen((LocationData currentLocation) {
      updateLocationServer(currentLocation);
    });
  }

  void updateLocationServer(LocationData currentLocation) {
    if (isSwitched) {
      Utils.getDataToPrefString(Utils.PREF_NAME).then((value) => {
            firestore.collection("location").document(value).setData({
              "lat": currentLocation.latitude,
              "lng": currentLocation.longitude
            }),
            print(currentLocation.latitude),
            print(currentLocation.longitude),
          });
    } else {
      print("to update location in server please switch on");
    }
  }

  @override
  void dispose() {
    setState(() {
      isSearch = false;
    });
    super.dispose();
  }
}

void startForegroundService() async {
  MethodChannel methodChannel = MethodChannel("coco");

  methodChannel.setMethodCallHandler(myUtilsHandler);

  if (prefix0.Platform.isAndroid) {
    if (isServiceRunning) {
      isServiceRunning = false;
      var methodChannel = MethodChannel("coco");
      String data = await methodChannel.invokeMethod("stopService");
      debugPrint(data);
    } else {
      isServiceRunning = true;
      var methodChannel = MethodChannel("coco");
      String data = await methodChannel.invokeMethod("startService");
      debugPrint(data);
    }
  }
}

Future<dynamic> myUtilsHandler(MethodCall methodCall) async {
  switch (methodCall.method) {
    case 'updateLocation':
      Utils.showToast('updatelocatoin');
      return 'location update start';

  }
}

_addNewRecord(BuildContext context) async {
  await showDialog<String>(
      context: context,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Please fill fields to create new record"),
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Record name'),
              controller: name,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Votes"),
              controller: votes,
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Add"),
            color: Colors.amber,
            textColor: Colors.black,
            onPressed: () {
              if (name.text.isNotEmpty && votes.text.isNotEmpty) {
                if (userList.contains(name.text)) {
                  Utils.showToast("User Already regester!..");
                  name.clear();
                } else {
                  Firestore.instance
                      .collection('baby')
                      .document(name.text)
                      .setData(
                          {"name": name.text, "votes": int.parse(votes.text)})
                      .then((result) => {
                            Navigator.pop(context),
                            name.clear(),
                            votes.clear(),
                          })
                      .catchError((err) => print(err));
                }
              }
            },
          ),
          FlatButton(
            child: Text("Cancel"),
            color: Colors.amber,
            textColor: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ));
}
