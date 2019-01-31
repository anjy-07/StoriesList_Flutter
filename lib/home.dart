import 'package:flutter/material.dart';
import 'state.dart';
import 'state_widget.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeScreenState();
}
StateModel appState;
class HomeScreenState extends State<HomeScreen> {

  Widget build(BuildContext context) {
    appState = MyInheritedWidget.of(context).state;
    return new MyInheritedWidget(
      child: new Scaffold(
        body: WidgetA(),
      ),
    );
  }
}

class WidgetA extends StatelessWidget {

   DefaultTabController _buildTabView({Widget body}) {
    const double _iconSize = 20.0;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 2.0,
            bottom: TabBar(
              labelColor: Colors.red,
              tabs: [
                Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                Tab(icon: Icon(Icons.local_drink, size: _iconSize)),
                Tab(icon: Icon(Icons.favorite, size: _iconSize)),
                Tab(icon: Icon(Icons.settings, size: _iconSize)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: body,
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    
     _buildLoadingIndicator() {
      return Center(
        child: new CircularProgressIndicator(),
      );
    }

    Widget _buildContent() {
      if (appState.isLoading) {
        return _buildLoadingIndicator();
      } else if (!appState.isLoading && appState.user == null) {
        return new LoginScreen();
      } else {    
         return _buildTabView();
      }    
    }

    return Scaffold(
      body: Container(
        child:  _buildContent(),      
      ),
    );
  }
}

