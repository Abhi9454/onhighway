import 'package:dio/dio.dart';
import '../models/user_vehicle.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class MyVehiclesListService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<List<UserVehicleModel>> myVehiclesList(
      int userId, String userToken) async {
    try {
      final Map<String, dynamic> userVehicleList = {
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
      };
      final Response<dynamic> response = await dio.get(
          AppConfig().apiUrl + '/user_vehicles',
          queryParameters: userVehicleList);
      print(response.data.toString());
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
}
