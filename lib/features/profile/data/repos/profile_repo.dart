

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app/features/auth/data/firebase_auth_service.dart';

class ProfileRepo{
  final FirebaseAuthService authService;
  ProfileRepo(this.authService);

  Future<DocumentSnapshot<Map<String,dynamic>>> getUser() {
    return authService.getUser();
  }

  Future<void> editProfile(  String? name, String? email, File? imageFile,)async{

    await authService.editProfile(name, email, imageFile,);
  }
}