import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/auth_bloc_consumer.dart';
import 'package:movie_app/features/auth/presentation/login/widgets/email_and_password.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Stack(
         children: [
           Container(
             decoration:BoxDecoration(
               image:  DecorationImage(image: AssetImage("assets/images/Login.jpg"),fit: BoxFit.fill,),
             ),
           ),
           AuthBlocConsumer(),
           EmailAndPassword(),
         ],
      )
    );
  }
}