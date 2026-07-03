import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/helpers/extensions.dart';
import 'package:movie_app/core/helpers/show_snackbar.dart';
import 'package:movie_app/features/auth/logic/auth_cubit.dart';
import 'package:movie_app/features/auth/logic/auth_state.dart';

class AuthBlocConsumer extends StatelessWidget {
  const AuthBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context,state){

          state.whenOrNull(
              LoginSuccess: (){
              context.pushNamed("/HomeScreen");
              showSnackBar(
                context,
                "Login Succeeded",
              );
            },

            SignupSuccess: (){
                context.pushNamed("/Login");
                showSnackBar(
                  context,
                  "Succeeded, an email verification message was sent to your email",
                );
            },

            AuthError: (e){
             showSnackBar(context, e.toString());
            },
            ForgotPasswordSuccess: () {
              showSnackBar(
                context,
                "Password reset email sent",
              );
            },
            EmailVerificationSuccess: () {
              showSnackBar(
                context,
                "an email-verification messages was sent to your email",
              );
            },
          );

        },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child:CircularProgressIndicator() ,
          ) ;
        }

        return const SizedBox.shrink();
      },

    );
  }


}
