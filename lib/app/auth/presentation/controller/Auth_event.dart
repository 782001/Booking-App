import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {}

class ProfileInfoEvent extends AuthEvent {}

class UpdateProfileEvent extends AuthEvent {
  final String name;
  final String email;
  final File? image;

  const UpdateProfileEvent(
      {required this.name, required this.email, this.image});

  @override
  List<Object?> get props => [name, email, image];
}

class GetImagePickerEvent extends AuthEvent {}
