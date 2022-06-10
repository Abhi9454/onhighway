class VehicleLoad {
  final String id;
  final String requestId;
  final String weight;
  final String dimension;
  final String detail;
  final String pickUpAddress;
  final String pickUpState;
  final String pickUpCity;
  final String pickUpPinCode;
  final String dropAddress;
  final String dropState;
  final String dropCity;
  final String dropPinCode;
  final String date;
  final String status;

  VehicleLoad(
      {required this.id,
        required this.requestId,
        required this.weight,
        required this.dimension,
        required this.detail,
        required this.pickUpAddress,
        required this.pickUpState,
        required this.pickUpCity,
        required this.pickUpPinCode,
        required this.dropAddress,
        required this.dropState,
        required this.dropCity,
        required this.dropPinCode,
        required this.date,
        required this.status,
      });

  factory VehicleLoad.fromJson(Map<String, dynamic> json) {
    return VehicleLoad(
      id: json['loadId'],
      requestId: json['loadReqId'],
      weight: json['loadWeight'],
      dimension: json['loadDimension'],
      detail : json['loadDetails'],
      pickUpAddress: json['pickupAddress'],
      pickUpState: json['pickupState'],
      pickUpCity: json['pickupCity'],
      pickUpPinCode: json['pickupPincode'],
      dropAddress : json['dropAddress'],
      dropState: json['dropState'],
      dropCity : json['dropCity'],
      dropPinCode: json['dropPincode'],
      date: json['loadReqDate'],
      status: json['loadStatus'],
    );
  }
}
