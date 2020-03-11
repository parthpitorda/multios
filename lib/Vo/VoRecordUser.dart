import 'package:cloud_firestore/cloud_firestore.dart';

class RecordUser {
  final String name;
  final int votes;
  final DocumentReference reference;

  RecordUser.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        votes = map['votes'];

  RecordUser.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$votes>";


  Map<String, dynamic> toJson() => {
    "first_name": name,
    "last_name": votes,
    "email": name,
  };
}