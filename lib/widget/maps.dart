import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MyMaps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyMapsState ();

}

class MyMapsState extends State<MyMaps> {
  GoogleMapController mapController;
  CameraPosition cameraPosition = new CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      compassEnabled: true,
      onMapCreated: (controller) {
        mapController = controller;
      },
    );
  }
}