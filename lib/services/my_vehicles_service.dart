import 'package:dio/dio.dart';
import '../models/user_vehicle.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class MyVehiclesListService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<List<UserVehicleModel>> myVehiclesList(
      String userId, String userToken) async {
    try {
      final Map<String, dynamic> userVehicleList = {
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
      };
      final Response<dynamic> response = await dio.get(
          AppConfig().apiUrl + '/user_vehicles',
          queryParameters: userVehicleList);
      return (response.data as List)
          .map((e) => UserVehicleModel.fromJson(e))
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
          AppConfig().apiUrl + '/user_initiate_vehicle_payment','POST',
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
