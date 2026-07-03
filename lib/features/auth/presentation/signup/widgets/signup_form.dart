import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/custom_text_field.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/google_button.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/app_regex.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/auth_bloc_consumer.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/validator.dart';
import 'package:movie_app/features/auth/presentation/signup/widgets/custom_button.dart';
import 'package:movie_app/features/auth/presentation/signup/widgets/custom_signup_textfield.dart';
import 'package:movie_app/features/auth/presentation/signup/widgets/image_blocbuilder.dart';
import 'package:movie_app/features/auth/presentation/signup/widgets/image_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  @override
  void initState(){
    super.initState();
    nameController = context.read<AuthCubit>().nameController;
    emailController=context.read<AuthCubit>().emailController;
    passwordController=context.read<AuthCubit>().passwordController;
    confirmPasswordController= context.read<AuthCubit>().confirmPasswordController;
    formKey=context.read<AuthCubit>().formKey;
    // file = context.read()
  }
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController() ;
  TextEditingController passwordController =TextEditingController() ;
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/signup_bg.jpg"),fit: BoxFit.fill)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 238,),
                    Text("Join Us",style: GoogleFonts.iceland(
                      fontSize: 38,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                const SizedBox(height: 30),
                CustomSignupTextField(
                  FontWeight: FontWeight.w400,
                  hint: "Name",
                  controller: nameController,
                  validator: (val) {
                    return Validator.validateName(nameController.text);
                  },
                  Icon: const Icon(
                    size: 22,
                    Icons.person,
                    color: Color(0xFFCAC6FF),
                    shadows: [
                      Shadow(color: Color(0xFF8C82FF),blurRadius: 15)
                    ],
                  ),
                  shadowColor: const Color(0xFF8C82FF),
                ),

                const SizedBox(height: 16),

                CustomSignupTextField(
                  hint: "Email",
                  FontWeight: FontWeight.w400,
                  controller: emailController,
                  validator: (val) {
                    return Validator.validateEmail(emailController.text);
                  },
                  Icon: const Icon(
                    size: 20,
                    Icons.email,
                    color: Color(0xFFCAC6FF),
                    shadows: [
                      Shadow(color: Color(0xFF8C82FF),blurRadius: 15)
                    ],
                  ),
                  shadowColor: const Color(0xFF8C82FF),
                ),

                const SizedBox(height: 16),

                CustomSignupTextField(
                  hint: "Password",
                  FontWeight: FontWeight.w400,
                  controller: passwordController,
                  isPassword: true,
                  validator: (val) {
                    return Validator.validatePassword(val);
                  },
                  Icon: const Icon(
                    size: 20,
                    Icons.lock,
                    color: Color(0xFFCAC6FF),
                    shadows: [
                      Shadow(color: Color(0xFF8C82FF),blurRadius: 15)
                    ],
                  ),
                  shadowColor: const Color(0xFF8C82FF),
                ),

                const SizedBox(height: 16),

                CustomSignupTextField(
                  FontWeight: FontWeight.w400,
                  hint: "Confirm Password",
                  controller: confirmPasswordController,
                  isPassword: true,
                  validator: (val) {
                    return Validator.PasswordsMatch(
                      confirmPasswordController.text,
                      passwordController.text,
                    );
                  },
                  Icon: const Icon(
                    size: 22,
                    Icons.lock_reset,
                    color: Color(0xFFCAC6FF),
                    shadows: [
                      Shadow(color: Color(0xFF8C82FF),blurRadius: 15)
                    ],
                  ),
                  shadowColor: const Color(0xFF8C82FF),
                ),

                const SizedBox(height: 20),
                ImageButton(file: context.watch<AuthCubit>().selectedImage,),

               ImageBlocbuilder(),
                const SizedBox(height: 10),

                CustomSignupButton(
                  fontSize: 27.0,
                    FontWeight: FontWeight.bold,
                    height:75.h,
                    width: 280.w,
                    text: "Signup",
                    onPressed: (){
                  context.read<AuthCubit>().Signup(nameController.text,emailController.text,context.read<AuthCubit>().selectedImage!,passwordController.text);
                }),

                const SizedBox(height: 22),

                GoogleButton(
                  onPressed: () {
                    context.read<AuthCubit>().signInWithGoogle();
                  },
                ),
                const SizedBox(height: 16),
                InkWell(
                    onTap:(){
                      context.pushNamed("/Login");
                    },
                    child: Text("Already have an account?", style: const TextStyle(
                        color: Color(0xFF9EA8FD),
                        fontSize: 16,
                        shadows: [
                          Shadow(color: Color(0xFF838FFF),offset: Offset(0, 0),blurRadius: 20)
                        ]
                    ),)
                ),
                const SizedBox(height: 10),
                const AuthBlocConsumer(),
              ],
            ),
          )
        ));

  }
}
