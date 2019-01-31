import 'package:flutter/material.dart';
import 'google_sign_in_button.dart';
import 'state_widget.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(
      child: new Scaffold(
        body: BuildLogin(),
      ),
    );
  }
}

class BuildLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
     Text _buildText() {
      return Text(
        'Stories Login Page',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      );
    }
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              GoogleSignInButton(
                onPressed: () => state.signInWithGoogle()                               
              ),        
            ],
          ),
        ),
      ),
    );
  }
}

