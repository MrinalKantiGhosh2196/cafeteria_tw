import 'package:flutter/material.dart';
import 'package:cafeteria_tw/widget/homepage.dart';
import 'package:cafeteria_tw/service/time_provider_service.dart';
import 'package:cafeteria_tw/widget/login_page.dart';
import 'package:cafeteria_tw/constants/constant_texts.dart';
import 'package:cafeteria_tw/widget/image_loader.dart';
import 'widget/webview_implementation.dart';
import 'widget/maps.dart';
import 'widget/sms_reader.dart';

 class TwCafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: ConstantText.appTitle,
      theme: new ThemeData(
        primaryColor: Colors.teal
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => new Homepage(new TimeProvider()),
        '/login' : (context) => new LoginPage(),
        '/imageLoad' : (context) => ImageLoader(),
        '/webviewForGithub' : (context) => WebviewImplementation("Github"),
        '/map': (context) => new MyMaps(),
        '/smsReader': (context) => new MySmsReceiver()
      },
    );
  }
 }