import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_service.dart';
import 'package:e_commerce/api/end_point.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModules {
  @singleton
  @injectable
  BaseOptions provideBaseOption() {
    return BaseOptions(
      baseUrl: EndPoint.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: Duration(seconds: 20),
      connectTimeout: Duration(seconds: 20),
    );
  }

  @singleton
  @injectable
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
  }

  @singleton
  @injectable
  Dio provideDio(BaseOptions baseOption, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOption);
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  @injectable
  ApiService provideApiService(Dio dio) => ApiService(dio);
}
