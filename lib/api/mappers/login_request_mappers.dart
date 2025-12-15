import 'package:e_commerce/api/model/request/login_request_dto.dart';
import 'package:e_commerce/domin/entites/request/login_request.dart';

extension LoginRequestMappers on LoginRequest {
  LoginRequestDto toLoginDto() {
    return LoginRequestDto(email: email, password: password);
  }
}
