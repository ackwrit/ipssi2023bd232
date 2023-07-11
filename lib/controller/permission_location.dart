
import 'package:geolocator/geolocator.dart';

class PermissionLocation {

  Future <Position>init() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("la localisation n'est pas disponibles");
    }
    else
      {
        LocationPermission permission = await Geolocator.checkPermission();
        return checkPermission(permission);
      }
  }


  Future<Position>checkPermission(permission) async {
    switch (permission){
      case LocationPermission.denied : return Geolocator.requestPermission().then((value) => checkPermission(value));
      case LocationPermission.deniedForever : return Future.error("refus de donnée l'accès");
      case LocationPermission.unableToDetermine : return Geolocator.requestPermission().then((value) => checkPermission(value));
      case LocationPermission.always : return Geolocator.getCurrentPosition();
      case LocationPermission.whileInUse : return Geolocator.getCurrentPosition();
      default: return Future.error("error");

    }

  }
}