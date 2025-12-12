import 'package:e_commerce/domin/entites/response/user.dart';

class AuthResponse {
  final String? message;

  final User? user;

  final String? token;

  AuthResponse({this.message, this.user, this.token});
}
