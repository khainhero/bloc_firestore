import 'dart:async';

import 'bloc_provider.dart';
import 'repo.dart';

class FriendsBloc implements BlocBase {
  FriendsBloc(String myUUID) {
    repo
        .getFriends(myUUID)
        .asStream()
        .listen((data) => _friendsController.add(data));
  }
  StreamController _friendsController = StreamController.broadcast();
  Stream get outFriendsProfiles => _friendsController.stream;

  @override
  void dispose() {
    _friendsController.close();
  }
}
