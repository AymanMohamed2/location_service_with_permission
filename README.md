## Location Service with Permissions (location_service_with_permission)

**Effortlessly manage location services and permissions in your Flutter apps.**

This package simplifies location tracking by automating permission requests and providing convenient methods for accessing location updates, including background mode support on Android and iOS.

**Getting Started:**

1. **Add the package to your `pubspec.yaml` file:**

```yaml
dependencies:
  location_service_with_permission: ^version_number
```

Markdown
## Android

**Using Location Background Mode and Permissions**

Using Location Background Mode and Permissions

To use location background mode on Android, you need to enable it using the LocationService.enableBackgroundMode(true) API before accessing location in the background. The package will request the necessary permissions (android.permission.FOREGROUND_SERVICE and android.permission.ACCESS_BACKGROUND_LOCATION) during initialization.

## iOS

**Using Location Background Mode and Permissions**

Using Location Background Mode and Permissions

To receive location updates when the app is in the background on iOS, add the following key-value pair to your Info.plist file:

UIBackgroundModes = [
  location
]

The package will request the appropriate permission (either NSLocationWhenInUseUsageDescription or NSLocationAlwaysAndWhenInUseUsageDescription) based on your usage scenario.

## Maintainers

- [Ayman Mohamed] (original creator)
- [Abdelrahman Mostafa]

[Ayman Mohamed]: https://github.com/AymanMohamed2
[Abdelrahman Mostafa]: https://github.com/Abd0-M0stafa
