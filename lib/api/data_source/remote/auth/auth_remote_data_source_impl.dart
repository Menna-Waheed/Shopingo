import 'package:e_commerce/api/api_service.dart';
import 'package:e_commerce/data/data_source/remote/auth_remote_data_source.dart';
import 'package:e_commerce/domin/entites/request/login_request.dart';
import 'package:e_commerce/domin/entites/request/register_request.dart';
import 'package:e_commerce/domin/entites/response/auth_response.dart';

class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  ApiService apiService;

  AuthRemoteDataSourceImplementation({required this.apiService});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
