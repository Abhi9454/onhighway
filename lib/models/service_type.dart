class ServiceType {
  final String id;
  final String serviceType;
  final String name;
  final String status;

  ServiceType(
      {required this.id,
      required this.serviceType,
      required this.name,
      required this.status});

  factory ServiceType.fromJson(Map<String, dynamic> json) {
    return ServiceType(
      id: json['id'],
      serviceType: json['servicetype'],
      name: json['name'],
      status: json['status'],
    );
  }
}
