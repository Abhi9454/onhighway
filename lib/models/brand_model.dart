class BrandModel{
  final String brandId;
  final String brandName;

  BrandModel({required this.brandId, required this.brandName});

  factory BrandModel.fromJson(Map<int, dynamic> json) {
    return BrandModel(
        brandId: json['brandId'] ,
        brandName: json['brandName']
    );
  }

}