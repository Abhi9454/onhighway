class UserVehicleModel {
  final String userId;
  final String vehicleId;
  final String vehicleType;
  final String vehicleBrand;
  final String vehicleModel;
  final String vehicleRegNo;
  final String vehicleFuelType;
  final String vehicleListName;
  final String vehicleStatus;
  final String vehicleRenewalDate;
  final String paymentType;
  final int paymentAmount;

  UserVehicleModel({
    required this.userId,
    required this.vehicleId,
    required this.vehicleType,
    required this.vehicleBrand,
    required this.vehicleModel,
    required this.vehicleRegNo,
    required this.vehicleFuelType,
    required this.vehicleListName,
    required this.vehicleStatus,
    required this.vehicleRenewalDate,
    required this.paymentType,
    required this.paymentAmount
  });

  factory UserVehicleModel.fromJson(Map<String, dynamic> json) {
    return UserVehicleModel(
        userId: json['userId'],
        vehicleId: json['vehicleId'],
        vehicleType: json['vehicleType'],
        vehicleBrand: json['vehicleBrand'],
        vehicleModel: json['vehicleModel'],
        vehicleRegNo: json['vehicleRegNo'],
        vehicleFuelType: json['vehicleFuelType'],
        vehicleListName: json['vehicleListName'],
        vehicleStatus: json['vehicleStatus'],
        vehicleRenewalDate: json['vehicleRenewalDate'],
        paymentType: json['paymentType'],
        paymentAmount : json['paymentAmount']
        );
  }
}
