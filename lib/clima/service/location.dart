import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
