import 'package:herai/app/config/global.dart';
import 'package:herai/app/data/entities/model_sampah.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/data/network/response/base_list_response.dart';

import 'dart:async';

class TrashRepository {
  late HerAiApi _api;

  TrashRepository() {
    _api = HerAiApi();
  }

  Future<List<TrashResult>> getTrash(int id) async {
    final response = await _api.get(Urls.getTrash + '&point_id=$id');

    final List<TrashResult> data =
        baseListResponseFromMap<TrashResult>(response, (p0) {
      return TrashResult.fromMap(p0);
    }).data;

    return data;
  }
}
