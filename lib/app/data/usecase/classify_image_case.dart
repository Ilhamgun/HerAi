import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:herai/app/data/entities/model_result_cloud.dart';
import 'package:herai/app/data/network/response/base_response.dart';
import 'package:herai/app/data/usecase/classify_service.dart';
import 'package:tflite/tflite.dart';
import 'package:image/image.dart';

class ClassifyImageCase {
  late ClassifyService _api;
  ClassifyImageCase() {
    _initTensorFlow().then((value) => {print("Model Loaded")});
    _api = ClassifyService();
  }

  Future<ModelResultCloud> postModel(File file) async {
    final response = await _api.sendFile(file);

    final data = baseResponseFromMap<ModelResultCloud>(
        response, (p0) => ModelResultCloud.fromMap(p0)).data;
    return data;
  }

  Future<String?> _initTensorFlow() async {
    String? res = await Tflite.loadModel(
        model: "assets/model/wsmodelGAPQuant2.tflite",
        labels: "assets/model/labels.txt",
        numThreads: 1,
        // defaults to 1
        isAsset: true,
        // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
    return res;
  }

  Uint8List _imageToByteListFloat32(
      Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Future<ModelResultCloud> runModel(String imagePath) async {
    var file = File(imagePath);
    Image image = decodeImage(await file.readAsBytes())!;
    var resized = copyResize(image, width: 224, height: 224);

    var recognitions = await Tflite.runModelOnBinary(
      binary: _imageToByteListFloat32(resized, 224, 0, 255),
      // path: imagePath,
      numResults: 5,
      threshold: 0.05,
    );
    var result = recognitions!.first;

    return ModelResultCloud(
        classEnum: result["label"],
        confidenceLevel: result["confidence"].toDouble());
  }
}
