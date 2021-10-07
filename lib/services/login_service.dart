import 'dart:convert';

import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../models/user_model.dart';
import '../helpers/http_service.dart';

class AuthenticateService {
  final HttpService httpService = HttpService();


  Future<UserModel> login(String email, String password) async {
    try {
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + AppConfig().userLogin, 'POST');
      return UserModel.fromJson(jsonDecode(response.data));
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