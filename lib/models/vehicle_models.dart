class VehicleModel {
  final String modelId;
  final String modelBrandId;
  final String modelName;

  VehicleModel(
      {required this.modelId,
      required this.modelBrandId,
      required this.modelName,});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      modelId: json['modelId'],
      modelBrandId: json['brandId'],
      modelName: json['modelName'],
    );
  }
}
