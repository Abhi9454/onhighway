import 'package:dio/dio.dart';
import 'package:onhighway/models/vehicle_service_model.dart';
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
      print("UserId : $userId and userToken is : $userToken");
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
          error.type == DioErrorType.connectionTimeout) {
        throw ShowError('Server timeout ');
      } else if (error.type == DioErrorType.unknown) {
        throw ShowError('No Internet connection...');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }



  Future<List<VehicleServiceModel>> vehicleServiceList(
      String userId, String userToken, String vehicleId) async {
    try {
      print("UserId : $userId and userToken is : $userToken");
      final Map<String, dynamic> userVehicleList = {
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
        'vehicleId': vehicleId
      };
      final Response<dynamic> response = await dio.get(
          AppConfig().apiUrl + '/service_type_list',
          queryParameters: userVehicleList);
      return (response.data as List)
          .map((e) => VehicleServiceModel.fromJson(e))
          .toList();
    } on DioError catch (error) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectionTimeout) {
        throw ShowError('Server timeout ');
      } else if (error.type == DioErrorType.unknown) {
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
          error.type == DioErrorType.connectionTimeout) {
        throw ShowError('Server timeout ');
      } else if (error.type == DioErrorType.unknown) {
        throw ShowError('No Internet connection...');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }
}
