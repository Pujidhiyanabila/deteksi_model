import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:deteksi_model/Models/detect_model.dart';

class RemoteServices {
  static const String baseUrl = 'https://detect.roboflow.com/acne-detection-q9g59/7';

  Future<DetectModel> getDetect(File image) async {
    final bytes = File(image!.path).readAsBytesSync();
    String base64Image =  "data:image/png;base64," + base64Encode(bytes);

    final response =
    await http.post(
        Uri.parse('$baseUrl?mX5xleb9s6jZNiD1xl7X'),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: base64Image
    );

    if (response.statusCode == 200) {
      return DetectModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}