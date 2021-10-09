class VehicleBrand{
  final String brandId;
  final String vehicleType;
  final String brandName;
  final String brandStatus;
  final String entryDate;

  VehicleBrand({required this.brandId, required this.vehicleType,required this.brandName, required this.brandStatus , required this.entryDate});

  factory VehicleBrand.fromJson(Map<String, dynamic> json) {
    return VehicleBrand(
      brandId: json['brand_id'] ,
      vehicleType: json['vehicle_type'] ,
      brandName: json['brand_name'],
      brandStatus: json['brand_status'] ,
      entryDate: json['entry_date'] ,
    );
  }

}