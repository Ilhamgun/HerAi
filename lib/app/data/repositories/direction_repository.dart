import 'dart:convert';
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:herai/app/config/global.dart';
import 'package:herai/app/data/entities/herai_point.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/data/network/response/base_list_response.dart';
import 'package:herai/app/resource/constants_gmaps.dart';
import 'package:herai/app/utils/distance.dart';

import '../../../models/response/direction.dart';

import 'package:http/http.dart' as http;

class DirectionRepository {
  late HerAiApi _api;

  DirectionRepository() {
    _api = HerAiApi();
  }

  Future<Direction?> getDirection({
    required LatLng origin,
    required LatLng destination,
  }) async {
    String _urlDirection =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$google_api_key';
    print(_urlDirection);
    final response = await http.get(Uri.parse(_urlDirection));

    if (response.statusCode == 200) {
      print(response.body);
      var result =
          Direction.fromMap(jsonDecode(response.body) as Map<String, dynamic>);

      return result;
    }

    return null;
  }

  Future<String> getDetailPlace(String placeId) async {
    final String _urlPlace =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$google_api_key';

    final response = await http.get(Uri.parse(_urlPlace));
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    print('json_response : $json');
    return '';
  }

  Future<List<HerAiPoint>> getHerAiPoints() async {
    var response = await _api.get(Urls.getviewAllPoints);
    List<HerAiPoint> output = baseListResponseFromMap<HerAiPoint>(
        response, (p0) => HerAiPoint.fromMap(p0)).data;
    return output;
  }

  Future<HerAiPoint> getNearestHerAiPoint(
      LatLng origin, List<HerAiPoint> allPoints) async {
    // var allPoints = await getHerAiPoints();

    var latLngList =
        allPoints.map((e) => LatLng(e.latitude, e.longitude)).toList();
    var distanceList = euclideanDistanceList(origin, latLngList);
    var shortest = distanceList.reduce(min);
    var shortestIndex = distanceList.indexOf(shortest);
    return allPoints[shortestIndex];
  }
}
