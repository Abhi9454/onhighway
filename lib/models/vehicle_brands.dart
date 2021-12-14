class VehicleBrand{
  final String brandId;
  final String brandName;

  VehicleBrand({required this.brandId,required this.brandName});

  factory VehicleBrand.fromJson(Map<String, dynamic> json) {
    return VehicleBrand(
      brandId: json['brandId'] ,
      brandName: json['brandName'],
    );
  }

}