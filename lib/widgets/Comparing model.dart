class CompareModel {
  String? shirt;
  String? paint;
  String? shoes;
  CompareModel({this.shirt, this.paint, this.shoes});
  factory CompareModel.fromjson(Map<String, dynamic> json) {
    return CompareModel(
        shirt: json["shirt"], paint: json["paint"], shoes: json["shoes"]);
  }
  Map<String, dynamic> tojson() => {
        "shirt": shirt,
          "paint":paint,
    "shoes":shoes,
      };
}
