import 'package:dio/dio.dart';
import 'package:e_commerce/api/end_point.dart';
import 'package:e_commerce/api/model/request/login_request_dto.dart';
import 'package:e_commerce/api/model/request/register_request_dto.dart';
import 'package:e_commerce/api/model/response/auth_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: EndPoint.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST(EndPoint.loginApi)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequset);

  @POST(EndPoint.registerApi)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);
}
