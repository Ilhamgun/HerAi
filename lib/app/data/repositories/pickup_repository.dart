import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:herai/app/config/global.dart';
import 'package:herai/app/data/entities/herai_point.dart';
import 'package:herai/app/data/entities/model_sampah.dart';
import 'package:herai/app/data/entities/pickup_request.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/data/network/response/base_list_response.dart';
import 'package:herai/app/data/network/response/base_response.dart';

class PickupRepository {


  late HerAiApi _api;

  PickupRepository() {
    _api = HerAiApi();
  }

  /**
   * Ini untuk get Chip yang diatas (list kategori)
   */
  Future<List<TrashCategory>> getCategories() async {
    final response = await _api.get(Urls.trashCategories);
    return baseListResponseFromMap<TrashCategory>(response, (p0) => TrashCategory.fromMap(p0)).data;
  }

  /**
   * Ini untuk get List sampah berdasarkan point diatas
   */
  Future<TrashResult?> searchTrash(int pointId, TrashCategory category) async {
    Map<String, dynamic> params = {
      "point_id" : pointId,
      "query" : category.name
    };
    final response = await _api.getParams(Urls.trashSearch, params);
    var listResult = baseListResponseFromMap<TrashResult>(response, (p0) => TrashResult.fromMap(p0)).data;
    return listResult.length > 0 ? listResult.first : null;
  }

  /**
   * Ini untuk get Dropdown list point
   */
  Future<List<HerAiPoint>> getPoints() async {
    var response = await _api.get(Urls.getviewAllPoints);
    List<HerAiPoint> output = baseListResponseFromMap<HerAiPoint>(response, (p0) => HerAiPoint.fromMap(p0)).data;
    return output;
  }

  Future<BaseResponse<dynamic>> pickupTrash(LatLng origin, int pointId, String address, List<int> itemIds, {String? locationName, String? note}) async {
    var coordinates = '${origin.latitude},${origin.longitude}';
    var request = PickupRequest(
        pointId: pointId.toString(),
        locationName: locationName ?? "-",
        note: note ?? "-",
        address: address,
        coordinate: coordinates,
        items: itemIds);
    var response = await _api.post(Urls.postNewPickUpRequest, request.toMap());
    var success = baseResponseFromMap(response, (p0) => p0.toString());
    return success;
  }
  
  
}