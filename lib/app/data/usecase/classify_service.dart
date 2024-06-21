import 'dart:io';
import 'dart:async';
import 'package:herai/app/data/network/app_exceptions.dart';
import 'package:path/path.dart';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:herai/app/config/global.dart';
import 'package:herai/app/utils/log.dart';

class ClassifyService {
  late Dio _dio;

  ClassifyService() {
    _dio = Dio(BaseOptions(
        baseUrl: Global.CLASSIFY_BASE_URL, contentType: "application/json"));
    _dio.interceptors.add(DioLoggingInterceptor(
      level: Level.body,
      compact: false,
    ));
  }

  Future<dynamic> sendFile(File file) async {
    var responseJson;
    try {
      String fileName = basename(file.path);

      var formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      Log.colorGreen("formData : ${formData.toString()}");

      final response = await _dio.post(
        Urls.classify,
        data: formData,
      );

      Log.colorGreen('data_response: ${response}');

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        Log.colorGreen('data : $e');
        _returnResponse(e.response!);
      } else {
        print(e.message);
      }
    }
    return responseJson;
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.toString();
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
