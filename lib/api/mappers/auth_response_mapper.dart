import 'package:e_commerce/api/mappers/user_mapper.dart';
import 'package:e_commerce/api/model/response/auth_response_dto.dart';
import 'package:e_commerce/core/exception_error/app_error.dart';
import 'package:e_commerce/domin/entites/response/auth_response.dart';

extension AuthResponseMapper on AuthResponseDto {
  AuthResponse toAuthResponse() {
    if (token != null || token!.isEmpty || user != null) {
      return AuthResponse(token: token, message: message, user: user?.toUser());
    } else {
      throw ServerEXception(errorMessage: 'failed authentication');
    }
  }
}
