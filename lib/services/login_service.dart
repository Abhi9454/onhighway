import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class AuthenticateService {
  final HttpService httpService = HttpService();


  Future<Map<String, dynamic>> login(String email, String password,String token) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken' : AppConfig().apiKey,
        'useremail' : email,
        'password' : password,
        'deviceToken' : token
      });
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/user_login', 'POST', formData: formData);
      return response.data as Map<String,dynamic>;
    } on DioError catch (error) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectTimeout) {
        throw ShowError('Server timeout ');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }
}