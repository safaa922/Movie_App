

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
@freezed
class AuthState with _$AuthState{
  const factory AuthState.initial() = _initial;
  const factory AuthState.AuthLoading()=AuthLoading;
  const factory AuthState.LoginSuccess()=LoginSuccess;
  const factory AuthState.SignupSuccess()=SignupSuccess;
  const factory AuthState.SignoutSuccess() = SignoutSuccess;
  const factory AuthState.ForgotPasswordSuccess()=ForgotPasswordSuccess;
  const factory AuthState.EmailVerificationSuccess()=EmailVerificationSuccess;
  const factory AuthState.AuthError(String message)=AuthError;
  const factory AuthState.ImagePicked(selectedImage)=ImagePicked;
}