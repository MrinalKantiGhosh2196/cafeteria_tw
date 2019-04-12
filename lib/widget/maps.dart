import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MyMaps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyMapsState ();

}

class MyMapsState extends State<MyMaps> {
  GoogleMapController myController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
    child: GoogleMap(
      onMapCreated: (controller){
        setState(() {
          myController =  controller;
        });
      },
      initialCameraPosition: CameraPosition(target: LatLng(20.5937, 78.9629,), zoom: 11.0),
      zoomGesturesEnabled: true,
      myLocationEnabled: true,

    ),
    );
  }
}