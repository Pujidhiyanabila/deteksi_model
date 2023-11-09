import 'dart:convert';

DetectModel detectModelFromJson(String str) => DetectModel.fromJson(json.decode(str));

String detectModelToJson(DetectModel data) => json.encode(data.toJson());

class DetectModel {
  List<Prediction> predictions;
  Image image;

  DetectModel({
    required this.predictions,
    required this.image,
  });

  factory DetectModel.fromJson(Map<String, dynamic> json) => DetectModel(
    predictions: List<Prediction>.from(json["predictions"].map((x) => Prediction.fromJson(x))),
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "predictions": List<dynamic>.from(predictions.map((x) => x.toJson())),
    "image": image.toJson(),
  };
}

class Image {
  int width;
  int height;

  Image({
    required this.width,
    required this.height,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
  };
}

class Prediction {
  double x;
  int y;
  int width;
  int height;
  String predictionClass;
  double confidence;

  Prediction({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.predictionClass,
    required this.confidence,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
    x: json["x"]?.toDouble(),
    y: json["y"],
    width: json["width"],
    height: json["height"],
    predictionClass: json["class"],
    confidence: json["confidence"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
    "width": width,
    "height": height,
    "class": predictionClass,
    "confidence": confidence,
  };
}