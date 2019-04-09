import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:cafeteria_tw/widget/upload_image.dart';
import "package:image_picker/image_picker.dart";

class ImageLoader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ImageLoaderState();
}

class ImageLoaderState extends State<ImageLoader> {
  File image;

  Future chooseImage(ImageSource source) async {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    File picture = await ImagePicker.pickImage(
        source: source, maxHeight: deviceHeight, maxWidth: deviceWidth);
    setState(() {
      image = picture;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return new Scaffold(
        appBar: new AppBar(
          elevation: 0,
        ),
        backgroundColor: Colors.teal,
        body: AlertDialog(
            content: new SingleChildScrollView(
                child: new ListBody(
                    children: <Widget>[
                      GestureDetector(
                        child: new Text('Take a picture'),
                        onTap: () => chooseImage(ImageSource.camera),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      GestureDetector(
                          child: new Text('Select from gallery'),
                          onTap: () => chooseImage(ImageSource.gallery)
                      )
                    ]
                )
            )
        )
        );
    } else {
      return UploadImage(image);
    }
  }
}
