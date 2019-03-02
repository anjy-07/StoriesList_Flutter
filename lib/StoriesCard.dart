import 'package:flutter/material.dart';
import 'Stories.dart';
import 'StoryDetail.dart';

class StoriesCard extends StatefulWidget {
  final Story story;
  StoriesCard(this.story);
  @override
  _StoriesCardState createState() => _StoriesCardState(story);
}

class _StoriesCardState extends State<StoriesCard> {
  Story story;

  _StoriesCardState(this.story);
  Widget get name {
    return Container(
      padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: Text(
              '${widget.story.storyName}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'Roboto',
                letterSpacing: 0.5,
                fontSize: 20.0,
              ),
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only( right: 3.0),
                child: Text(
                  '${widget.story.writer}',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.blueAccent[200], fontSize: 10.0),
                ),
              ),
              new Container(
                //  padding: EdgeInsets.only(top: 8.0, right: 8.0, bottom: 4.0),
                child: Text(
                  '${widget.story.description}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500], fontSize: 10.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget get storiesCard {
    // A new container
    // The height and width are arbitrary numbers for styling.
    return Container(
      width: 30.0,
      height: 300.0,
      child: Card(
        color: Colors.white,
        elevation: 15.0,
        child: Padding(
          // The class that controls padding is called 'EdgeInsets'
          // The EdgeInsets.only constructor is used to set
          // padding explicitly to each side of the child.
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 8.0,
            left: 8.0,
          ),
          child: Column(
            children: <Widget>[profilePicture, name, content],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget get profilePicture {
   return  Container(
         padding:
            new EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0, bottom: 8.0),
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              const BoxShadow(
                  // just like CSS:
                  // it takes the same 4 properties
                  offset: const Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: const Color(0x33000000)),
              const BoxShadow(
                  offset: const Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: const Color(0x24000000)),
              const BoxShadow(
                  offset: const Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: const Color(0x1F000000)),
            ],
            color: Colors.black,
            image: DecorationImage(image: AssetImage('asset/me.jpg'))),
      );   
  }

  Widget get content{
    return  Container(
    padding: new EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
    child: new Column(
      children: <Widget>[
        new Text(
         '${story.description}',
         )//   "A narrative or story is a report of connected events, real or imaginary, presented in a sequence of written or spoken words, or still or moving images, or both. The word derives from the Latin verb narrare,  which is derived from the adjective gnarus"),
      ],
        
    ),
  );
  }
  

  @override
  Widget build(BuildContext context) {
    // InkWell is a special Material widget that makes its children tappable
    // and adds Material Design ink ripple when tapped.
    return InkWell(
      // onTap is a callback that will be triggered when tapped.
      onTap: showStoryDetail,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 350.0,
          width : 30.0,
          child: storiesCard,
        ),
        // Positioned(top: 7.5, child: dogImage),
      ),
    );
  }

  showStoryDetail() {
    print("move to new screen");
    Navigator.of(context).push(
      MaterialPageRoute(
        // builder methods always take context!
        builder: (context) {
          return StoryDetail(story);
        },
      ),
    );
  }
}

 class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
        
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}