class VehicleServiceModel {
  final String serviceId;
  final String serviceTypeName;

  VehicleServiceModel(
      {required this.serviceId,
        required this.serviceTypeName,});

  factory VehicleServiceModel.fromJson(Map<String, dynamic> json) {
    return VehicleServiceModel(
      serviceId: json['serviceTypeId'],
      serviceTypeName: json['serviceTypeName'],
    );
  }
}
