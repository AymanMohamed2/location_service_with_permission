library location_service;

import 'package:location/location.dart';
import 'package:location_service_with_permission/exeptions.dart';
import 'package:permission_handler/permission_handler.dart'
    hide PermissionStatus;
import 'package:shared_preferences/shared_preferences.dart';

class LocationService {
  Location _location = Location();

  Future<void> _checkAndRequestLocationService() async {
    var isServiceEnabled = await _location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await _location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiceExeption('Location service is not enabled.');
      }
    }
  }

  Future<void> _checkAndRequestLocationPermission() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      throw CheckAndRequestLocationPermessionExeption(
        'Location permission is denied forever.',
      );
    }
    if (permissionStatus == PermissionStatus.denied) {
      if (prefs.getInt('permissionStatus') != null) {
        if (prefs.getInt('permissionStatus')! >= 2) {
          openAppSettings();
        } else {
          permissionStatus = await _location.requestPermission();
          prefs.setInt(
              'permissionStatus', prefs.getInt('permissionStatus')! + 1);
        }
      } else {
        permissionStatus = await _location.requestPermission();
        prefs.setInt('permissionStatus', prefs.getInt('permissionStatus') ?? 1);
      }
      if (permissionStatus != PermissionStatus.granted) {
        throw CheckAndRequestLocationPermessionExeption(
          'Location permission is denied.',
        );
      }
    }
  }

  Future<void> getRealTimeLocationData(
      void Function(LocationData)? onData) async {
    await _checkAndRequestLocationService();
    await _checkAndRequestLocationPermission();
    _location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocationData() async {
    await _checkAndRequestLocationService();
    await _checkAndRequestLocationPermission();
    return await _location.getLocation();
  }
}