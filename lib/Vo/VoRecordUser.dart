import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteData {
  final String price;
  final String propertyFile;
  final DocumentReference reference;

  FavouriteData.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : assert(map['price'] != null),
        assert(map['propertyFile'] != null),
        price = map['price'].toString(),
        propertyFile = map['propertyFile'].toString();

  FavouriteData.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$price:$propertyFile>";

}