import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class RegisterService {
  final HttpService httpService = HttpService();


  Future<Map<String, dynamic>> register(String name, String email, String mobileNumber, String userPassword, String deviceToken) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken' : AppConfig().apiKey,
        'userName' : name,
        'userEmail' : email,
        'userMobile' : int.parse(mobileNumber),
        'userPassword' : userPassword,
        'deviceToken' : deviceToken
      });
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/user_register', 'POST', formData: formData);
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