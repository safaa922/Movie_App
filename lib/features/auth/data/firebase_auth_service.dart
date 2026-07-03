
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:movie_app/features/auth/presentation/signup/widgets/cloudinary_service.dart';

class FirebaseAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

      Future<UserCredential>Login(String Email,String Password){
        return _auth.signInWithEmailAndPassword(
          email:Email,
          password:Password
        );
      }

      Future <UserCredential>Signup(String Name,String Email,File ImageFile, String Password)async{

        final credential = await _auth.createUserWithEmailAndPassword(
            email: Email, password: Password
        );
        final imageUrl = await CloudinaryService().uploadImage(ImageFile);
        await FirebaseFirestore.instance.collection("Users").doc(credential.user!.uid).set(
          {
            "Name":Name,
            "Email":Email,
            "ImageUrl":imageUrl
          }
        );
       await EmailVerification();
        return credential;

      }

      Future<void>EmailVerification()async{
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      }

      Future<void>ForgotPassword(String Email)async{
        await _auth.sendPasswordResetEmail(email: Email);
      }

      Future<UserCredential>signInWithGoogle() async {
       final GoogleSignInAccount? googleUser=  await GoogleSignIn().signIn();
       if(googleUser==null){
         throw Exception("Google sign in cancelled");
       }
       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
       final credentials = GoogleAuthProvider.credential(
         accessToken: googleAuth.accessToken,
         idToken: googleAuth.idToken,
       );


        final userCredential = await _auth.signInWithCredential(credentials);
        await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid)
       .set({
          "Name":userCredential.user!.displayName,
          "Email":userCredential.user!.email,
          "ImageUrl":userCredential.user!.photoURL
        },
          SetOptions(merge: true)
        );
        return userCredential;
      }


      Future<DocumentSnapshot<Map<String,dynamic>>> getUser(){
      return FirebaseFirestore.instance.collection("Users").doc(_auth.currentUser!.uid).get();
      }

      Future<void> editProfile(  String? name, String? email, File? imageFile,)async{
        final uid = _auth.currentUser!.uid;
        final Map<String,dynamic> data = {};
        if(name!=null){
          data["Name"]=name;
        }
        if(email!=null){
          data["Email"]=email;
          await _auth.currentUser!.updateEmail(email);
        }

        if (imageFile != null) {
          final imageUrl = await CloudinaryService().uploadImage(imageFile);
          data["ImageUrl"] = imageUrl;
        }

        if(data.isNotEmpty){
          await FirebaseFirestore.instance.collection("Users").doc(uid).update(data);
        }
      }
}