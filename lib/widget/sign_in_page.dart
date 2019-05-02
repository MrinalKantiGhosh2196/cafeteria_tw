import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
                key: new Key("loginButtonPadding"),
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: new RaisedButton(
                  key: Key("loginButton"),
                  child: new Text("LoginWithFacebook"),
                  animationDuration: new Duration(microseconds: 1),
                  onPressed: null,
                ))
          ],
        ),
      )
    );
  }

}