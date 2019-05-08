import 'dart:io';

import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/services.dart';

class UploadImage extends StatefulWidget {
  File _image;

  UploadImage(this._image);

  @override
  State<StatefulWidget> createState() {
    return _UploadImageState();
  }

}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Upload a Pic"),
            actions: <Widget>[
              new Column(
                  children: <Widget>[
                    new IconButton(
                        icon: Icon(Icons.share, color: Colors.white),
                        iconSize: 40, padding: EdgeInsets.only(right: 30),
                        onPressed: () => shareImage("Feedback Image")
                    )
                  ]
              )
            ]
        ),
        body: Center(
            child: Image.file(widget._image)
        )
    );
  }

  Future shareImage(String text) async {
    final ByteData bytes = await rootBundle.load(widget._image.path);
    await Share.file('food item' , 'food.png', bytes.buffer.asUint8List(), 'image/png');
  }

}