import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routing/app_router.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/signup/widgets/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: const Form(
        child: SignupForm(),
      )
    );
  }
}