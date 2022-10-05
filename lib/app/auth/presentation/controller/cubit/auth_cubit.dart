import 'dart:io';
import 'package:booking_app/app/auth/data/local/cached_helper.dart';
import 'package:booking_app/app/auth/domain/entities/auth_entity.dart';
import 'package:booking_app/app/auth/domain/use_cases/get_profile_info_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/register_usecase.dart';
import 'package:booking_app/app/auth/domain/use_cases/update_profile_usecase.dart';
import 'package:booking_app/app/auth/presentation/controller/cubit/auth_state.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetProfileInfoUseCase profileInfoUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  AuthCubit(
      {required this.profileInfoUseCase,
      required this.updateProfileUseCase,
      required this.loginUseCase,
      required this.registerUseCase})
      : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  Auth? profileInfo;
  Future getProfileInfo() async {
    emit(ProfileLoadingState());
    var response = await profileInfoUseCase(token);
    response.fold((l) {
      emit(ProfileErrorState(
        message: NetworkExceptions.getErrorMessage(l),
      ));
    }, (r) {
      profileInfo = r;
      emit(ProfileLoadedState(message: statusProfileInfo!.message));
    });
  }

  Future updateProfileInfo(
      {required String name, required String email, File? image}) async {
    emit(UpdateProfileLoadingState());

    var response = await updateProfileUseCase(UpdateProfileParameters(
      name: name,
      email: email,
      image: image,
    ));

    response.fold((l) {
      emit(UpdateProfileErrorState(
          message: NetworkExceptions.getErrorMessage(l)));
    }, (r) {
      emit(UpdateProfileLoadedState(
          message: updateProfileStatusModel!.messageEn, updateProfileInfo: r));
      getProfileInfo();
    });
  }

  var picker = ImagePicker();
  File? profileImagePicker;
  Future<void> getImagePicker() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImagePicker = File(pickedFile.path);
      emit(ImagePickerLoadedState(message: pickedFile.path));
      print(pickedFile.path);
    } else {
      emit(ImagePickerErrorState(
        message: 'No image selected.',
      ));
    }
  }

  resetPicker() {
    profileImagePicker = null;
    emit(ResetImagePicker());
  }

  Auth? loginModel;

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    var response =
        await loginUseCase(LoginParameters(email: email, password: password));
    response.fold((l) {
      emit(LoginErrorState(
        messageApi: statusModel!.messageEn,
        messageError: NetworkExceptions.getErrorMessage(l),
      ));
    }, (r) {
      loginModel = r;
      emit(LoginLoadedState(
        message: statusModel!.messageEn,
      ));
      token = r.apiToken;
      CachedHelper.saveData(key: 'token', value: r.apiToken);
    });
  }

  Auth? registerModel;
  void register(
      {required String name,
      required String email,
      required String password}) async {
    emit(RegisterLoadingState());
    var response = await registerUseCase(RegisterParameters(
      name: name,
      email: email,
      password: password,
    ));
    response.fold((l) {
      emit(RegisterErrorState(
        messageApi: registerstatusModel!.messageEn,
        messageError: NetworkExceptions.getErrorMessage(l),
      ));
    }, (r) {
      registerModel = r;
      emit(RegisterLoadedState(
        message: registerstatusModel!.messageEn,
      ));
      token = r.apiToken;
      CachedHelper.saveData(key: 'token', value: r.apiToken);
    });
  }
}
