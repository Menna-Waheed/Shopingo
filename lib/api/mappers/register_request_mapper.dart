import 'package:e_commerce/api/model/request/register_request_dto.dart';
import 'package:e_commerce/domin/entites/request/register_request.dart';

extension RegisterRequestMapper on RegisterRequest {
  RegisterRequestDto toRegisterRequest() {
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
  }
}
