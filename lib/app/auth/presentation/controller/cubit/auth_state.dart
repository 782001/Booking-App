import 'package:booking_app/app/auth/domain/entities/auth_entity.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class ProfileLoadingState extends AuthState {}

class ProfileErrorState extends AuthState {
  final String message;

  ProfileErrorState({required this.message});
}

class ProfileLoadedState extends AuthState {
  final String message;

  ProfileLoadedState({this.message = ''});
}

class UpdateProfileLoadingState extends AuthState {}

class UpdateProfileErrorState extends AuthState {
  final String message;

  UpdateProfileErrorState({required this.message});
}

class UpdateProfileLoadedState extends AuthState {
  final Auth? updateProfileInfo;
  final String message;

  UpdateProfileLoadedState({this.updateProfileInfo, this.message = ''});
}

class ImagePickerErrorState extends AuthState {
  final String message;

  ImagePickerErrorState({required this.message});
}

class ImagePickerLoadedState extends AuthState {
  final String message;

  ImagePickerLoadedState({this.message = ''});
}

class ResetImagePicker extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginErrorState extends AuthState {
  final String messageApi;
  final String messageError;

  LoginErrorState({required this.messageError, required this.messageApi});
}

class LoginLoadedState extends AuthState {
  final String message;

  LoginLoadedState({this.message = ''});
}

class RegisterLoadingState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String messageApi;
  final String messageError;

  RegisterErrorState({required this.messageError, required this.messageApi});
}

class RegisterLoadedState extends AuthState {
  final String message;

  RegisterLoadedState({this.message = ''});
}
