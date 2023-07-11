import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ipssi_bd23_2/controller/DataMapsController.dart';
import 'package:ipssi_bd23_2/controller/NoDataMapsController.dart';
import 'package:ipssi_bd23_2/controller/permission_location.dart';

class MyMapView extends StatefulWidget {
  const MyMapView({Key? key}) : super(key: key);

  @override
  State<MyMapView> createState() => _MyMapViewState();
}

class _MyMapViewState extends State<MyMapView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
        future: PermissionLocation().init(),
        builder: (context,snap){
          if(snap.data == null){
            return const NoDataMaps();
          }
          else {
            Position locationPosition = snap.data!;
            return DataMaps(position: locationPosition,);
          }
        }
    );
  }
}
