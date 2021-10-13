import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class ForgetPasswordService {
  final HttpService httpService = HttpService();


  Future<Map<String, dynamic>> sendRequest(String email) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken' : AppConfig().apiKey,
        'userEmail' : email,
      });
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/user_reset_password', 'POST', formData: formData);
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