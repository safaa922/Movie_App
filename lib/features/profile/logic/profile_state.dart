import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/features/profile/data/models/profile_model.dart';


part 'profile_state.freezed.dart';
@freezed
class ProfileState with _$ProfileState{
  const factory ProfileState.initial() = _initial;
  const factory ProfileState.ProfileLoading()=ProfileLoading;
  const factory ProfileState.ProfileSuccess(ProfileModel user)=ProfileSuccess;
  // const factory ProfileState.EditProfileSuccess()=EditProfileSuccess;
  // const factory ProfileState.imagePicked(selectedImage)=imagePicked;
  const factory ProfileState.ProfileError(String message)=ProfileError;
}