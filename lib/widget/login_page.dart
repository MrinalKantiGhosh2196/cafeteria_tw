import 'package:flutter/material.dart';
import 'package:cafeteria_tw/constants/style.dart';
import 'package:cafeteria_tw/constants/constant_texts.dart';
import 'package:cafeteria_tw/model/user.dart';
import 'package:cafeteria_tw/service/user_authenticator.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{
  final TextEditingController usernameTextFieldController = new TextEditingController();
  final TextEditingController passwordTextFieldController = new TextEditingController();
  bool _showErrorMessage;

  @override
  void initState() {
    _showErrorMessage = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          elevation: 0,
        ),
        backgroundColor: Colors.teal,
        body:new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
                key: new Key("adminLoginHeadingPadding"),
                padding: Style.loginWidgetsPadding,
                child: new Text(
                  ConstantText.adminLoginText,
                  style: Style.heading1White,
                )
            ),
            new Padding(
              key: new Key("usernameTextFieldPadding"),
              padding: Style.loginWidgetsPadding,
              child: TextField(
                key: new Key("usernameTextField"),
                controller: usernameTextFieldController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: ConstantText.usernameLabelText,
                  filled: true,
                  labelStyle: Style.paragraphBlack18,
                  fillColor: Colors.white,
                ),
              ),
            ),
            new Padding(
              key: new Key("passwordTextFieldPadding"),
              padding: Style.loginWidgetsPadding,
              child: TextField(
                key: new Key("passwordTextField"),
                controller: passwordTextFieldController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: ConstantText.passwordLabelText,
                  filled: true,
                  labelStyle: Style.paragraphBlack18,
                  fillColor: Colors.white,
                ),
              ),
            ),
            new Padding(
              key: new Key("loginButtonPadding"),
              padding: Style.loginWidgetsPadding,
              child: new RaisedButton(
                key: Key("loginButton"),
                child: new Text("Login"),
                color: Colors.black54,
                textColor: Colors.white,
                splashColor: Colors.blue,
                animationDuration: new Duration(microseconds: 1),
                onPressed: ()=> _authenticateUser(context),
              ),
            ),
            new Padding(key: new Key("errorMessagePadding"),
              padding: Style.loginWidgetsPadding,
              child: _displayErrorMessage()
            )
          ],
        )
    );
  }

  void _authenticateUser(BuildContext context){
    User user =  User(usernameTextFieldController.text.trim(), passwordTextFieldController.text.trim());
    if(UserAuthenticator.isAuthenticUser(user)) {
      Navigator.pop(context);
    } else {
      setState(() {
        this._showErrorMessage =  true;
      });
    }
  }

  Widget _displayErrorMessage() {
    if(this._showErrorMessage){
      return new Text(ConstantText.loginAuthenticationErrorMessage,key: Key("errorMessage"),style: Style.errorText);
    }
    return new Container();
  }

  
}