import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'Stories.dart';

class StoryDetail extends StatefulWidget {
  final Story story;
  StoryDetail(this.story);
  @override
  _StoryDetailPageState createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetail> {
  final double storyAvatarSize = 150.0;
  double _sliderValue = 10.0;
  Widget get storyImage {  
    return  Container(
      height: storyAvatarSize,
      width: storyAvatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(
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
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/me.jpg'),
        ),
      ),  
    );   
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
        ),
        Text(' ${widget.story.storyName} ',
            style: Theme.of(context).textTheme.display2),
      ],
    );
  }

  Widget get storyProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.lightBlue[400],
            Colors.lightBlue[300],
            Colors.lightBlue[200],
            Colors.lightBlue[100],
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          storyImage,
          Text(
            '${widget.story.storyName}',
            style: TextStyle(fontSize: 27.0, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.story.storyName,
            style: TextStyle(fontSize: 13.0, color: Colors.black),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(widget.story.description, style: TextStyle(fontSize: 18.0, color: Colors.grey[800])),
          ),
          
        ],
      ),
    );
  }

   Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[      
              Flexible(
                flex: 1,
                child: Slider(
                  activeColor: Colors.indigoAccent,
                  min: 0.0,
                  max: 15.0,
                  onChanged: (newRating) {
                    setState(() => _sliderValue = newRating);
                  },
                  value: _sliderValue,
                ),
              ),
              Container(
                width: 50.0,
                alignment: Alignment.center,
                child: Text('${_sliderValue.toInt()}',
                    style: Theme.of(context).textTheme.display1),
              ),
            ],
          ),
        ),         
      ],    
    );
  }
  
  Widget get buttons{
    return Column(
          children: <Widget>[
            RaisedButton(
              child: Text('share to twitter'),
              onPressed: () async {
                var response = await FlutterShareMe().shareToTwitter(
                    msg: widget.story.description );
                if (response == 'success') {
                  print('navigate success');
                }
              },
            ),
            RaisedButton(
              child: Text('share to shareWhatsApp'),
              onPressed: () {
                FlutterShareMe().shareToWhatsApp(
                    msg:
                        widget.story.description );
              },
            ),
            RaisedButton(
              child: Text('share to shareFacebook'),
              onPressed: () {
                FlutterShareMe().shareToFacebook(
                    msg : widget.story.description );
              },
            ),
            RaisedButton(
              child: Text('share to System'),
              onPressed: () async {
                var response =
                    await FlutterShareMe().shareToSystem(msg: 'Hello Flutter');
                if (response == 'success') {
                  print('navigate success');
                }
              },
            ),
          ],
        );
  }

void _pushAddTodoScreen() {
  Navigator.of(context).push(
    new MaterialPageRoute(
      builder: (context) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Share')
          ),
          body: Container(
            width : 100,
            height : 100,
            decoration: BoxDecoration(        
            shape: BoxShape.rectangle,
            ),
            child  : buttons
          ) 
        );
      }
    )
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Meet ${widget.story.storyName}'),
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                  _pushAddTodoScreen();
              },
            ),
      ],
    ),
      body: ListView(
        children: <Widget>[
          storyProfile,
          buttons       
        ],
      ),
    );
  }
}

