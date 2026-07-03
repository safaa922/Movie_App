
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/auth/data/auth_repo.dart';
import 'package:movie_app/features/auth/logic/auth_state.dart';
import 'package:image_picker/image_picker.dart';

 class AuthCubit extends Cubit<AuthState>{
final AuthRepo authRepo;
final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();

TextEditingController LoginEmailController = TextEditingController() ;
TextEditingController LoginPasswordController =TextEditingController() ;
GlobalKey<FormState> LoginFormKey = GlobalKey();

AuthCubit(this.authRepo):super(AuthState.initial());

File? selectedImage;

Future<void>Login(String Email, String Password)async{
  emit(AuthLoading());
 try{
   if(LoginFormKey.currentState!.validate()) {

       // await authRepo.Login(Email, Password);
       // emit(LoginSuccess());

     final user = await authRepo.Login(Email, Password);
     if(!user.emailVerified){
       await FirebaseAuth.instance.signOut();
       emit(const AuthState.AuthError(
         "Please verify your email before logging in.",
       ));
       return;
     }
     emit(LoginSuccess());
   }
   else{
     emit(AuthError("Please fill the form correctly"));
   }
 }

  on FirebaseAuthException catch (e) {
  switch (e.code) {
  case 'wrong-password':
  case 'invalid-credential':
  emit(const AuthState.AuthError("Incorrect email or password."));
  break;

  case 'user-not-found':
  emit(const AuthState.AuthError("No account found with this email."));
  break;

  case 'invalid-email':
  emit(const AuthState.AuthError("Please enter a valid email."));
  break;

  case 'too-many-requests':
  emit(const AuthState.AuthError(
  "Too many attempts. Please try again later."));
  break;

  default:
  emit(AuthState.AuthError(e.message ?? "Authentication failed."));
  }
  }}

Future<void>signInWithGoogle()async{
  emit(AuthLoading());
  try{
    await authRepo.SignInWithGoogle();
    emit(LoginSuccess());
  }
  catch(e){
    emit(AuthError(e.toString()));
  }
}


Future<void>Signup(String Name,String Email,File ImageFile, String Password,)async{
  emit(AuthLoading());
  if(formKey.currentState!.validate()){
      try {
        await authRepo.Signup(Name, Email,ImageFile, Password);
        emit(SignupSuccess());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    }
  else{
    emit(AuthError("please fill the form correctly"));
  }
  }

Future<void>ForgotPassword(String email)async{
  emit(AuthLoading());
  try{
    await authRepo.ForgotPassord(email);
    emit(ForgotPasswordSuccess());
  }
  catch(e){
    emit(AuthError(e.toString()));
  }
}

Future<void>SendEmailVerification()async{
  emit(AuthLoading());
  try{
   await authRepo.EmailVerification();
    emit(EmailVerificationSuccess());
  }
  catch(e){
    emit(AuthError(e.toString()));
  }
}


Future<void> imagePicker()async{
  final ImagePicker picker = ImagePicker();
  final XFile? img = await picker.pickImage(source: ImageSource.gallery);
  if(img!=null) {
    selectedImage = File(img.path);
    emit(ImagePicked(selectedImage));
  }

}
}