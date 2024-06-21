import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:herai/app/config/global.dart';
import 'package:herai/app/data/data_source/shared_pref_secure_storage.dart';
import 'package:herai/app/data/network/app_exceptions.dart';
import 'package:herai/app/utils/log.dart';

class HerAiApi {
  late Dio _dio;
  late SharedPrefSecureStorage _pref;

  HerAiApi() {
    _dio = Dio(
        BaseOptions(baseUrl: Global.BASE_URL, contentType: "application/json"));
    _dio.interceptors.add(DioLoggingInterceptor(
      level: Level.body,
      compact: false,
    ));
    _pref = SharedPrefSecureStorage.getInstance()!;
  }

  Future<dynamic> get(String url) async {
    Log.colorGreen("GET URL : ${url}");
    var responseJson;
    try {
      final token = await _pref.getToken();
      final response = await _dio.get(
        Uri.encodeFull(url),
        options: Options(
          headers: {'authorization': 'Bearer $token'},
        ),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        _returnResponse(e.response!);
      } else {
        print(e.message);
      }
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> getParams(String url, Map<String, dynamic> params) async {
    Log.colorGreen("GET URL : ${url}");
    var responseJson;
    try {
      final token = await _pref.getToken();
      final response = await _dio.get(
        Uri.encodeFull(url),
        queryParameters: params,
        options: Options(
          headers: {'authorization': 'Bearer $token'},
        ),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        _returnResponse(e.response!);
      } else {
        print(e.message);
      }
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> getActiveCart(String url) async {
    Log.colorGreen("GET URL : ${url}");
    var responseJson;
    try {
      final token = await _pref.getToken();
      final response = await _dio.get(
        Uri.encodeFull(url),
        options: Options(
          headers: {'authorization': 'Bearer $token'},
        ),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        _returnResponse(e.response!);
      } else {
        print(e.message);
      }
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var responseJson;
    try {
      Log.colorGreen("POST URL : ${url}");
      final token = await _pref.getToken();
      final response = await _dio.post(Uri.encodeFull(url),
          data: body,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        _returnResponse(e.response!);
      } else {
        Log.info(e.message);
      }
    }
    return responseJson;
  }

  Future<dynamic> sendForm(
      String url, Map<String, dynamic> data, Map<String, File> files) async {
    var responseJson;
    try {
      Log.colorGreen("POST URL : ${url}");
      final token = await _pref.getToken();

      Map<String, MultipartFile> fileMap = {};
      for (MapEntry fileEntry in files.entries) {
        File file = fileEntry.value;
        String fileName = basename(file.path);
        fileMap[fileEntry.key] =
            await MultipartFile.fromFile(file.path, filename: fileName);
      }
      data.addAll(fileMap);

      var formData = FormData.fromMap(data);
      Log.colorGreen("formData : ${formData.toString()}");

      final response = await _dio.post(
        "/api/carts/items",
        data: formData,
        options: Options(headers: {'authorization': 'Bearer $token'}),
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

  Future<dynamic> postEditProfile(Map<String, dynamic> data, File file) async {
    var responseJson;
    try {
      // Log.colorGreen("POST URL : ${url}");
      final token = await _pref.getToken();

      final multipartFile = await MultipartFile.fromFile(file.path,
          filename: basename(file.path));

      MapEntry<String, MultipartFile> fileMap =
          MapEntry("profile_picture", multipartFile);

      var formData = FormData.fromMap(data);
      formData.files.add(fileMap);
      final response = await _dio.post(
        Urls.getUser,
        data: formData,
        options: Options(
            headers: {'authorization': 'Bearer $token'}, method: "PATCH"),
      );
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

  Future<dynamic> postMultipart(
      String url, Map<String, dynamic> data, Map<String, File> files) async {
    var responseJson;

    try {
      var formData = FormData.fromMap(data);
      files.entries.forEach((e) async {
        final multipartFile = await MultipartFile.fromFile(e.value.path,
            filename: basename(e.value.path));
        formData.files.add(MapEntry(e.key, multipartFile));
      });
      final token = await _pref.getToken();
      final response = await _dio.post(
        url,
        data: formData,
        options: Options(headers: {'authorization': 'Bearer $token'}),
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

  Future<dynamic> sendFile(File file) async {
    var responseJson;
    try {
      String fileName = basename(file.path);

      var formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path, filename: fileName),
      });
      Log.colorGreen("formData : ${formData.toString()}");

      final response = await _dio.post(
        Urls.getUser,
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

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    try {
      Log.colorGreen("PUT URL : ${url}");
      final token = await _pref.getToken();
      final response = await _dio.put(Uri.encodeFull(url),
          data: body,
          options: Options(headers: {'authorization': 'Bearer $token'}));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        _returnResponse(e.response!);
      } else {
        print(e.message);
      }
    }
    return responseJson;
  }

  Future<dynamic> putParams(String url, dynamic body, Map<String, dynamic> params) async {
    var responseJson;
    try {
      Log.colorGreen("PUT URL : ${url}");
      final token = await _pref.getToken();
      final response = await _dio.put(Uri.encodeFull(url),
          data: body,
          queryParameters: params,
          options: Options(headers: {'authorization': 'Bearer $token'}));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        _returnResponse(e.response!);
      } else {
        print(e.message);
      }
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      Log.colorGreen("DELETE URL : ${url}");
      final token = await _pref.getToken();
      final response = await _dio.delete(Uri.encodeFull(url),
          options: Options(headers: {'authorization': 'Bearer $token'}));
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on DioError catch (e) {
      if (e.response != null) {
        _returnResponse(e.response!);
      } else {
        print(e.message);
      }
    }
    return apiResponse;
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
