import 'package:dio/dio.dart';
import '../models/running_service.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class RunningService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<List<UserRunningService>> runningService(
      String userId, String userToken) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
      });
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/user_service_pending', 'POST',
          formData: formData);
      return (response.data as List)
          .map((e) => UserRunningService.fromJson(e))
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

  Future<Map<String, dynamic>> deleteRunningService(
      String userId, String userToken, String serviceRequestId) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
        'serviceRequestId': serviceRequestId
      });
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/user_delete_service_request', 'POST',
          formData: formData);
      print(response.data.toString());
      return response.data as Map<String, dynamic>;
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
