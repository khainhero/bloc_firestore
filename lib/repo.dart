import 'package:cloud_firestore/cloud_firestore.dart';

class Repo {
  final _firestore = Firestore.instance;

  Future<QuerySnapshot> getFriends(String myUUID) {
    CollectionReference ref = _firestore
        .collection('userProfiles')
        .document(myUUID)
        .collection('myFriends');
    return ref.getDocuments();
  }
}

Repo repo = Repo();
