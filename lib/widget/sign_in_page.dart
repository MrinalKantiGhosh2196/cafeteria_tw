import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

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
              child: FacebookSignInButton(
                  onPressed: () => _signInWithFacebook(context)
              )
            )
          ],
        ),
      )
    );
  }

  _signInWithFacebook(context) async{
    FacebookLogin fbLogin = new FacebookLogin();
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final facebookLoginResult = await fbLogin
        .logInWithReadPermissions(['email', 'public_profile']);
    FacebookAccessToken myToken = facebookLoginResult.accessToken;
    AuthCredential credential= FacebookAuthProvider.getCredential(accessToken: myToken.token);
    final FirebaseUser user = await _auth.signInWithCredential(credential);
   if(user != null){
     Navigator.of(context).pushReplacementNamed("/home");
   } else{
     Navigator.of(context).pushReplacementNamed('/');
   }
  }

}