import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'bloc_provider.dart';
import 'friends_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        bloc: FriendsBloc('my uuid goes here'),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireStore BLoC'),
        centerTitle: true,
      ),
      body: backendWidget(context),
    );
  }

  Widget backendWidget(BuildContext context) {
    final _bloc = BlocProvider.of<FriendsBloc>(context);
    return StreamBuilder(
        stream: _bloc.outFriendsProfiles,
        builder: (context, snapshot) {
          return profileWidget(context, snapshot.data.documents);
        });
  }

  Widget profileWidget(BuildContext context, List<DocumentSnapshot> documents) {
    return ListView.builder(
      itemCount: documents.length,
      itemBuilder: (context, index) {
        DocumentSnapshot ds = documents[index];
        return Card(
          elevation: 8.0,
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(ds.data['name']),
          ),
        );
      },
    );
  }
}
