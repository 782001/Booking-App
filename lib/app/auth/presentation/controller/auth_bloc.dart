import 'dart:async';
import 'dart:io';
import 'package:booking_app/app/auth/domain/use_cases/get_profile_info_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/register_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/update_profile_usecase.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_event.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_state.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final GetProfileInfoUseCase profileInfoUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.profileInfoUseCase,
    required this.updateProfileUseCase,
  }) : super(const AuthState()) {
    on<LoginEvent>(signIn);
    on<RegisterEvent>(signUp);
    on<ProfileInfoEvent>(getProfileInfo);
    on<UpdateProfileEvent>(updateProfileInfo);
    on<GetImagePickerEvent>(getImagePicker);
  }

  FutureOr<void> signIn(event, emit) async {
    var response = await loginUseCase(
        const LoginParameters(email: 'mahmoud.ashry990', password: '123456'));
    response.fold((l) {
      emit(state.copyWith(
        loginState: RequestState.error,
        loginMessage: NetworkExceptions.getErrorMessage(l),
      ));
    }, (r) {
      emit(state.copyWith(
          login: r,
          loginMessage: statusModel!.messageEn,
          loginState: RequestState.loaded));
      token = r.apiToken;
    });
  }

  FutureOr<void> signUp(RegisterEvent event, Emitter<AuthState> emit) async {
    var response = await registerUseCase(const RegisterParameters(
      name: 'mahmoud samy',
      email: 'mahmoud.samy@gmail.com',
      password: '123456',
    ));
    response.fold((l) {
      emit(state.copyWith(
        registerMessage: NetworkExceptions.getErrorMessage(l),
        registerState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        register: r,
        registerState: RequestState.loaded,
        registerMessage: registerstatusModel!.messageEn,
      ));
      token = r.apiToken;
    });
  }

  Future getProfileInfo(ProfileInfoEvent event, Emitter<AuthState> emit) async {
    // var response = await profileInfoUseCase(token);
    var response = await profileInfoUseCase(
        'YeSeI81gtSatcmT1QQyxTslQHWdYdFfXzrjCZrH7Cyd4WLwttdqhJyPXOfg2');
    response.fold((l) {
      emit(state.copyWith(
        profileInfoMessage: NetworkExceptions.getErrorMessage(l),
        profileInfoState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        profileInfo: r,
        profileInfoState: RequestState.loaded,
        profileInfoMessage: statusProfileInfo!.message,
      ));
    });
  }

// File('/data/user/0/com.example.booking_app/cache/image_picker4684716862649781102.jpg')

  FutureOr<void> updateProfileInfo(
      UpdateProfileEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(updateProfileInfoState: RequestStateUpdate.loading));

    var response = await updateProfileUseCase(UpdateProfileParameters(
      name: event.name,
      email: event.email,
      image: event.image,
    ));

    response.fold((l) {
      emit(state.copyWith(
        updateProfileInfoMessage: NetworkExceptions.getErrorMessage(l),
        updateProfileInfoState: RequestStateUpdate.error,
      ));
    }, (r) {
      emit(state.copyWith(
        profileImagePicker: null,
        profileImagePickerState: RequestState.loading,
        updateProfileInfo: r,
        updateProfileInfoState: RequestStateUpdate.loaded,
        updateProfileInfoMessage: updateProfileStatusModel!.messageEn,
      ));
    });
  }

  var picker = ImagePicker();

  FutureOr<void> getImagePicker(
      GetImagePickerEvent event, Emitter<AuthState> emit) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      emit(state.copyWith(
          profileImagePicker: File(pickedFile.path),
          profileImagePickerState: RequestState.loaded,
          profileImagePickerMessage: pickedFile.path));
      print(pickedFile.path);
    } else {
      emit(state.copyWith(
        profileImagePickerState: RequestState.error,
        profileImagePickerMessage: 'No image selected.',
      ));
    }
  }
}
