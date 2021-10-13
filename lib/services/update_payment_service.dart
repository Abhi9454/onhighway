import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class UpdatePaymentService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<Map<String,dynamic>> updatePaymentSuccessful(
      String userId, String userToken, String paymentTxnId, String paymentStatus) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
        'paymentTxnId': paymentTxnId,
        'paymentStatus' : paymentStatus
      });
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/user_update_payment', 'POST', formData: formData);
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
