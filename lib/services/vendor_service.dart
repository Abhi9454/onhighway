import 'package:dio/dio.dart';
import 'package:onhighway/models/vendor_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class VendorListService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<List<VendorModel>> getVendorList(
      String userLat, String userLon, String vehicleType, String serviceType ) async {
    print(userLat + ',' + userLon);
    try {
      final Map<String, dynamic> userDetails = {
        'apiToken': AppConfig().apiKey,
        'userLat': userLat,
        'userLng': userLon,
        'vehicleType': vehicleType.isNotEmpty ? vehicleType : 'All',
        'serviceType' : serviceType.isNotEmpty ? serviceType : 'All'
      };
      final Response<dynamic> response = await dio.get(
          AppConfig().apiUrl + '/nearby_vendors',
          queryParameters: userDetails);
      print(response.data.toString());
      List<dynamic> data = response.data as List<dynamic>;
      if(data.isEmpty){
        return [];
      }
      else {
        return (response.data as List<dynamic>)
            .map((e) => VendorModel.fromJson(e))
            .toList();
      }
    } on DioError catch (error) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectTimeout) {
        throw ShowError('Server timeout ');
      } else if (error.type == DioErrorType.other) {
        throw ShowError('No Internet connection...');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }

  Future<Map<String,dynamic>> getTransactionId(
      String userId, String userToken, String vehicleId, String paymentType) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
        'vehicleId' : vehicleId,
        'paymentType' : paymentType,
      });
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/user_initiate_service_payment','POST',
          formData: formData);
      print('Initiate transaction : ' + response.data.toString());
      return response.data as Map<String,dynamic>;
    } on DioError catch (error) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectTimeout) {
        throw ShowError('Server timeout ');
      } else if (error.type == DioErrorType.other) {
        throw ShowError('No Internet connection...');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }
}
