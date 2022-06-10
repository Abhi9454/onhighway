import 'package:dio/dio.dart';
import '../models/vehicle_load.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class VehicleLoadService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<List<VehicleLoad>> vehicleLoad(
      String userId, String userToken) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
      });
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/available_load_list', 'POST',
          formData: formData);
      return (response.data as List)
          .map((e) => VehicleLoad.fromJson(e))
          .toList();
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

  Future<Map<String,dynamic>> acceptVehicleLoad(
      String userId, String userToken, String loadId  ) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
        'loadId' : loadId
      });
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/accept_load', 'POST',
          formData: formData);
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

  Future<List<VehicleLoad>> myVehicleLoad(
      String userId, String userToken) async {
    print('usertoken : ' + userToken + ': userId' + userId);
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
      });
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/accepted_load_list', 'POST',
          formData: formData);
      return (response.data as List)
          .map((e) => VehicleLoad.fromJson(e))
          .toList();
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
