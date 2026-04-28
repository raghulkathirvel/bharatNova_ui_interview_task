import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../model/location_model.dart';

class LocationController extends GetxController{

  UserLocation? _userLocation;
  UserLocation? get userLocation => _userLocation;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Future<void> getLocation() async {
  //
  //   _isLoading = true;
  //   update();
  //   try {
  //     LocationPermission permission = await Geolocator.checkPermission();
  //
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //     }
  //
  //     if (permission == LocationPermission.deniedForever) {
  //       //return "Permission Denied";
  //     }
  //
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );
  //
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       position.latitude,
  //       position.longitude,
  //     );
  //
  //     Placemark place = placemarks.first;
  //
  //     print("Printing the locationm ${place}");
  //     _userLocation = UserLocation.fromPlacemark(lat: position.latitude, lng: position.longitude, place: place);
  //
  //     print("Printing the locationm ${_userLocation?.area ?? "not parsed correctly"}");
  //   } catch (e) {
  //    // return "Location Error";
  //   }finally{
  //     _isLoading = false;
  //     update();
  //   }
  // }

  Future<void> getLocation() async {
    _isLoading = true;
    update();

    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        _isLoading = false;
        update();
        return;
      }

      Position? lastPosition = await Geolocator.getLastKnownPosition();

      if (lastPosition != null) {
        _setLocation(lastPosition);
      }

      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      ).then((position) {
        _setLocation(position);
      });

    } catch (e) {
      log("Location Error: $e");
    } finally {
      _isLoading = false;
      update();
    }
  }

  void _setLocation(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks.first;

      _userLocation = UserLocation.fromPlacemark(
        lat: position.latitude,
        lng: position.longitude,
        place: place,
      );

      update();
    } catch (e) {
      log("Placemark Error: $e");
    }
  }
}