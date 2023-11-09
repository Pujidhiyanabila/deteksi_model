import 'dart:convert';

import 'package:deteksi_model/Models/detect_model.dart';
import 'package:deteksi_model/Services/remote_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetectController extends GetxController {
  PickedFile? _pickedFile;
  PickedFile? get pickedFile=>_pickedFile;
  String? _imagePath;
  String? get imagePath=>_imagePath;
  final _picker = ImagePicker();
  // Implementasi image picker
  Future<void> pickImage() async {
    _pickedFile=
    await _picker.getImage(source: ImageSource.gallery);
    update();
  }
  Future<bool> upload() async {
    update();
    bool success=false;

    // var response = await getDetect( _pickedFile);
    var response = await RemoteServices.getDetect(_pickedFile);

    // if (response.statusCode == 200) {
      Map map = jsonDecode(await response.stream.bytesToString());
      String message = map['message'];
      success=true;
      print(message);
      _imagePath=message;
    } else {
      print('Error uploading image');
    }
    update();

    return success;
  }
  // Future<http.StreamedResponse> updateProfile(PickedFile? data) async {
  //   http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('http://mvs.bslmeiyu.com/api/v1/auth/upload'));
  //
  //   if(GetPlatform.isMobile && data != null) {
  //     File _file = File(data.path);
  //     request.files.add(http.MultipartFile('image', _file.readAsBytes().asStream(), _file.lengthSync(), filename:  _file.path.split('/').last));
  //   }
  //
  //   http.StreamedResponse response = await request.send();
  //   return response;
  // }
}