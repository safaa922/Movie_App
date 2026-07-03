
import 'dart:io';

import 'package:movie_app/features/auth/data/firebase_auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo{
  final FirebaseAuthService authService;
  AuthRepo(this.authService);

  // Future<User>Login(String Email, String Password)async{
  //   final credential = await authService.Login(Email, Password);
  //   return credential.user!;
  // }

  Future<User>Login(String Email, String Password)async{
    final credential = await authService.Login(Email, Password);
    await credential.user!.reload();
    return FirebaseAuth.instance.currentUser!;
  }

  Future<User>SignInWithGoogle()async{
    final credentials = await authService.signInWithGoogle();
    return credentials.user!;
  }

  Future<void>ForgotPassord(String Email)async{
   await authService.ForgotPassword(Email);
  }

  Future<void>EmailVerification()async{
    await authService.EmailVerification();
  }

  Future<User>Signup(String Name,String Email,File ImageFile,String Password)async{
    final credential = await authService.Signup(Name,Email,ImageFile, Password);
    return credential.user!;
  }


  }

