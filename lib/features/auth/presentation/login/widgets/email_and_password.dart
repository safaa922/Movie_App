import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/custom_button.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/custom_text_field.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/forgot_password.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/google_button.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/validator.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController =TextEditingController() ;
  GlobalKey<FormState> LoginFormKey = GlobalKey();


  @override
  void initState() {
    super.initState();
    emailController=context.read<AuthCubit>().LoginEmailController;
    passwordController=context.read<AuthCubit>().LoginPasswordController;
    LoginFormKey=context.read<AuthCubit>().LoginFormKey;
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 380,left: 40,right: 40,bottom: 20),
      child: Column(
        children: [
          Form(
            key: LoginFormKey,
            child: Column(
            children: [
              CustomTextField(
                icon: Icon(Icons.email,color: Colors.white,size: 20,
                  shadows: [
                  Shadow(color: Color(0xFFFF8945),offset: Offset(0, 0),blurRadius: 20)
                ],),
                hint: 'Email',
                controller: emailController,
                validator:(val){
                  return Validator.validateEmail(val);
                }, shadowColor: Color(0xFFFF8945),
              ),

              const SizedBox(height: 15),

              CustomTextField(
                hint: 'Password',
                controller: passwordController,
                isPassword: true,
                validator:  (val){
                  return Validator.validatePassword(val);
                }, icon: Icon(Icons.lock,color: Colors.white,size: 20,
                shadows: [
                Shadow(color: Color(0xFFFF8945),offset: Offset(0, 0),blurRadius: 20)
              ],), shadowColor: Color(0xFFFF8945),
              ),

              const SizedBox(height: 10),
              Padding(padding: EdgeInsets.only(left: 180),
                child: ForgotPassword(email: emailController.text),),
              const SizedBox(height: 15),
              CustomButton(
                height: 70.h,
                width: 260.w,
                FontWeight: FontWeight.bold,
                fontSize: 30.0,
                text: 'Login',
                onPressed: () {
                  context.read<AuthCubit>().Login(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
              ),

              const SizedBox(height: 20),

              GoogleButton(
                onPressed: () {
                  context.read<AuthCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 17),
              InkWell(
                  onTap:(){
                    context.pushNamed("/Signup");
                  },
                  child: Text("Don't have an account?", style: const TextStyle(
                      color: Color(0xFF9EA8FD),
                      fontSize: 15,
                      shadows: [
                        Shadow(color: Color(0xFF838FFF),offset: Offset(0, 0),blurRadius: 20)
                      ]
                  ),)
              )
            ],
          ))
        ],
      ),
    );
  }
}
