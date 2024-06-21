
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

double euclideanDistance(LatLng a, LatLng b){
  var lat = pow(a.latitude-b.latitude, 2).toDouble();
  var lng = pow(a.longitude-b.longitude, 2).toDouble();
  return lat+lng;
}

List<double> euclideanDistanceList(LatLng a, List<LatLng> b){
  return b.map((e) => euclideanDistance(a, e)).toList();
}