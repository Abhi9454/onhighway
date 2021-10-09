class VehicleModel {
  final String modelId;
  final String vehicleType;
  final String modelBrandId;
  final String modelName;
  final String modelStatus;
  final String entryDate;

  VehicleModel(
      {required this.modelId,
      required this.vehicleType,
      required this.modelBrandId,
      required this.modelName,
      required this.modelStatus,
      required this.entryDate});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      modelId: json['model_id'],
      vehicleType: json['vehicle_type'],
      modelBrandId: json['model_brand_id'],
      modelName: json['model_name'],
      modelStatus: json['model_status'],
      entryDate: json['entry_date'],
    );
  }
}
