import 'package:location/location.dart';

import '../../utility/console_log.dart';

class LocationService {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  LocationService._();

  static LocationData? locationData;
  static final Location _location = Location();

  static bool serviceEnabled = false;
  static PermissionStatus permissionGranted = PermissionStatus.denied;

  static Future<LocationData?> getCurrentPosition({
    required Function onServiceDisabled,
    required Function onPermissionDenied,
  }) async {
    try {
      serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          return onServiceDisabled();
        }
      }

      permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return onPermissionDenied();
        }
      }

      locationData = await _location.getLocation();
      return locationData!;
    } catch (e) {
      cl(e);
      return null;
    }
  }
}
