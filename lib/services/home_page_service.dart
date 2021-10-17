import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class HomePageService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<Map<String, dynamic>> pendingPayment(
      String userId, String userToken) async {
    try {
      final Map<String, dynamic> userDetails = {
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
      };
      final Response<dynamic> response = await dio.get(
          AppConfig().apiUrl + '/user_pending_payments',
          queryParameters: userDetails);
          print(response.data.toString());
      return response.data as Map<String, dynamic>;
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
