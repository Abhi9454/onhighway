import 'package:dio/dio.dart';
import 'package:onhighway/models/brand_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class AddVehicleService {
  final HttpService httpService = HttpService();


  Future<Map<String, dynamic>> addVehicle(int userId, String userToken, String vehicleType, int vehicleBrand, int vehicleModel, String vehicleFuelType, String vehicleNumber) async {
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
          error.type == DioErrorType.connectTimeout) {
        throw ShowError('Server timeout ');
      } else if (error.type == DioErrorType.other) {
        throw ShowError('No Internet connection...');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }


  Future<List<BrandModel>> getVehicleBrandId(String vehicleType) async {
    try {
      final Map<String,dynamic> vehicleTypeMap = {
        'apiToken' : AppConfig().apiKey,
        'vehicleType' : vehicleType
      };
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/vehicle_brand_list', 'GET', data: vehicleTypeMap);
      Iterable list = response.data;
      return list.map((vehicleBrand) => BrandModel.fromJson(vehicleBrand)).toList();
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