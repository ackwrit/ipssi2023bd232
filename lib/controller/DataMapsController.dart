import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DataMaps extends StatefulWidget {
  Position position;
  DataMaps({Key? key, required this.position}) : super(key: key);

  @override
  State<DataMaps> createState() => _DataMapsState();
}

class _DataMapsState extends State<DataMaps> {
  //variables
  Completer<GoogleMapController> completer = Completer();
  late CameraPosition camera;


  @override
  void initState() {
    // TODO: implement initState
    camera = CameraPosition(target: LatLng(widget.position.latitude,widget.position.longitude),zoom: 14);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      onMapCreated: (controller){
         completer.complete(controller);
      },
        initialCameraPosition: camera,

    );
  }
}
