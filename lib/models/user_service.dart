class UserServiceModel {
  final String userId;
  final String serviceReqId;
  final String vehicleListName;
  final String vehicleId;
  final String vehicleModel;
  final String vehicleRegNo;
  final String vehicleFuelType;
  final String serviceTypeName;
  final String serviceTypeId;
  final String serviceAddress;
  final String serviceText;
  final String serviceLatLng;
  final String serviceStatus;
  final String serviceDate;
  final String serviceAmount;

  UserServiceModel(
      {required this.userId,
        required this.serviceReqId,
        required this.vehicleListName,
        required this.vehicleId,
        required this.vehicleModel,
        required this.vehicleRegNo,
        required this.vehicleFuelType,
        required this.serviceTypeName,
        required this.serviceTypeId,
        required this.serviceAddress,
        required this.serviceText,
        required this.serviceLatLng,
        required this.serviceStatus,
        required this.serviceDate,
        required this.serviceAmount
      });

  factory UserServiceModel.fromJson(Map<String, dynamic> json) {
    return UserServiceModel(
        userId: json['userId'],
        serviceReqId: json['serviceReqId'],
        vehicleListName: json['vehicleListName'],
        vehicleId: json['vehicleId'],
        vehicleModel: json['vehicleModel'],
        vehicleRegNo: json['vehicleRegNo'],
        vehicleFuelType: json['vehicleFuelType'],
        serviceTypeName: json['serviceTypeName'],
        serviceTypeId: json['serviceTypeId'],
        serviceAddress : json['serviceAddress'],
        serviceText:  json['serviceText'],
        serviceLatLng: json['serviceLatLng'],
        serviceStatus: json['serviceStatus'],
        serviceDate: json['serviceDate'],
        serviceAmount: json['serviceAmount']
    );
  }
}
