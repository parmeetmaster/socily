import 'package:geolocator/geolocator.dart';

class LocationHolder {
  bool status = false;
  bool haspermission = false;
  bool islocationEnable = false;
  Position? locationData;
  String message = "";
}

// ⚠ please make sure intialisation is performed when re-use this class in main
class Flocation {
  static Geolocator location = new Geolocator();
  static LocationHolder instance = new LocationHolder();

  // setting start location
  static setStartLocation() async {
    await getLocation();
  }

  static requestPermission() async {
    await Geolocator.requestPermission();
  }

// get latest location
  static getLocation() async {
    bool _serviceEnabled;

    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    if (!_serviceEnabled) {
      _serviceEnabled = await Geolocator.openLocationSettings();
      if (!_serviceEnabled) {
        instance.haspermission = false;
        instance.status = false;
        instance.message = "Please Enable Gps from Settings";
        //   return instance;
      }
    }

    if (permission == LocationPermission.denied) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        instance.message = "Permission Denied Forever";
        instance.locationData = null;
        instance.islocationEnable = false;
        instance.status = false;
        instance.haspermission = false;
        Geolocator.openAppSettings();
      }

      if (permission != LocationPermission.always ||
          permission != LocationPermission.whileInUse) {
        instance.message = "Permission Denied";
        instance.locationData = null;
        instance.islocationEnable = false;
        instance.status = false;
        instance.haspermission = false;
        //  return instance;
      }
    }

    if ((permission == LocationPermission.whileInUse ||
            permission == LocationPermission.always) &&
        _serviceEnabled == true) {
      instance.status = true;
      instance.haspermission = true;
      instance.message = "Permission granted";
      instance.islocationEnable = true;
      instance.locationData = await Geolocator.getCurrentPosition();
      //  return instance;
    }

    return instance;
  }
}
