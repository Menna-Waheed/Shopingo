
import 'package:e_commerce/api/api_service.dart';
import 'package:e_commerce/api/mappers/auth_response_mapper.dart';
import 'package:e_commerce/api/mappers/login_request_mappers.dart';
import 'package:e_commerce/api/mappers/register_request_mapper.dart';
import 'package:e_commerce/data/data_source/remote/auth_remote_data_source.dart';
import 'package:e_commerce/domin/entites/request/login_request.dart';
import 'package:e_commerce/domin/entites/request/register_request.dart';
import 'package:e_commerce/domin/entites/response/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImplementation implements AuthRemoteDataSource {
  ApiService apiService;

  AuthRemoteDataSourceImplementation({required this.apiService});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    var authResponse = await apiService.login(loginRequest.toLoginDto());
    return authResponse.toAuthResponse();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    var authResponse = await apiService.register(
        registerRequest.toRegisterRequest());
    return authResponse.toAuthResponse();
  }
}
