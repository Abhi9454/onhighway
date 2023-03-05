import 'dart:convert';

VendorModel vendorModelFromJson(String str) => VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
  VendorModel({
    required this.vehicletype,
    required this.serviceid,
    required this.servicetype,
    required this.id,
    required this.userId,
    required this.fullname,
    required this.phoneno,
    required this.emailid,
    required this.businessaddress,
    required this.latitude,
    required this.longitude,
    required this.distanceKm,
  });

  final String vehicletype;
  final String serviceid;
  final String servicetype;
  final String id;
  final String userId;
  final String fullname;
  final String phoneno;
  final String emailid;
  final String businessaddress;
  final String latitude;
  final String longitude;
  final String distanceKm;

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
    vehicletype: json["vehicletype"],
    serviceid: json["serviceid"],
    servicetype: json["servicetype"],
    id: json["id"],
    userId: json["user_id"],
    fullname: json["fullname"],
    phoneno: json["phoneno"],
    emailid: json["emailid"],
    businessaddress: json["businessaddress"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    distanceKm: json["distance_km"],
  );

  Map<String, dynamic> toJson() => {
    "vehicletype": vehicletype,
    "serviceid": serviceid,
    "servicetype": servicetype,
    "id": id,
    "user_id": userId,
    "fullname": fullname,
    "phoneno": phoneno,
    "emailid": emailid,
    "businessaddress": businessaddress,
    "latitude": latitude,
    "longitude": longitude,
    "distance_km": distanceKm,
  };
}
