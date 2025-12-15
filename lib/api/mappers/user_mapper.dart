import 'package:e_commerce/api/model/response/user_dto.dart';
import 'package:e_commerce/domin/entites/response/user.dart';

extension UserMapper on UserDto {
  User toUser() {
    return User(email: email, role: role, name: name);
  }
}
