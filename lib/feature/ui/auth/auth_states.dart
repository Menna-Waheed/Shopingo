import 'package:e_commerce/domin/entites/response/auth_response.dart';

// abstract sealad
abstract class AuthStates {}

class AuthLoadingStates extends AuthStates {}

class AuthErrorStates extends AuthStates {
  String errorMessage;

  AuthErrorStates({required this.errorMessage});
}

class AuthSuccessStates extends AuthStates {
  AuthResponse authResponse;

  AuthSuccessStates({required this.authResponse});
}
