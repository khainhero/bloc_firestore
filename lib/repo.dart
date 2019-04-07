import 'package:cloud_firestore/cloud_firestore.dart';

class Repo {
  final _firestore = Firestore.instance;

  Future<QuerySnapshot> getFriends() {
    CollectionReference ref = _firestore.collection('baby');
    return ref.getDocuments();
  }
}

Repo repo = Repo();
