import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Firestore firestore;

DocumentReference userLocationData;
Timer timer;

class MapScreen extends StatefulWidget {
  String usrName;
  MapScreen({Key key, @required this.usrName}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState(usrName);
}

class MapScreenState extends State<MapScreen> {
  String usrName;
  MapScreenState(this.usrName);

  Completer<GoogleMapController> _controller = Completer();

  LatLng latlng = new LatLng(11.521563, -11.677433);

  Set<Marker> _markers = Set();

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onCameraMove(CameraPosition position) {
    latlng = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(usrName + '  Live Location'),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: latlng,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: _onMapTypeButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.map, size: 36.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    firestore = Firestore.instance;

    userLocationData = firestore.collection("location").document(usrName);
    timer = new Timer.periodic(new Duration(seconds: 2), (Timer timer) async {
      await userLocationData.get().then((value) => {
            print(">>>>>>>>>>>>" + value.data["lat"].toString()),
            print(">>>>>>>>>>>>" + value.data["lng"].toString()),
            state(new LatLng(double.parse(value.data["lat"].toString()),
                double.parse(value.data["lng"].toString()))),
          });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _markers.clear();
    super.dispose();
  }

  void state(LatLng latLng) async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16.0));

    this.setState(() {

      _markers.clear();

      _markers.add(Marker(
        draggable: true,
        markerId: MarkerId(usrName),
        position: latLng,
        infoWindow: InfoWindow(
          title: latLng.toString(),
          snippet: 'Rating 88 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      print(_markers.first.markerId.value);
    });
  }
}
