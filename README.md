location_service: Effortless Location Management in Flutter

This package simplifies location access in Flutter apps by handling permissions and service checks for you.

Installation:

Add location_service to your pubspec.yaml dependencies:
YAML
dependencies:
  location_service: ^1.0.0 (or latest version)
يُرجى استخدام الرمز البرمجي بحذر.

Import the package in your Dart code:
Dart
import 'package:location_service/location_service.dart';
يُرجى استخدام الرمز البرمجي بحذر.

Usage:

Checking Permissions and Service Status:

Before using location features, ensure the service is enabled and permissions are granted:

Dart
final locationService = LocationService();

try {
  await locationService._checkAndRequestLocationService();
  await locationService._checkAndRequestLocationPermission();
  // Location is ready for use!
} on LocationServiceExeption catch (e) {
  // Handle permission or service errors (e.g., display an error message)
}
يُرجى استخدام الرمز البرمجي بحذر.

Fetching Single Location Data:

Dart
Future<LocationData> getLocationData() async {
  try {
    return await locationService.getLocationData();
  } on LocationServiceExeption catch (e) {
    // Handle errors (e.g., display an error message)
  }
}
يُرجى استخدام الرمز البرمجي بحذر.

Getting Real-Time Location Updates:

Dart
void getRealTimeLocationData(void Function(LocationData) onData) async {
  try {
    locationService.getRealTimeLocationData(onData);
  } on LocationServiceExeption catch (e) {
    // Handle errors (e.g., display an error message)
  }
}
يُرجى استخدام الرمز البرمجي بحذر.

Additional Notes:

The LocationServiceExeption class provides informative error messages for handling permission and service issues.
Consider using a state management solution to manage location data throughout your app.
Contributing:

We welcome contributions to this package! Please refer to the contribution guidelines in the CONTRIBUTING.md file (if you choose to include one).