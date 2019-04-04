import 'package:cloud_firestore/cloud_firestore.dart';

class Repo {
  final _firestore = Firestore.instance;

  Future<QuerySnapshot> getFriends(String myUUID) {
    return _firestore
        .collection('userProfiles')
        .document(myUUID)
        .collection('myFriends')
        .getDocuments();
  }
}

Repo repo = Repo();
