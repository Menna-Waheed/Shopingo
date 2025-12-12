import 'package:e_commerce/domin/entites/request/register_request.dart';
import 'package:e_commerce/domin/entites/response/auth_response.dart';
import 'package:e_commerce/domin/repository/auth/auth_repository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<AuthResponse> invoke(RegisterRequest registerRequest) {
    return authRepository.register(registerRequest);
  }
}
