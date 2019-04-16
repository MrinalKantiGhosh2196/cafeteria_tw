import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyMaps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyMapsState ();

}

class MyMapsState extends State<MyMaps> {
  GoogleMapController mapController;

  var currentLocation;

  void initState(){
    super.initState();
    Geolocator().getCurrentPosition().then((currentLoc){
      setState(() {
        currentLocation =  currentLoc;
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    if(currentLocation != null){
      return GoogleMap(
        initialCameraPosition: new CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 14.4746
        ),
        compassEnabled: true,
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers: ,
      );
    } else{
      return Scaffold();
    }
  }
}