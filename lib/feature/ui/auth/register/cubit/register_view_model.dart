import 'package:dio/dio.dart';
import 'package:e_commerce/core/exception_error/app_error.dart';
import 'package:e_commerce/domin/entites/request/register_request.dart';
import 'package:e_commerce/domin/use_case/register_use_case.dart';
import 'package:e_commerce/feature/ui/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
    : super(AuthLoadingStates());

  //hold data , handle logic

  var formKey = GlobalKey<FormState>();

  void Register(
    String email,
    String password,
    String name,
    String rePassword,
    String phone,
  ) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(AuthLoadingStates());
        RegisterRequest registerRequest = RegisterRequest(
          password: password,
          email: email,
          rePassword: rePassword,
          phone: phone,
          name: name,
        );

        var authResponse = await registerUseCase.invoke(registerRequest);

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
