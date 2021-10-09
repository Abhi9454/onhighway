import 'package:dio/dio.dart';
import '../models/user_service.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class ServiceHistory {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<List<UserServiceModel>> serviceHistory(
      String userId, String userToken) async {
    try {
      final Map<String, dynamic> userVehicleList = {
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
      };
      final Response<dynamic> response = await dio.get(
          AppConfig().apiUrl + '/user_service_history',
          queryParameters: userVehicleList);
      return (response.data as List)
          .map((e) => UserServiceModel.fromJson(e))
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
