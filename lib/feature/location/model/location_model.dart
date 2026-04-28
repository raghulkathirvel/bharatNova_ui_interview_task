import 'package:geocoding/geocoding.dart';

class UserLocation {
  final double latitude;
  final double longitude;
  final String? name;
  final String? street;
  final String? area;
  final String? city;
  final String? district;
  final String? state;
  final String? postalCode;
  final String? country;
  final String? countryCode;

  UserLocation({
    required this.latitude,
    required this.longitude,
    this.name,
    this.street,
    this.area,
    this.city,
    this.district,
    this.state,
    this.postalCode,
    this.country,
    this.countryCode,
  });

  factory UserLocation.fromPlacemark({
    required double lat,
    required double lng,
    required Placemark place,
  }) {
    return UserLocation(
      latitude: lat,
      longitude: lng,
      name: place.name,
      street: place.street,
      area: place.subLocality,
      city: place.locality,
      district: place.subAdministrativeArea,
      state: place.administrativeArea,
      postalCode: place.postalCode,
      country: place.country,
      countryCode: place.isoCountryCode,
    );
  }

  String get fullAddress {
    return [
      area,
      city,
      district,
      state,
      postalCode,
      country
    ].where((e) => e != null && e!.isNotEmpty).join(", ");
  }
}