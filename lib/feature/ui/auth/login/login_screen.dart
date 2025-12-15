import 'package:e_commerce/config/di.dart';
import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_route.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/utils/dialog_utils.dart';
import 'package:e_commerce/core/utils/validatour.dart';
import 'package:e_commerce/feature/ui/auth/auth_states.dart';
import 'package:e_commerce/feature/ui/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce/feature/widget/custome_elevated_button.dart';
import 'package:e_commerce/feature/widget/custome_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginViewModel loginViewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: loginViewModel,
      listener: (context, state) {
        if (state is AuthLoadingStates) {
          DialogUtils.showLoading(context: context, message: 'Loading....');
        } else if (state is AuthErrorStates) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(context: context, message: state.errorMessage,
              posName: 'ok');
        } else if (state is AuthSuccessStates) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
              context: context, message: 'login successfully', posName: 'ok');
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.customeBlue,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.loginLogo),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                child: Form(
                  key: loginViewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome Back To shopingo',
                        style: AppTextStyle.semibold24White,
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: AppTextStyle.light18hintColor,
                      ),
                      SizedBox(height: 40.h),
                      Text('email', style: AppTextStyle.media18White),
                      SizedBox(height: 24.h),
                      CustomeTextFormFeild(
                        hintText: 'enter your email',
                        validator: AppValidator.validateEmail,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Text('Password', style: AppTextStyle.media18White),
                      SizedBox(height: 24.h),
                      CustomeTextFormFeild(
                        hintText: 'enter your Password',
                        controller: passwordController,
                        obscureText: obscureText,
                        validator: AppValidator.validatePassword,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            obscureText = !obscureText;
                            setState(() {});
                          },
                          child: obscureText
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.remove_red_eye_rounded),
                        ),
                      ),
                      Text(
                        'Forget Password',
                        style: AppTextStyle.regular18White,
                        textAlign: TextAlign.end,
                      ),
                      SizedBox(height: 30.h),
                      CustomElevetedButton(
                        onPressed: () {
                          //todo navegatoir home screen
                          loginViewModel.login(emailController.text,
                              passwordController.text);
                        },
                        text: 'Login',
                        style: AppTextStyle.semibold20custom,
                        radiousBoarder: 15,
                      ),
                      SizedBox(height: 32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: AppTextStyle.media18White,
                          ),
                          TextButton(
                            onPressed: () {
                              //todo navegator to register screen
                              Navigator.pushNamed(
                                context,
                                AppRoute.registerRoute,
                              );
                            },
                            child: Text(
                              'Create Account',
                              style: AppTextStyle.media18White,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
