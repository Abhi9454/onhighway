import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class UpdatePaymentService {
  final HttpService httpService = HttpService();
  Dio dio = new Dio();

  Future<Map<String,dynamic>> updatePaymentSuccessful(
      String userId, String userToken, String paymentTxnId, String gatewayTxnId) async {
    try {
      final FormData formData = FormData.fromMap(<String, dynamic>{
        'apiToken': AppConfig().apiKey,
        'userToken': userToken,
        'userId': userId,
        'paymentTxnId': paymentTxnId,
        'gatewayTxnId': gatewayTxnId,
        'paymentStatus' : 'Success'
      });
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/user_update_payment', 'POST', formData: formData);
          print('Update Payment Details' + response.data.toString());
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
