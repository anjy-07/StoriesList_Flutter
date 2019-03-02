import 'package:flutter/material.dart';
import 'state.dart';
import 'state_widget.dart';
import 'login.dart';
import 'StoryList.dart';
import 'Stories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  StateModel appState;

  List<Story> storiesList = [];

  // List<Story> initialDoggos = []
  //   ..add(Story('The Break Up', 'By Me',
  //       'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
  //   ..add(Story('Meet Me Again', 'By Sheetal', 'Best in Show 1999'))
  //   ..add(Story('Life is Beautiful', 'By Prasheel',
  //       'Star good boy on international snooze team.'))
  //   ..add(Story('Smile Always', 'By Nativepennings', 'A Very Good Boy'))
  //   ..add(Story('Toxic', 'By Ragibi', 'Self proclaimed human lover.'));

  Widget _buildStories({Widget body}) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Tiny Tales'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[400]),
        child: Center(
            child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('UserStories').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return LinearProgressIndicator();
            else {
              storiesList.clear();
              snapshot.data.documents.map((data) {
                print(data['storyName']);
                storiesList.add(new Story(
                    data['storyName'], data['writer'], data['description']));
                var record = Record.fromSnapshot(data);
                print(record);
              }).toList();

              print(storiesList.length);
              return StoryList(storiesList);
            }
          },
        )),
      ),
    );
  }

  Widget _buildContent() {
    if (appState.isLoading) {
      return _buildLoadingIndicator();
    } else if (!appState.isLoading && appState.user == null) {
      return new LoginScreen();
    } else {
      return _buildStories();
    }
  }

  Center _buildLoadingIndicator() {
    return Center(
      child: new CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build the content depending on the state:
    appState = StateWidget.of(context).state;
    return _buildContent();
  }
}

class Record {
  final String description;
  final String storyName;
  final String writer;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['description'] != null),
        assert(map['storyName'] != null),
        assert(map['writer'] != null),
        description = map['description'],
        storyName = map['storyName'],
        writer = map['writer'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$description:$storyName:$writer>";
}
