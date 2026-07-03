
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/features/movie_details/data/models/movie_details_response_model.dart';
import 'package:movie_app/features/profile/data/models/profile_model.dart';
import 'package:movie_app/features/profile/data/repos/profile_repo.dart';
import 'package:movie_app/features/profile/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>{

  ProfileRepo profileRepo;
  File? selectedImage;
  ProfileCubit(this.profileRepo) : super(const ProfileState.initial());

  Future<void> getUser()async {
    emit(const ProfileState.ProfileLoading());
   try{
     final doc = await profileRepo.getUser();
     final user = ProfileModel.fromJson(doc.data()!);
     emit(ProfileSuccess(user));
   }
   catch(e){
     emit(ProfileError(e.toString()));
   }
  }

  Future<void> editProfile(  String? name, String? email, File? imageFile,)async {
    try{
      await profileRepo.editProfile(name, email, imageFile);
      await getUser();
      // emit(ProfileState.EditProfileSuccess());
    } catch(e){
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> imagePicker()async{
    final ImagePicker picker = ImagePicker();
    final XFile? image  = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      selectedImage = File(image.path);

    }
  }
  }