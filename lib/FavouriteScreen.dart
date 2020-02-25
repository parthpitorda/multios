
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multios/Vo/VoRecordUser.dart';

List<Widget> widgets = [];
Firestore firestore;
bool isSwitched = true, isSearch = false;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


class FavouriteScreen extends StatefulWidget {
  FavouriteScreen({Key key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Favourite list.."),
      ),

      body: _buildBody(context),
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

          FavouriteData recordUser =
              new FavouriteData.fromSnapshot(snapshot.data.documents[0]);

          return _buildList(context, snapshot.data.documents);
        },
      );
    }
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = FavouriteData.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.price),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child:  Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Stack(
              children: <Widget>[
                Image.network(record.propertyFile.toString(),height: 250,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Column(
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.favorite,color: Colors.white,),
                          onPressed: (){

                          },
                        ),
                      ),
                      Text(record.price.toString().toString(),style: TextStyle(color:Colors.white,fontSize: 20),),
                    ],
                  ),
                ),

              ],
            )
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    firestore = Firestore.instance;
//    firestore.settings(persistenceEnabled: true,host: "",sslEnabled: true,timestampsInSnapshotsEnabled: false);

  }


  @override
  void dispose() {
    setState(() {
      isSearch = false;
    });
    super.dispose();
  }
}