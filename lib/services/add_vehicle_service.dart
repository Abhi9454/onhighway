import 'dart:convert';

import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class AddVehicleService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();


  Future<Map<String, dynamic>> addVehicle(String userId, String userToken, String vehicleType, int vehicleBrand, int vehicleModel, String vehicleFuelType, String vehicleNumber) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken' : AppConfig().apiKey,
        'userToken' : userToken,
        'userId' : userId,
        'vehicleType' : vehicleType,
        'vehicleBrand' : vehicleBrand,
        'vehicleModel' : vehicleModel,
        'vehicleFuelType' : vehicleFuelType,
        'vehicleNumber' : vehicleNumber
      });
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/user_add_vehicle', 'POST', formData: formData);
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


  Future<List<dynamic>> getVehicleBrand(String vehicleType) async {
    try {
      final Map<String, dynamic> userVehicleList = {
        'apiToken' : AppConfig().apiKey,
        'vehicleType' : vehicleType,
      };
      final Response<dynamic> response = await dio.get(
          AppConfig().apiUrl + '/vehicle_brand_list',
          queryParameters: userVehicleList);
      return (response.data as List);
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


  Future<List<dynamic>> getVehicleModels(String vehicleType, int vehicleBrandId) async {
    try {
      final Map<String, dynamic> userVehicleList = {
        'apiToken' : AppConfig().apiKey,
        'vehicleType' : vehicleType,
        'vehicleBrand' : vehicleBrandId
      };
      final Response<dynamic> response = await dio.get(
          AppConfig().apiUrl + '/vehicle_model_list',
          queryParameters: userVehicleList);
      print(response.data.toString() + "model list");
      return (response.data as List);
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