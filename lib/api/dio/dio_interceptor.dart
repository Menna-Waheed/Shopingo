import 'package:dio/dio.dart';
import 'package:e_commerce/core/exception_error/app_error.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = 'Some thing want wrong,try again';
    AppException exception;
    final responseData = err.response?.data;

    if (responseData is Map) {
      message =
          (responseData['errors']?['msg'] as String?) ??
          (responseData['message'] as String) ??
          message;
    }

    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout) {
      exception = NetworkEXception(errorMessage: 'no internet exception');
    } else if (err.response?.statusCode != null) {
      exception = ServerEXception(
        errorMessage: message,
        statesCode: err.response?.statusCode,
      );
    } else {
      exception = UnExpectedError(errorMessage: message);
    }

    handler.reject(
      DioException(requestOptions: err.requestOptions, error: exception),
    );
  }
}
