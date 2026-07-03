import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/routing/app_router.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';

class ForgotPassword extends StatelessWidget {
  final String email;
  const ForgotPassword({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        email.trim();
        context.read<AuthCubit>().ForgotPassword(email);
      },
      child: Text("Forgot Password?", style: const TextStyle(
          color: Colors.white,
          shadows: [
            Shadow(color: Color(0xFFFF8945),offset: Offset(0, 0),blurRadius: 20)
          ]
      ),)
    );
  }
}
