import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_route.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/utils/validatour.dart';
import 'package:e_commerce/feature/widget/custome_elevated_button.dart';
import 'package:e_commerce/feature/widget/custome_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.customeBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.loginLogo),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
              child: Form(
                key: formKey,
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
                        if (formKey.currentState!.validate() == true) {}
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
    );
  }
}
