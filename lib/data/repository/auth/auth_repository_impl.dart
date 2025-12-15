import 'package:e_commerce/data/data_source/remote/auth_remote_data_source.dart';
import 'package:e_commerce/domin/entites/request/login_request.dart';
import 'package:e_commerce/domin/entites/request/register_request.dart';
import 'package:e_commerce/domin/entites/response/auth_response.dart';
import 'package:e_commerce/domin/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImplementation implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImplementation({required this.authRemoteDataSource});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    return authRemoteDataSource.register(registerRequest);
  }
}
