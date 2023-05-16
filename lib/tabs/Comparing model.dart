import 'package:flutter/widgets.dart';

class CompareModel {
  String? shirt;
  String? paint;
  String? shoes;
  ImageProvider<Object>? shirtI;
  ImageProvider<Object>? paintI;
  ImageProvider<Object>? shoesI;
  DateTime? date;
  CompareModel({this.shirt, this.paint, this.shoes, this.shirtI, this.paintI, this.shoesI, this.date});
  factory CompareModel.fromjson(Map<String, dynamic> json) {
    return CompareModel(
        shirt: json["t"], paint: json["paint"], shoes: json["shoes"]);
  }
  Map<String, dynamic> tojson() => {
        "shirt": shirt,
          "paint":paint,
    "shoes":shoes,
      };
}
