import 'package:dio/dio.dart';
import 'package:e_commerce/core/exception_error/app_error.dart';
import 'package:e_commerce/domin/entites/request/login_request.dart';
import 'package:e_commerce/domin/use_case/login_use_case.dart';
import 'package:e_commerce/feature/ui/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(AuthLoadingStates());

  //hold data , handle logic

  var formKey = GlobalKey<FormState>();

  void login(String email, String password) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(AuthLoadingStates());
        LoginRequest loginRequest = LoginRequest(
          email: email,
          password: password,
        );
        var authResponse = await loginUseCase.invoke(loginRequest);

        emit(AuthSuccessStates(authResponse: authResponse));
      }
    } on AppException catch (e) {
      emit(AuthErrorStates(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppException)
          ? (e.error as AppException).errorMessage
          : 'un expected error';
      emit(AuthErrorStates(errorMessage: message));
    }
  }
}
