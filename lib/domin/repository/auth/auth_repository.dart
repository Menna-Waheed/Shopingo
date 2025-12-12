import 'package:e_commerce/domin/entites/request/login_request.dart';
import 'package:e_commerce/domin/entites/request/register_request.dart';
import 'package:e_commerce/domin/entites/response/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);
}
