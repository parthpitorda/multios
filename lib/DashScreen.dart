
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multios/Network/ApiStateListener.dart';
import 'package:multios/Network/RestDatasource.dart';
import 'package:multios/Vo/PropertyData.dart';

import 'FavouriteScreen.dart';


Firestore firestore;

class DashScreen extends StatefulWidget {
  RestDatasource api;
  int page = 3;
  PropertyData data = new PropertyData();

  @override
  _DashScreenState createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> implements ApiStateListener{
  TextEditingController searchController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(title: Text("Property demo."),),
      body: new Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: CupertinoTextField(
                  keyboardType: TextInputType.text,
                  controller: searchController,
                  cursorColor: Colors.black,
                  placeholder: "Search here..",
                  placeholderStyle:TextStyle(color: Colors.grey) ,
                  style: TextStyle(color: Colors.grey),

                ),
              ),
              FlatButton(onPressed: (){
                if(searchController.text.toString().trim() !="" &&searchController.text.toString().trim().length>2){
                  widget.page = 1;
                  widget.data = new PropertyData();
                  getData(searchController.text.toString().trim());
                }else{
                  showToast("Please enter vaild name.");
                }

              },color: Colors.blue,child: Text("Search."),)
            ],
          ),
          if (_isLoading) Center(child: CircularProgressIndicator()) else NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!_isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                getData("Arizona");
              }
              return true;
            },
            child: Expanded(
              child: ListView.builder(
                  itemCount: widget.data!=null&&widget.data.result!=null&&widget.data.result.propertyList!=null?widget.data.result.propertyList.length:0,
                  itemBuilder: (context, index) {
                    return  Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Stack(
                          children: <Widget>[
                            Image.network(widget.data.result.propertyList[index].propertyFile,height: 250,),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Column(
                                children: <Widget>[

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: IconButton(
                                      icon: Icon(widget.data.result.propertyList[index].isFavourite?Icons.favorite:Icons.favorite_border,color: Colors.white,),
                                      onPressed: ()=>{
                                        setState((){
                                          widget.data.result.propertyList[index].isFavourite = widget.data.result.propertyList[index].isFavourite?false:true;
                                        }),
                                        showToast("Adding to favorite"),

                                      firestore.collection('baby')
                                          .document(widget.data.result.propertyList[index].user.toString())
                                          .setData({"propertyFile": widget.data.result.propertyList[index].propertyFile.toString(), "price": widget.data.result.propertyList[index].homePrice.toString()})
                                          .then((result) => {
                                      }).catchError((err) => print(err))
                                      },
                                    ),
                                  ),
                                  Text(widget.data.result.propertyList[index].homePrice.toString(),style: TextStyle(color:Colors.white,fontSize: 20),),
                                ],
                              ),
                            ),

                          ],
                        )
                    );
                  }
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new FloatingActionButton(
                  elevation: 12.0,
                  tooltip: "Favourit Property",
                  child: new Icon(Icons.favorite),
                  backgroundColor: new Color(0xFFE57373),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavouriteScreen()),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  void onError(data) {

    setState(() {
      _isLoading= false;
    });
  }

  @override
  void onSuccess(data) {
    if(data.status==false){
    }else{
      setState(() {
        if(data is PropertyData){
          _isLoading= false;
          if(widget.data.result!=null){
            widget.data.result.propertyList.addAll(data.result.propertyList);

          }else{
            widget.data.result = data.result;
          }
        }
      });
    }
  }

  @override
  void onNoNetWork(ConnectivityResult result) {

    if(result == ConnectivityResult.none){
      showToast("Please check network connectivity");
    }

  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    widget.api = new RestDatasource(this);

    firestore = Firestore.instance;

    getData("Arizona");
  }

  @override
  void dispose() {
    super.dispose();
  }

  getData(String suggestion)  {
    setState(() {
      _isLoading = true;
    });
    widget.api.searchProperty(widget.page.toString(),suggestion);
    widget.page=widget.page+1;
  }

  showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1);
  }

}
