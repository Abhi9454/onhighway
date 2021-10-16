import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class RequestNewService {
  final HttpService httpService = HttpService();

  Future<Map<String, dynamic>> requestService(
      String userId,
      String userToken,
      String vehicleId,
      String serviceTypeId,
      String serviceAddress,
      String serviceText,
      String serviceLatLag) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
        'vehicleId': vehicleId,
        'serviceTypeId': serviceTypeId,
        'serviceAddress': serviceAddress,
        'serviceText': serviceText,
        'serviceLatLng': serviceLatLag
      });
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/user_create_service_request', 'POST',
          formData: formData);
          print("request status "+response.data.toString());
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
