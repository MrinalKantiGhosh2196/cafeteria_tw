import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:local_auth/local_auth.dart';

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
            ),
            new Padding(padding: EdgeInsets.only(top: 30)),
            new Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: MaterialButton(
                  child: Icon(Icons.fingerprint, size: 200),
                  onPressed: () => _startAuthentication(context)),
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

  _startAuthentication(BuildContext context) async{
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Tapped ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    try{
      var localAuth = new LocalAuthentication();
      bool didAuthenticate = await localAuth.authenticateWithBiometrics(
          localizedReason: 'Please authenticate to show account balance');
      if(didAuthenticate){
        Navigator.of(context).pushReplacementNamed("/home");
      } else{
        Navigator.of(context).pushReplacementNamed('/');
      }
    } catch (e) {
      print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ${e.toString()} ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    }

  }

}