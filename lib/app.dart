import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stories',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() => runApp(MyApp());

// final dummySnapshot = [
//  {"name": "Filip", "votes": 15},
//  {"name": "Abraham", "votes": 14},
//  {"name": "Richard", "votes": 11},
//  {"name": "Ike", "votes": 10},
//  {"name": "Justin", "votes": 1},
// ];

// class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Baby Names',
//      home: MyHomePage(),
//    );
//  }
// }

// class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() {
//    return _MyHomePageState();
//  }
// }

// class _MyHomePageState extends State<MyHomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Baby Name Votes')),
//      body: _buildBody(context),
//    );
//  }

// Widget _buildBody(BuildContext context) {
//  return StreamBuilder<QuerySnapshot>(
//    stream: Firestore.instance.collection('UserStories').snapshots(),
//    builder: (context, snapshot) {
//      if (!snapshot.hasData) return LinearProgressIndicator();
//      else{
//       snapshot.data.documents.map((data) 
//       {
//         var record = Record.fromSnapshot(data);
//         print(record);
//       } ).toList();
//       return _buildList(context, snapshot.data.documents);
//      }


    
//    },
//  );
// }

//  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot)  {
//    return ListView(
//      padding: const EdgeInsets.only(top: 20.0),
//      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//    );
//  }

//  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//    final record = Record.fromSnapshot(data);

//    return Padding(
//      key: ValueKey(record.storyName),
//      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.grey),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: Text(record.storyName),
//          trailing: Text(record.description),
//          onTap: () => print(record),
//        ),
//      ),
//    );
//  }
// }

// class Record {
//  final String description;
//  final String storyName;
//  final String writer;
//  final DocumentReference reference;

//  Record.fromMap(Map<String, dynamic> map, {this.reference})
//      : assert(map['description'] != null),
//        assert(map['storyName'] != null),
//        assert(map['writer'] != null),
//        description = map['description'],
//        storyName = map['storyName'],
//        writer = map['writer'];

//  Record.fromSnapshot(DocumentSnapshot snapshot)
//      : this.fromMap(snapshot.data, reference: snapshot.reference);

//  @override
//  String toString() => "Record<$description:$storyName:$writer>";
// }