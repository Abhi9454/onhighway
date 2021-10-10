class ServiceRequest {
  final String userId;
  final String vehicle;
  final String serviceNeed;
  final String explainNeed;
  final String location;
  final String gpsLocation;
  final String date;
  final String amount;
  final String status;

  ServiceRequest(
      {required this.userId,
        required this.vehicle,
        required this.serviceNeed,
        required this.explainNeed,
        required this.location,
        required this.gpsLocation,
        required this.date,
        required this.amount,
        required this.status,
      });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) {
    return ServiceRequest(
        userId: json['userId'],
        vehicle: json['vehicle'],
        serviceNeed: json['serviceneed'],
        explainNeed: json['explainneed'],
        location: json['location'],
        gpsLocation: json['gps_location'],
        date: json['date'],
        amount: json['amount'],
        status: json['status'],
    );
  }
}
