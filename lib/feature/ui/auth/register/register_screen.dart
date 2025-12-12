import 'package:e_commerce/core/utils/app_assets.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_text_style.dart';
import 'package:e_commerce/core/utils/validatour.dart';
import 'package:e_commerce/feature/widget/custome_elevated_button.dart';
import 'package:e_commerce/feature/widget/custome_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obsecure = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.customeBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.loginLogo),
                Text('Full Name', style: AppTextStyle.media18White),
                SizedBox(height: 24.h),
                CustomeTextFormFeild(
                  hintText: 'enter your full name',
                  validator: AppValidator.validateName,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                Text('Mobile Number', style: AppTextStyle.media18White),
                SizedBox(height: 24.h),
                CustomeTextFormFeild(
                  hintText: 'enter your mobile no.',
                  keyboardType: TextInputType.phone,
                  controller: phoneNumberController,
                  validator: AppValidator.validatePhoneNumber,
                ),
                Text('E-mail address', style: AppTextStyle.media18White),
                SizedBox(height: 24.h),
                CustomeTextFormFeild(
                  hintText: 'enter your email address',
                  validator: AppValidator.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                Text('Password', style: AppTextStyle.media18White),
                SizedBox(height: 24.h),
                CustomeTextFormFeild(
                  hintText: 'enter your password',
                  obscureText: obsecure,
                  controller: passwordController,
                  validator: AppValidator.validatePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      obsecure = !obsecure;
                      setState(() {});
                    },
                    child: obsecure
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),

                CustomElevetedButton(
                  onPressed: () {
                    //todo navegator to login screen
                    if (formKey.currentState!.validate() == true) {}
                  },
                  text: 'Sign up',
                  style: AppTextStyle.semibold20custom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
