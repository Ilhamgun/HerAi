import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

Future<List<Map<String, dynamic>>> readJsonFile(String assetPath) async {
  var input = await rootBundle.loadString(assetPath);
  var map = jsonDecode(input);
  return map;
}

LatLng latLngFromLocationData(LocationData data) {
  return LatLng(data.latitude!, data.longitude!);
}
