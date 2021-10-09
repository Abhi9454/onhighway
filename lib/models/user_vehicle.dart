class UserVehicleModel {
  final String userId;
  final String vehicleId;
  final String vehicleType;
  final String vehicleBrand;
  final String vehicleModel;
  final String vehicleRegNo;
  final String vehicleFuelType;
  final String vehicleListName;

  UserVehicleModel(
      {required this.userId,
      required this.vehicleId,
      required this.vehicleType,
      required this.vehicleBrand,
      required this.vehicleModel,
      required this.vehicleRegNo,
      required this.vehicleFuelType,
      required this.vehicleListName});

  factory UserVehicleModel.fromJson(Map<String, dynamic> json) {
    return UserVehicleModel(
        userId: json['userId'],
        vehicleId: json['vehicleId'],
        vehicleType: json['vehicleType'],
        vehicleBrand: json['vehicleBrand'],
        vehicleModel: json['vehicleModel'],
        vehicleRegNo: json['vehicleRegNo'],
        vehicleFuelType: json['vehicleFuelType'],
        vehicleListName: json['vehicleListName']);
  }
}
