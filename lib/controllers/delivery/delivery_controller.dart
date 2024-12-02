import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer();
  var currentPosition = Rxn<Position>();
  var selectedLocation = Rxn<LatLng>();
  var markers = <Marker>{}.obs;
  var locationAddress = ''.obs;

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(-6.2088, 106.8456), // Default location (Jakarta)
    zoom: 14.0,
  );

  // Constants
  static const String defaultLocationError = 'Location services are disabled.';
  static const String deniedPermissionError = 'Location permissions are denied.';
  static const String deniedForeverPermissionError = 'Location permissions are permanently denied.';
  static const String pleaseSelectLocation = 'Please select a location on the map';
  static const String failedToRetrieveAddress = 'Failed to retrieve address';

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check location services
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', defaultLocationError);
      return;
    }

    // Check permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', deniedPermissionError);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', deniedForeverPermissionError);
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition.value = position;

    // Add marker at current location
    markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: const InfoWindow(title: 'You are here'),
      ),
    );

    goToCurrentLocation();
  }

  Future<void> goToCurrentLocation() async {
    final controller = await mapController.future;
    if (currentPosition.value != null) {
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(currentPosition.value!.latitude, currentPosition.value!.longitude),
        zoom: 14.0,
      );
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  Future<String?> getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return '${place.locality}, ${place.country}';
      }
    } catch (e) {
      Get.snackbar('Error', failedToRetrieveAddress);
    }
    return null;
  }

  void onMapTapped(LatLng location) async {
    String? address = await getAddressFromLatLng(location);
    selectedLocation.value = location;

    markers.add(
      Marker(
        markerId: const MarkerId('selectedLocation'),
        position: location,
        infoWindow: const InfoWindow(title: 'Selected Location'),
      ),
    );

    if (address != null) {
      locationAddress.value = address;
    }
  }

  void confirmLocation(BuildContext context) {
    if (selectedLocation.value != null) {
      Get.back(result: {
        "address": locationAddress.value,
        "latitude": selectedLocation.value!.latitude.toString(),
        "longitude": selectedLocation.value!.longitude.toString(),
      });
    } else {
      Get.snackbar('Error', pleaseSelectLocation);
    }
  }
}
